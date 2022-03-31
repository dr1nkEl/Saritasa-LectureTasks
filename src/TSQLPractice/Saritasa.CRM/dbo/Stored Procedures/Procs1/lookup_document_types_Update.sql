
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_document_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_types_Update
(

	@TypeID char (3)  ,

	@OriginalTypeID char (3)  ,

	@TypeName char (60)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_document_types]
				SET
					[typeID] = @TypeID
					,[typeName] = @TypeName
				WHERE
[typeID] = @OriginalTypeID 
				
			


