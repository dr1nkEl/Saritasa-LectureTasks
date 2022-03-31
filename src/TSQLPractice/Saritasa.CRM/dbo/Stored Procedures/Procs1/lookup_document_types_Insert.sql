
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_document_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_types_Insert
(

	@TypeID char (3)  ,

	@TypeName char (60)  
)
AS


				
				INSERT INTO [dbo].[lookup_document_types]
					(
					[typeID]
					,[typeName]
					)
				VALUES
					(
					@TypeID
					,@TypeName
					)
				
									
							
			


