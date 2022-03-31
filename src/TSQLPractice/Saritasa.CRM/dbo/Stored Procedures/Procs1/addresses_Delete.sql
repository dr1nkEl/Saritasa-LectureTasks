
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Addresses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[addresses_Delete]
(

	@AddressID int   
)
AS


				DELETE FROM [dbo].[Addresses] WITH (ROWLOCK) 
				WHERE
					[addressID] = @AddressID