
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Jobs_GetByJobDate
(

	@JobDate date   
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
					[UpdatedAt],
					[JobType]
				FROM
					[dbo].[Jobs]
				WHERE
					[JobDate] = @JobDate
				SELECT @@ROWCOUNT