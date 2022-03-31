CREATE TABLE [dbo].[Tasks] (
    [taskID]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [Title]                          NVARCHAR (255) NOT NULL,
    [TaskText]                       NVARCHAR (MAX) NULL,
    [StartDate]                      DATETIME       NULL,
    [FinishDate]                     DATETIME       NULL,
    [TypeId]                         CHAR (2)       NOT NULL,
    [DocumentId]                     BIGINT         NOT NULL,
    [TargetId]                       BIGINT         NOT NULL,
    [Billable]                       BIT            NOT NULL,
    [DurationLimit]                  INT            NULL,
    [ClientId]                       INT            NULL,
    [ProjectId]                      INT            NULL,
    [TesterId]                       INT            NULL,
    [IsContainer]                    BIT            CONSTRAINT [DF_tasks_isContainer] DEFAULT ((0)) NOT NULL,
    [MayAddJobs]                     BIT            CONSTRAINT [DF_tasks_mayAddJobs] DEFAULT ((1)) NOT NULL,
    [WorkType]                       INT            NULL,
    [MakeJobsBillable]               BIT            CONSTRAINT [DF_tasks_makeJobsBillable] DEFAULT ((0)) NOT NULL,
    [BillableMenHours]               INT            NULL,
    [NonBillableMenHours]            INT            NULL,
    [EmailMessageId]                 VARCHAR (200)  CONSTRAINT [DF_tasks_messageID] DEFAULT ('') NOT NULL,
    [CurrentPushId]                  BIGINT         NULL,
    [TechnicalManagerId]             INT            NULL,
    [TaskVerifyId]                   BIGINT         NULL,
    [DepartmentId]                   INT            NULL,
    [Priority]                       INT            DEFAULT ((5)) NOT NULL,
    [LastestReestimationId]          BIGINT         NULL,
    [LastestReestimationLimitType]   INT            DEFAULT ((0)) NULL,
    [LastestReestimationDueDateType] INT            DEFAULT ((0)) NULL,
    [SprintId]                       INT            NULL,
    [FeatureId]                      INT            NULL,
    [LastestReestimationDateTime]    DATETIME       NULL,
    [MenHours]                       AS             ([BillableMenHours]+[NonBillableMenHours]),
    CONSTRAINT [PK_taskID] PRIMARY KEY CLUSTERED ([taskID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_task_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_task_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_task_ltt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_task_types] ([typeID]),
    CONSTRAINT [FK_tasks_lookup_departments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[LookupDepartments] ([Id]),
    CONSTRAINT [FK_tasks_lookup_workTypes] FOREIGN KEY ([WorkType]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID]),
    CONSTRAINT [FK_tasks_project_features] FOREIGN KEY ([FeatureId]) REFERENCES [dbo].[project_features] ([Id]),
    CONSTRAINT [FK_tasks_project_sprints] FOREIGN KEY ([SprintId]) REFERENCES [dbo].[project_sprints] ([Id]),
    CONSTRAINT [FK_tasks_task_push] FOREIGN KEY ([CurrentPushId]) REFERENCES [dbo].[task_push] ([pushID]),
    CONSTRAINT [FK_tasks_task_reestimations_lastestReestimationId] FOREIGN KEY ([LastestReestimationId]) REFERENCES [dbo].[task_reestimations] ([Id]),
    CONSTRAINT [FK_tasks_task_verify_stack] FOREIGN KEY ([TaskVerifyId]) REFERENCES [dbo].[task_verify_stack] ([taskVerifyID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tasks_documentID]
    ON [dbo].[Tasks]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_tasks_emailMessageID]
    ON [dbo].[Tasks]([EmailMessageId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_tasks_projectID]
    ON [dbo].[Tasks]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_tasks_targetID]
    ON [dbo].[Tasks]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_10_11_9_35]
    ON [dbo].[Tasks]([taskID], [DocumentId], [TargetId], [TypeId], [CurrentPushId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_10_11_9_35_18]
    ON [dbo].[Tasks]([taskID], [DocumentId], [TargetId], [TypeId], [CurrentPushId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_10_38_9_18]
    ON [dbo].[Tasks]([taskID], [DocumentId], [DepartmentId], [TypeId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_11_10]
    ON [dbo].[Tasks]([taskID], [TargetId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_18]
    ON [dbo].[Tasks]([taskID], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_18_35_10_9]
    ON [dbo].[Tasks]([taskID], [ProjectId], [CurrentPushId], [DocumentId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_18_35_10_9_11]
    ON [dbo].[Tasks]([taskID], [ProjectId], [CurrentPushId], [DocumentId], [TypeId], [TargetId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_18_35_10_9_8]
    ON [dbo].[Tasks]([taskID], [ProjectId], [CurrentPushId], [DocumentId], [TypeId], [FinishDate]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_18_38]
    ON [dbo].[Tasks]([taskID], [ProjectId], [DepartmentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_18_9_10]
    ON [dbo].[Tasks]([taskID], [ProjectId], [TypeId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_35_18]
    ON [dbo].[Tasks]([taskID], [CurrentPushId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_35_38_9_18_10]
    ON [dbo].[Tasks]([taskID], [CurrentPushId], [DepartmentId], [TypeId], [ProjectId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_35_9]
    ON [dbo].[Tasks]([taskID], [CurrentPushId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_38]
    ON [dbo].[Tasks]([taskID], [DepartmentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_8]
    ON [dbo].[Tasks]([taskID], [FinishDate]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_8_10]
    ON [dbo].[Tasks]([taskID], [FinishDate], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_8_10_11]
    ON [dbo].[Tasks]([taskID], [FinishDate], [DocumentId], [TargetId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_9_10_35]
    ON [dbo].[Tasks]([taskID], [TypeId], [DocumentId], [CurrentPushId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_9_10_35_18]
    ON [dbo].[Tasks]([taskID], [TypeId], [DocumentId], [CurrentPushId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_1_9_35_18]
    ON [dbo].[Tasks]([taskID], [TypeId], [CurrentPushId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_1_11]
    ON [dbo].[Tasks]([DocumentId], [taskID], [TargetId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_1_11_18_9]
    ON [dbo].[Tasks]([DocumentId], [taskID], [TargetId], [ProjectId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_1_18_35_9_11]
    ON [dbo].[Tasks]([DocumentId], [taskID], [ProjectId], [CurrentPushId], [TypeId], [TargetId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_11_1_18_35]
    ON [dbo].[Tasks]([DocumentId], [TargetId], [taskID], [ProjectId], [CurrentPushId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_18_1_38]
    ON [dbo].[Tasks]([DocumentId], [ProjectId], [taskID], [DepartmentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_4_1]
    ON [dbo].[Tasks]([DocumentId], [Title], [taskID]);


GO
CREATE STATISTICS [_dta_stat_1957334483_10_9]
    ON [dbo].[Tasks]([DocumentId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_11_1_8_10]
    ON [dbo].[Tasks]([TargetId], [taskID], [FinishDate], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_11_10_4_1]
    ON [dbo].[Tasks]([TargetId], [DocumentId], [Title], [taskID]);


GO
CREATE STATISTICS [_dta_stat_1957334483_14_1]
    ON [dbo].[Tasks]([Billable], [taskID]);


GO
CREATE STATISTICS [_dta_stat_1957334483_18_1_10_35]
    ON [dbo].[Tasks]([ProjectId], [taskID], [DocumentId], [CurrentPushId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_18_10]
    ON [dbo].[Tasks]([ProjectId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_18_35_1_10_11]
    ON [dbo].[Tasks]([ProjectId], [CurrentPushId], [taskID], [DocumentId], [TargetId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_18_35_1_9_11_8]
    ON [dbo].[Tasks]([ProjectId], [CurrentPushId], [taskID], [TypeId], [TargetId], [FinishDate]);


GO
CREATE STATISTICS [_dta_stat_1957334483_18_38_9_1]
    ON [dbo].[Tasks]([ProjectId], [DepartmentId], [TypeId], [taskID]);


GO
CREATE STATISTICS [_dta_stat_1957334483_18_9_1_10]
    ON [dbo].[Tasks]([ProjectId], [TypeId], [taskID], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_35_1_10]
    ON [dbo].[Tasks]([CurrentPushId], [taskID], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_35_1_18_10_9_11_8]
    ON [dbo].[Tasks]([CurrentPushId], [taskID], [ProjectId], [DocumentId], [TypeId], [TargetId], [FinishDate]);


GO
CREATE STATISTICS [_dta_stat_1957334483_35_1_18_10_9_8]
    ON [dbo].[Tasks]([CurrentPushId], [taskID], [ProjectId], [DocumentId], [TypeId], [FinishDate]);


GO
CREATE STATISTICS [_dta_stat_1957334483_38_9_1_10_35]
    ON [dbo].[Tasks]([DepartmentId], [TypeId], [taskID], [DocumentId], [CurrentPushId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_8_35_1_10_9]
    ON [dbo].[Tasks]([FinishDate], [CurrentPushId], [taskID], [DocumentId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_8_35_1_18_10]
    ON [dbo].[Tasks]([FinishDate], [CurrentPushId], [taskID], [ProjectId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_9_1_38]
    ON [dbo].[Tasks]([TypeId], [taskID], [DepartmentId]);


GO
CREATE STATISTICS [_dta_stat_1957334483_9_10_35]
    ON [dbo].[Tasks]([TypeId], [DocumentId], [CurrentPushId]);


GO

/*
 * Remove task_links table.
 */
CREATE TRIGGER [dbo].[InsertTaskLinks] 
   ON  [dbo].[tasks] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @taskID bigint
	declare @docID bigint 
	
	select @taskID=taskID, @docID=documentID from inserted		
    -- Insert statements for trigger here
	exec _tasks_setProjAndClientID  @taskID	
	
	update documents set 
	objectID = @taskID
	where documentID=@docID
END
GO

/*
 * Remove task_links table.
 */
CREATE TRIGGER [dbo].[UpdateTaskLinks] ON [dbo].[tasks] AFTER UPDATE
AS 
BEGIN
    declare @taskID bigint;
	declare @oldtypeID char(3);
	declare @newtypeID char(3);
    declare @oldtargetID bigint;
    declare @oldProjectID bigint;
    declare @newProjectID bigint;
	declare @newtargetID bigint;
    declare @newparentID bigint;

	if (select count(*) from inserted inner join deleted on inserted.taskID = deleted.taskID where inserted.projectID != deleted.projectID) > 0
	begin
		declare @records table
		(
			taskID bigint not null,
			processed bit default 0
		)
		insert into @records
		select inserted.taskID, 0 from inserted
		inner join deleted on inserted.taskID = deleted.taskID
		where inserted.projectID != deleted.projectID;

		while (select count(*) from @records where processed = 0) > 0
		begin
			select top 1 @taskID = taskID from @records where processed = 0;

			exec _tasks_setProjAndClientID @taskID;
			exec _jobs_setNewManHours @oldProjectID, null;
			exec _jobs_setNewManHours @newProjectID, null;

			update @records set processed = 1 where taskID = @taskID;
		end;
	end
END
GO
CREATE TRIGGER dbo.[tasks_AspNet_SqlCacheNotification_Trigger] ON [tasks]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'tasks'
                       END