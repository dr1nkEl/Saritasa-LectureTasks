
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_email_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_email_types_Insert
(

	@TypeID char (2)  ,

	@TypeName varchar (55)  
)
AS


				
				INSERT INTO [dbo].[lookup_email_types]
					(
					[typeID]
					,[typeName]
					)
				VALUES
					(
					@TypeID
					,@TypeName
					)
				
									
							
			


