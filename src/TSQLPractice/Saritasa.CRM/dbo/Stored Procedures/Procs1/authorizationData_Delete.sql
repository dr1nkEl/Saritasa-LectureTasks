
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the AuthorizationData table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_Delete]
(

	@AuthID int   
)
AS


				DELETE FROM [dbo].[AuthorizationData] WITH (ROWLOCK) 
				WHERE
					[authID] = @AuthID