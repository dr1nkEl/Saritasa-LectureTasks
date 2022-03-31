
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByCreatedByIsErrorJobID]
(

	@CreatedBy int   ,

	@IsError tinyint   ,

	@JobID bigint   
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
					[WorkType]
				FROM
					[dbo].[Jobs]
				WHERE
					[CreatedBy] = @CreatedBy
					AND [IsError] = @IsError
					AND [jobID] = @JobID
				SELECT @@ROWCOUNT