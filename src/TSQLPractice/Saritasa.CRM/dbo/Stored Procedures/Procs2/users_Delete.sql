
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_Delete]
(

	@Id int   
)
AS


				DELETE FROM [dbo].[Users] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id