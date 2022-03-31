
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tasks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetByTypeIDTaskIDProjectIDCurrentPushIDDocumentIDTargetID]
(

	@TypeId char (2)  ,

	@TaskID bigint   ,

	@ProjectId int   ,

	@CurrentPushId bigint   ,

	@DocumentId bigint   ,

	@TargetId bigint   
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
					[TypeId] = @TypeId
					AND [taskID] = @TaskID
					AND [ProjectId] = @ProjectId
					AND [CurrentPushId] = @CurrentPushId
					AND [DocumentId] = @DocumentId
					AND [TargetId] = @TargetId
				SELECT @@ROWCOUNT