
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_user_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_types_Update
(

	@TypeID char (2)  ,

	@OriginalTypeID char (2)  ,

	@TypeName varchar (45)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_user_types]
				SET
					[typeID] = @TypeID
					,[typeName] = @TypeName
				WHERE
[typeID] = @OriginalTypeID 
				
			


