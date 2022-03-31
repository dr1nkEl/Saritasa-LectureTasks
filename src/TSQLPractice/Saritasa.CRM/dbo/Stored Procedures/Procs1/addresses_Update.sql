
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Addresses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[addresses_Update]
(

	@AddressID int   ,

	@City varchar (50)  ,

	@State varchar (30)  ,

	@Country varchar (30)  ,

	@Zip char (10)  ,

	@TargetId bigint   ,

	@TypeId char (2)  ,

	@Address varchar (300)  ,

	@Address2 varchar (300)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Addresses]
				SET
					[City] = @City
					,[State] = @State
					,[Country] = @Country
					,[Zip] = @Zip
					,[TargetId] = @TargetId
					,[TypeId] = @TypeId
					,[Address] = @Address
					,[Address2] = @Address2
				WHERE
[addressID] = @AddressID