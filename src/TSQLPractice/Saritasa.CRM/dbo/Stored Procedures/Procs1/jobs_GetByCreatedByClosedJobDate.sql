
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByCreatedByClosedJobDate]
(

	@CreatedBy int   ,

	@Closed datetime   ,

	@JobDate datetime   
)
AS


				SELECT
					[jobID],
					[Billable],
					[Description],
					[Duration],
					[TargetId],
					[CreatedBy],
					[ClientId],
					[ProjectId],
					[JobDate],
					[IsError],
					[ErrorBy],
					[ErrorReason],
					[WorkType],
					[UpdatedAt]
				FROM
					[dbo].[Jobs]
				WHERE
					[CreatedBy] = @CreatedBy
					AND [JobDate] = @JobDate
				SELECT @@ROWCOUNT