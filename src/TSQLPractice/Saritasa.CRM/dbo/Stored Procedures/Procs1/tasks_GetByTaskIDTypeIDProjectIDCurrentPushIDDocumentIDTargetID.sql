
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tasks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetByTaskIDTypeIDProjectIDCurrentPushIDDocumentIDTargetID]
(

	@TaskID bigint   ,

	@TypeId char (2)  ,

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
					[taskID] = @TaskID
					AND [TypeId] = @TypeId
					AND [ProjectId] = @ProjectId
					AND [CurrentPushId] = @CurrentPushId
					AND [DocumentId] = @DocumentId
					AND [TargetId] = @TargetId
				SELECT @@ROWCOUNT