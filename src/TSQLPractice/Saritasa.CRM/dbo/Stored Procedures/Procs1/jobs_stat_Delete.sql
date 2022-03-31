
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the jobs_stat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_Delete
(

	@JobStatID bigint   
)
AS


				DELETE FROM [dbo].[jobs_stat] WITH (ROWLOCK) 
				WHERE
					[jobStatID] = @JobStatID
					
			


