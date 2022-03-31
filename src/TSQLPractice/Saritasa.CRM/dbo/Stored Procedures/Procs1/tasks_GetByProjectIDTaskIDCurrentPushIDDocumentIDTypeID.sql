
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tasks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetByProjectIDTaskIDCurrentPushIDDocumentIDTypeID]
(

	@ProjectId int   ,

	@TaskID bigint   ,

	@CurrentPushId bigint   ,

	@DocumentId bigint   ,

	@TypeId char (2)  
)
AS


				SELECT
					[taskID],
					[Title],
					[TaskText],
					[StartDate],
					[FinishDate],
					[TypeId],
					[DocumentId],
					[TargetId],
					[Billable],
					[DurationLimit],
					[ClientId],
					[ProjectId],
					[TesterId],
					[IsContainer],
					[MayAddJobs],
					[WorkType],
					[MakeJobsBillable],
					[BillableMenHours],
					[NonBillableMenHours],
					[EmailMessageId],
					[CurrentPushId],
					[TechnicalManagerId],
					[TaskVerifyId],
					[DepartmentId],
					[Priority],
					[LastestReestimationId],
					[LastestReestimationLimitType],
					[LastestReestimationDueDateType],
					[SprintId],
					[FeatureId],
					[LastestReestimationDateTime],
					[MenHours]
				FROM
					[dbo].[Tasks]
				WHERE
					[ProjectId] = @ProjectId
					AND [taskID] = @TaskID
					AND [CurrentPushId] = @CurrentPushId
					AND [DocumentId] = @DocumentId
					AND [TypeId] = @TypeId
				SELECT @@ROWCOUNT