
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_phone_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_phone_types_Insert
(

	@TypeID char (3)  ,

	@TypeName varchar (55)  
)
AS


				
				INSERT INTO [dbo].[lookup_phone_types]
					(
					[typeID]
					,[typeName]
					)
				VALUES
					(
					@TypeID
					,@TypeName
					)
				
									
							
			


