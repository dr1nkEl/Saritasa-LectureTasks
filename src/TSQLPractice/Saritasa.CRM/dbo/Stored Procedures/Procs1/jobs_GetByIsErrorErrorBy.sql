
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByIsErrorErrorBy]
(

	@IsError tinyint   ,

	@ErrorBy int   
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
					[IsError] = @IsError
					AND [ErrorBy] = @ErrorBy
				SELECT @@ROWCOUNT