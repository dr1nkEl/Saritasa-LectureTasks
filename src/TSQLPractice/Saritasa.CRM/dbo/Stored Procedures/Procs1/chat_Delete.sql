
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Chat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_Delete]
(

	@Id int   
)
AS


				DELETE FROM [dbo].[Chat] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id