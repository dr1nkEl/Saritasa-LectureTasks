
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectResources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[ProjectResources] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id