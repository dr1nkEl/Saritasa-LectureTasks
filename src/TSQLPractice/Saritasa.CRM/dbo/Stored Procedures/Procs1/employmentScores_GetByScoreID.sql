
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the EmploymentScores table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_GetByScoreID]
(

	@ScoreID bigint   
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
					[scoreID] = @ScoreID
				SELECT @@ROWCOUNT