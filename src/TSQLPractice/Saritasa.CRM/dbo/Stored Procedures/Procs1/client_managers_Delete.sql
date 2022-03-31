
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the client_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_Delete
(

	@CmID int   
)
AS


				DELETE FROM [dbo].[client_managers] WITH (ROWLOCK) 
				WHERE
					[cmID] = @CmID
					
			


