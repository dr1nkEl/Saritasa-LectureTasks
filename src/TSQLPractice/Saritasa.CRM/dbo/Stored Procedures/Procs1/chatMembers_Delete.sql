
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ChatMembers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_Delete]
(

	@Id int   
)
AS


				DELETE FROM [dbo].[ChatMembers] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id