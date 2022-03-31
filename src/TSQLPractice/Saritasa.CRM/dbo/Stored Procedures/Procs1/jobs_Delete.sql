
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Jobs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_Delete]
(

	@JobID bigint   
)
AS


				DELETE FROM [dbo].[Jobs] WITH (ROWLOCK) 
				WHERE
					[jobID] = @JobID