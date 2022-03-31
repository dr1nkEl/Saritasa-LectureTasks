
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_calendar_events_type table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calendar_events_type_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_calendar_events_type]
					
				SELECT @@ROWCOUNT
			


