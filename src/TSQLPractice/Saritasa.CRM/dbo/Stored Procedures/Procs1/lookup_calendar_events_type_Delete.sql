
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_calendar_events_type table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calendar_events_type_Delete
(

	@TypeID varchar (3)  
)
AS


				DELETE FROM [dbo].[lookup_calendar_events_type] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


