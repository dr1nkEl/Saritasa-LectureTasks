
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByWorkType]
(

	@WorkType int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[WorkType] = @WorkType
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON