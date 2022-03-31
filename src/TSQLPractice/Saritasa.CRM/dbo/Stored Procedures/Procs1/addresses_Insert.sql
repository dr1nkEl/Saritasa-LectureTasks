
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Addresses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[addresses_Insert]
(

	@AddressID int    OUTPUT,

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


				
				INSERT INTO [dbo].[Addresses]
					(
					[City]
					,[State]
					,[Country]
					,[Zip]
					,[TargetId]
					,[TypeId]
					,[Address]
					,[Address2]
					)
				VALUES
					(
					@City
					,@State
					,@Country
					,@Zip
					,@TargetId
					,@TypeId
					,@Address
					,@Address2
					)
				
				-- Get the identity value
				SET @AddressID = SCOPE_IDENTITY()