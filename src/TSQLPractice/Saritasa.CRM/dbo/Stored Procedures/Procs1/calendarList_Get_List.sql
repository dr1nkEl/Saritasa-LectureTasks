
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the CalendarList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_Get_List]

AS


				
				SELECT
					[cID],
					[Date],
					[BranchId],
					[Holiday]
				FROM
					[dbo].[CalendarList]
					
				SELECT @@ROWCOUNT