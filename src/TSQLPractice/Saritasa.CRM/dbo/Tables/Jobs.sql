CREATE TABLE [dbo].[Jobs] (
    [jobID]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [Billable]    BIT             NOT NULL,
    [Description] NVARCHAR (4000) NOT NULL,
    [Duration]    INT             NOT NULL,
    [TargetId]    BIGINT          NOT NULL,
    [CreatedBy]   INT             NOT NULL,
    [ClientId]    INT             NULL,
    [ProjectId]   INT             NULL,
    [JobDate]     DATE            NOT NULL,
    [IsError]     TINYINT         CONSTRAINT [DF_jobs_error] DEFAULT ((0)) NOT NULL,
    [ErrorBy]     INT             NULL,
    [ErrorReason] VARCHAR (100)   NULL,
    [WorkType]    INT             NULL,
    [UpdatedAt]   DATETIME        DEFAULT (getdate()) NOT NULL,
    [JobType]     NVARCHAR (150)  NOT NULL,
    CONSTRAINT [PK_jobID] PRIMARY KEY CLUSTERED ([jobID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_job_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_job_user_createdBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Jobs_Clientd_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_jobs_lookup_workTypes] FOREIGN KEY ([WorkType]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID]),
    CONSTRAINT [FK_Jobs_Projects_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);


GO
CREATE NONCLUSTERED INDEX [IX_Jobs_clientID]
    ON [dbo].[Jobs]([ClientId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_jobs_createdBy]
    ON [dbo].[Jobs]([CreatedBy] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_jobs_jobDate]
    ON [dbo].[Jobs]([JobDate] ASC)
    INCLUDE([TargetId]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_Jobs_projectID]
    ON [dbo].[Jobs]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_jobs_targetID]
    ON [dbo].[Jobs]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_jobs_jobDate_projectID_workType]
    ON [dbo].[Jobs]([JobDate] ASC, [ProjectId] ASC, [WorkType] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1377856421_1_8_11_12_24]
    ON [dbo].[Jobs]([jobID], [CreatedBy], [ClientId], [ProjectId], [WorkType]);


GO
CREATE STATISTICS [_dta_stat_1377856421_1_8_7_11_12_24]
    ON [dbo].[Jobs]([jobID], [CreatedBy], [TargetId], [ClientId], [ProjectId], [WorkType]);


GO
CREATE STATISTICS [_dta_stat_1377856421_12_1]
    ON [dbo].[Jobs]([ProjectId], [jobID]);


GO
CREATE STATISTICS [_dta_stat_1377856421_16_1_12]
    ON [dbo].[Jobs]([JobDate], [jobID], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1377856421_16_12]
    ON [dbo].[Jobs]([JobDate], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1377856421_19_1]
    ON [dbo].[Jobs]([IsError], [jobID]);


GO
CREATE STATISTICS [_dta_stat_1377856421_20_19]
    ON [dbo].[Jobs]([ErrorBy], [IsError]);


GO
CREATE STATISTICS [_dta_stat_1377856421_4_20_19]
    ON [dbo].[Jobs]([Billable], [ErrorBy], [IsError]);


GO
CREATE STATISTICS [_dta_stat_1377856421_7_1]
    ON [dbo].[Jobs]([TargetId], [jobID]);


GO
CREATE STATISTICS [_dta_stat_1377856421_8_1_16]
    ON [dbo].[Jobs]([CreatedBy], [jobID], [JobDate]);


GO
CREATE STATISTICS [_dta_stat_1377856421_8_1_19]
    ON [dbo].[Jobs]([CreatedBy], [jobID], [IsError]);


GO
CREATE STATISTICS [_dta_stat_1377856421_8_12_1_16]
    ON [dbo].[Jobs]([CreatedBy], [ProjectId], [jobID], [JobDate]);


GO
CREATE STATISTICS [_dta_stat_1377856421_8_16_12]
    ON [dbo].[Jobs]([CreatedBy], [JobDate], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1377856421_8_7]
    ON [dbo].[Jobs]([CreatedBy], [TargetId]);


