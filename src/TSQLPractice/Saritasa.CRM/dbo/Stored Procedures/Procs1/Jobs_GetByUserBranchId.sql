
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Jobs table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Jobs_GetByUserBranchId
(

	@UserBranchId int   
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
					[UpdatedAt]
				FROM
					[dbo].[Jobs]
				WHERE
					[jobID] = @UserBranchId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON