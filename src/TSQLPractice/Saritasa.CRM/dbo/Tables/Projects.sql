CREATE TABLE [dbo].[Projects] (
    [projectID]            INT            IDENTITY (1, 1) NOT NULL,
    [StartDate]            DATETIME       NULL,
    [ProposedFinishDate]   DATETIME       NULL,
    [DevSite]              VARCHAR (255)  NULL,
    [ActualSite]           VARCHAR (255)  NULL,
    [ActualFinishDate]     DATETIME       NULL,
    [Description]          VARCHAR (3000) NULL,
    [Title]                VARCHAR (100)  NULL,
    [ParentProjectId]      INT            NULL,
    [Notes]                VARCHAR (MAX)  NULL,
    [CompleteLine]         TINYINT        NULL,
    [DocumentId]           BIGINT         NOT NULL,
    [DiscountId]           INT            NULL,
    [UserId]               INT            NOT NULL,
    [ClientId]             INT            NOT NULL,
    [Billable]             BIT            CONSTRAINT [DF_projects_billable] DEFAULT ((1)) NOT NULL,
    [DurationLimit]        INT            DEFAULT ((0)) NOT NULL,
    [MailMan]              VARCHAR (100)  NULL,
    [ShowClient]           BIT            CONSTRAINT [DF_projects_showClient] DEFAULT ((0)) NOT NULL,
    [Priority]             CHAR (1)       NULL,
    [HasHosting]           BIT            CONSTRAINT [DF_projects_hasHosting] DEFAULT ((0)) NOT NULL,
    [HostingFee]           DECIMAL (9, 2) NULL,
    [BillingType]          CHAR (1)       NULL,
    [Frequency]            VARCHAR (3)    NULL,
    [PriorityId]           INT            NULL,
    [HostingStart]         DATETIME       NULL,
    [HostingFrequency]     VARCHAR (3)    NULL,
    [LimitHistory]         VARCHAR (3000) NULL,
    [Send75Limit]          BIT            NULL,
    [SendLimitExceed]      BIT            NULL,
    [Send125Limit]         BIT            NULL,
    [Send150Limit]         BIT            NULL,
    [MobileAleas]          VARCHAR (50)   NULL,
    [MinHoursPerMonth]     INT            NULL,
    [BillableMenHours]     INT            NULL,
    [NonBillableMenHours]  INT            NULL,
    [Utilization]          BIT            CONSTRAINT [DF_projects_utilization] DEFAULT ((0)) NOT NULL,
    [BillingVariable]      BIT            CONSTRAINT [DF_projects_billingVariable] DEFAULT ((0)) NOT NULL,
    [Overbudget]           BIT            DEFAULT ((0)) NOT NULL,
    [DevelopmentStartDate] DATETIME       NULL,
    [Launched]             BIT            DEFAULT ((0)) NOT NULL,
    [DevelopmentStarted]   BIT            DEFAULT ((0)) NOT NULL,
    [JiraAllowAddJobs]     BIT            DEFAULT ((0)) NOT NULL,
    [IsMidProjectSurvey]   BIT            DEFAULT ((0)) NOT NULL,
    [MenHours]             AS             ([BillableMenHours]+[NonBillableMenHours]),
    [ZohoPotentialId]      BIGINT         NULL,
    [EnvironmentCode]      VARCHAR (50)   DEFAULT ('') NOT NULL,
    [Nickname]             VARCHAR (100)  DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_projectID] PRIMARY KEY CLUSTERED ([projectID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_project_client_clientID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_project_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_project_project_parentProjectID] FOREIGN KEY ([ParentProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_project_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_projects_projectPriority] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[ProjectPriority] ([priorityID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_projects_documentID]
    ON [dbo].[Projects]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_projects_userID]
    ON [dbo].[Projects]([UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_projects_clientID]
    ON [dbo].[Projects]([ClientId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1760477796_16_1]
    ON [dbo].[Projects]([Billable], [projectID]);


GO
CREATE STATISTICS [_dta_stat_1760477796_8_1]
    ON [dbo].[Projects]([Title], [projectID]);


GO
CREATE STATISTICS [_dta_stat_1760477796_1_15]
    ON [dbo].[Projects]([projectID], [ClientId]);


GO
CREATE STATISTICS [_dta_stat_1760477796_1_12_15]
    ON [dbo].[Projects]([projectID], [DocumentId], [ClientId]);


GO

/*
--old
ALTER TRIGGER [dbo].[InsertProjectLinks] 
   ON  [dbo].[projects]
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @projectID int
    declare @extDBID int
    declare @documentID bigint        
    declare @newClientID int

    select @newClientID=clientID,@projectID=projectID,@documentID=documentID from inserted

    select @extDBID= d.externalDBID 
     from clients c 
     join documents d on c.documentID = d.documentID 
     where c.clientID=@newClientID
        
    update documents set 
    clientID = @newClientID,
    externalDBID = @extDBID,
    projectID = @projectID,
    objectID = @projectID
    where documentID=@documentID
END
*/



create TRIGGER InsertProjectLinks 
   ON  projects
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @projectID int
    declare @documentID bigint        
    declare @newClientID int

    select @newClientID=clientID,@projectID=projectID,@documentID=documentID from inserted      
        
    update documents set 
    clientID = @newClientID,    
    projectID = @projectID,
    objectID = @projectID
    where documentID=@documentID
END

GO
/*
 * Fix [UpdateProjectLinks] trigger.
 */

CREATE TRIGGER [dbo].[UpdateProjectLinks] ON [dbo].[projects] AFTER UPDATE
AS 
BEGIN
    SET NOCOUNT ON;
    declare @projectID int;
    declare @oldClientID int;
    declare @newClientID int;
    declare @oldMH int;
    declare @newMH int;

	declare @records table
	(
		projectID int not null,
		processed bit default 0
	)
	insert into @records
	select inserted.projectID, 0 from inserted
	inner join deleted on inserted.projectID = deleted.projectID;

	while (select count(*) from @records where processed = 0) > 0
	begin
		select top 1 @projectID = projectID from @records where processed = 0;

		select @oldClientID = clientID, @oldMH = billableMenHours from deleted where projectID = @projectID;
		select @newClientID = clientID, @newMH = billableMenHours from inserted where projectID = @projectID;

		if (@oldClientID <> @newClientID)
		begin
			update documents set clientID = @newClientID where projectID = @projectID;
			update tasks set clientID = @newClientID where projectID = @projectID;
			update jobs set clientID = @newClientID where projectID = @projectID;        
		end
    
		if (@newMH <> @oldMH)
		begin
			exec _jobs_updateProjectDuration @projectID;
		end

		update @records set processed = 1 where projectID = @projectID;
	end;
END
