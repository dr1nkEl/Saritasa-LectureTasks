
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_file_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_file_types_Update
(

	@TypeID char (2)  ,

	@OriginalTypeID char (2)  ,

	@TypeName varchar (55)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_file_types]
				SET
					[typeID] = @TypeID
					,[typeName] = @TypeName
				WHERE
[typeID] = @OriginalTypeID 
				
			


