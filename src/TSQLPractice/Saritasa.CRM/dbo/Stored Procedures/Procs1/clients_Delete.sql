
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Clients table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_Delete]
(

	@ClientID int   
)
AS


				DELETE FROM [dbo].[Clients] WITH (ROWLOCK) 
				WHERE
					[clientID] = @ClientID