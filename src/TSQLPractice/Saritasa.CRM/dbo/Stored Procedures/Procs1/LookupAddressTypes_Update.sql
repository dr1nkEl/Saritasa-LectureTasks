
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the LookupAddressTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupAddressTypes_Update
(

	@Id char (2)  ,

	@OriginalId char (2)  ,

	@Name varchar (55)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[LookupAddressTypes]
				SET
					[Id] = @Id
					,[Name] = @Name
				WHERE
[Id] = @OriginalId