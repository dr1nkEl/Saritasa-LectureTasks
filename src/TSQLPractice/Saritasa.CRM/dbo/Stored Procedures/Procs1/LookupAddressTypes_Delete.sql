
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the LookupAddressTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupAddressTypes_Delete
(

	@Id char (2)  
)
AS


				DELETE FROM [dbo].[LookupAddressTypes] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id