
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByClientID]
(

	@ClientId int   
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
					[ClientId] = @ClientId
				SELECT @@ROWCOUNT