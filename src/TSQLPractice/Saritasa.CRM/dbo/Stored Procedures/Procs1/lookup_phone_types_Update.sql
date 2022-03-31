
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_phone_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_phone_types_Update
(

	@TypeID char (3)  ,

	@OriginalTypeID char (3)  ,

	@TypeName varchar (55)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_phone_types]
				SET
					[typeID] = @TypeID
					,[typeName] = @TypeName
				WHERE
[typeID] = @OriginalTypeID 
				
			