GO
--======================================================================================================
CREATE TRIGGER [dbo].[InsertJobs]  ON  [dbo].[jobs]  AFTER INSERT
AS BEGIN
  declare @jobID bigint
  declare @projID bigint
  declare @clID bigint
  declare @targetID int  
  
  select @jobID=jobID, @targetID = targetID  from  inserted
  select @projID=projectID, @clID=clientID from  documents where documentID= @targetID 
  
  update Jobs set 
    clientID = @clID,
    projectID =  @projID
  where @jobID=jobID;
  
  exec _jobs_setNewManHours @projID, @targetID;
END
GO
/*
 * Recalculate project hours if date, billable or duration has changed
 */

CREATE TRIGGER [dbo].[RecalculateProjectHoursOnJobsUpdate] ON [dbo].[jobs] AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    declare @jobID bigint
    declare @oldtargetID bigint
	declare @newtargetID bigint
	declare @oldDuration int
	declare @newDuration int
	declare @oldProjectID bigint
	declare @newProjectID bigint
	declare @clID bigint
		
    -- Insert statements for trigger here
	select @jobID = jobID, @oldtargetID = targetID, @oldProjectID = projectID, @oldDuration = duration from deleted;
	select @newtargetID = targetID, @newDuration = duration, @newProjectID = projectID from inserted where @jobID = jobID;

	-- set parent project and client id and recalculate man hours for task and project (old and new)
	if (@oldtargetID <> @newtargetID or @oldProjectID <> @newProjectID)	
	begin
	  if (@oldtargetID <> @newtargetID)
	  begin
	    select @newProjectID=projectID, @clID=clientID from documents where documentID= @newtargetID;
	    update Jobs set clientID = @clID, projectID = @newProjectID where @jobID=jobID;
	  end
	end
	else if (@oldDuration <> @newDuration)
		exec _jobs_setNewManHours @oldProjectID, @oldtargetID;

	-- recalculate project hours if date, billable or duration has changed
	declare @billableChanged bit = 0, @dateChanged bit = 0, @durationChanged bit = 0;
	select top 1
		@billableChanged = case inserted.billable when deleted.billable then 0 else 1 end,
		@dateChanged = case inserted.jobDate when deleted.jobDate then 0 else 1 end,
		@durationChanged = case inserted.duration when deleted.duration then 0 else 1 end
	from
		inserted, deleted;

	if (@billableChanged = 1 or @dateChanged = 1 or @durationChanged = 1)
	begin
		declare @jobProjectID int = (select projectID from inserted where @jobID = jobID);
		exec _jobs_setNewManHours @jobProjectID, null;
	end;
END
GO
CREATE TRIGGER dbo.[jobs_AspNet_SqlCacheNotification_Trigger] ON [jobs]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'jobs'
                       END
GO

CREATE TRIGGER [dbo].[jobs_insupd]
   ON  [dbo].[jobs]
   FOR INSERT, UPDATE
AS 
BEGIN
	declare @closedMonthLastDay datetime, @jobDate datetime, @oldDate datetime = null;
	
	-- TODO: actually inserted and deleted tables can have more than one record!
	select @closedMonthLastDay = [dbo].[LastDayMonth]([date]) from document_calcs_date where typeID = 'lastClosedMonth';
	select @jobDate = [dbo].[DateOnly](jobDate) from inserted;
	select @oldDate = [dbo].[DateOnly](jobDate) from deleted;

	if (@closedMonthLastDay >= @oldDate)
	begin
		declare @billableChanged bit = 0, @dateChanged bit = 0, @textChanged bit = 0, @durationChanged bit = 0;

		select top 1
			@billableChanged = case inserted.billable when deleted.billable then 0 else 1 end,
			@dateChanged = case inserted.jobDate when deleted.jobDate then 0 else 1 end,
			@textChanged = case inserted.[description] when deleted.[description] then 0 else 1 end,
			@durationChanged = case inserted.duration when deleted.duration then 0 else 1 end
		from
			inserted, deleted;

		if (@billableChanged = 1 or @dateChanged = 1 or @textChanged = 1 or @durationChanged = 1)
		begin
			raiserror('You cannot add or update jobs for closed months.', 16, 1)
			rollback transaction
		end;
	end
END