
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Blogs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_Delete]
(

	@Id int   
)
AS


				DELETE FROM [dbo].[Blogs] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id