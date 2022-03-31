
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Jobs_GetByProjectIdJobDate
(

	@ProjectId int   ,

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
					[ProjectId] = @ProjectId
					AND [JobDate] = @JobDate
				SELECT @@ROWCOUNT