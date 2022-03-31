
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the EmailTaskTargets table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emailTaskTargets_Delete]
(

	@Id uniqueidentifier   
)
AS


				DELETE FROM [dbo].[EmailTaskTargets] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id