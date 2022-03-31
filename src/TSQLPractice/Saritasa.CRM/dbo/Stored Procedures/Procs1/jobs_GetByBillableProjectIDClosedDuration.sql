
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_GetByBillableProjectIDClosedDuration]
(

	@Billable bit   ,

	@ProjectId int   ,

	@Closed datetime   ,

	@Duration int   
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
					[Billable] = @Billable
					AND [ProjectId] = @ProjectId
					AND [Duration] = @Duration
				SELECT @@ROWCOUNT