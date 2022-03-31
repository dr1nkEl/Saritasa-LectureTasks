
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the EmploymentScores table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_Delete]
(

	@ScoreID bigint   
)
AS


				DELETE FROM [dbo].[EmploymentScores] WITH (ROWLOCK) 
				WHERE
					[scoreID] = @ScoreID