
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the EmploymentScores table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_GetByUserID]
(

	@UserId int   
)
AS


				SELECT
					[scoreID],
					[UserId],
					[Points],
					[CreatedBy],
					[Created],
					[Description],
					[UseForRotation]
				FROM
					[dbo].[EmploymentScores]
				WHERE
					[UserId] = @UserId
				SELECT @@ROWCOUNT