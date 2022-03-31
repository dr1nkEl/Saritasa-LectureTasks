
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByCreated]
(

	@Created datetime   
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
					JobDate = @Created
				SELECT @@ROWCOUNT