
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the LookupAddressTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupAddressTypes_Insert
(

	@Id char (2)  ,

	@Name varchar (55)  
)
AS


				
				INSERT INTO [dbo].[LookupAddressTypes]
					(
					[Id]
					,[Name]
					)
				VALUES
					(
					@Id
					,@Name
					)