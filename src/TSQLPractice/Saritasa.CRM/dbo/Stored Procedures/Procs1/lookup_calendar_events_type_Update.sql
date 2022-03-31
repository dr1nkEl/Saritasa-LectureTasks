
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_calendar_events_type table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calendar_events_type_Update
(

	@TypeID varchar (3)  ,

	@OriginalTypeID varchar (3)  ,

	@TypeName varchar (100)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_calendar_events_type]
				SET
					[typeID] = @TypeID
					,[typeName] = @TypeName
				WHERE
[typeID] = @OriginalTypeID 
				
			


