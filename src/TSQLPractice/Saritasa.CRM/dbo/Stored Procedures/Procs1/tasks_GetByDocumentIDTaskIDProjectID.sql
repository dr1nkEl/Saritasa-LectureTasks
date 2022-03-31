
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tasks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetByDocumentIDTaskIDProjectID]
(

	@DocumentId bigint   ,

	@TaskID bigint   ,

	@ProjectId int   
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
					[DocumentId] = @DocumentId
					AND [taskID] = @TaskID
					AND [ProjectId] = @ProjectId
				SELECT @@ROWCOUNT