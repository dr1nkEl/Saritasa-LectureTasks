
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the LogIP table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_Delete]
(

	@LogID bigint   
)
AS


				DELETE FROM [dbo].[LogIP] WITH (ROWLOCK) 
				WHERE
					[logID] = @LogID