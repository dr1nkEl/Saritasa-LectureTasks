
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the JiraMapping table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.JiraMapping_Delete
(

	@Id bigint   
)
AS


				DELETE FROM [dbo].[JiraMapping] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id