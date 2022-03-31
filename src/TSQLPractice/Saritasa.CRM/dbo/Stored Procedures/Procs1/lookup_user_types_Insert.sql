
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_user_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_types_Insert
(

	@TypeID char (2)  ,

	@TypeName varchar (45)  
)
AS


				
				INSERT INTO [dbo].[lookup_user_types]
					(
					[typeID]
					,[typeName]
					)
				VALUES
					(
					@TypeID
					,@TypeName
					)
				
									
							
			


