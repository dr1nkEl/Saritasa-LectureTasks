
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Emails table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_Delete]
(

	@EmailID int   
)
AS


				DELETE FROM [dbo].[Emails] WITH (ROWLOCK) 
				WHERE
					[emailID] = @EmailID