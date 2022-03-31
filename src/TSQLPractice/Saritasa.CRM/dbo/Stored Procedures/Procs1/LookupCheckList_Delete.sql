
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the LookupCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[LookupCheckList] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id