
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the LookupBranch table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[LookupBranch] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id