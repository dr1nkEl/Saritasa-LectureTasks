
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the daily_reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_Get_List

AS


				
				SELECT
					[dailyReportID],
					[documentID],
					[userID],
					[dateCreated],
					[reportDate],
					[reportText],
					[questionsText],
					[calendarEventID]
				FROM
					[dbo].[daily_reports]
					
				SELECT @@ROWCOUNT
			


