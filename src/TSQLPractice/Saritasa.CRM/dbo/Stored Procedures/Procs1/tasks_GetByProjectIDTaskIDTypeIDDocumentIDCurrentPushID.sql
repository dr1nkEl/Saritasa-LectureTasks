
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tasks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetByProjectIDTaskIDTypeIDDocumentIDCurrentPushID]
(

	@ProjectId int   ,

	@TaskID bigint   ,

	@TypeId char (2)  ,

	@DocumentId bigint   ,

	@CurrentPushId bigint   
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
					AND [TypeId] = @TypeId
					AND [DocumentId] = @DocumentId
					AND [CurrentPushId] = @CurrentPushId
				SELECT @@ROWCOUNT