
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Jobs_GetByJobDateProjectIdTargetId
(

	@JobDate datetime   ,

	@ProjectId int   ,

	@TargetId bigint   
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
					[JobDate] = @JobDate
					AND [ProjectId] = @ProjectId
					AND [TargetId] = @TargetId
				SELECT @@ROWCOUNT