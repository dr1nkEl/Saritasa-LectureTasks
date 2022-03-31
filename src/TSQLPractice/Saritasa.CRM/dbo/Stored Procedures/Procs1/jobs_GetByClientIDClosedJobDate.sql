
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByClientIDClosedJobDate]
(

	@ClientId int   ,

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
					[WorkType]
				FROM
					[dbo].[Jobs]
				WHERE
					[ClientId] = @ClientId
					AND [JobDate] = @JobDate
				SELECT @@ROWCOUNT