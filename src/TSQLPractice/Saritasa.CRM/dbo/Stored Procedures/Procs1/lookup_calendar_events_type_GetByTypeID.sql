
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_calendar_events_type table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calendar_events_type_GetByTypeID
(

	@TypeID varchar (3)  
)
AS


				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_calendar_events_type]
				WHERE
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


