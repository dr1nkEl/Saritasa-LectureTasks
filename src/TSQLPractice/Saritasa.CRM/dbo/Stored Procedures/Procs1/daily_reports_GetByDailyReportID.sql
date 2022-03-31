
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the daily_reports table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_GetByDailyReportID
(

	@DailyReportID int   
)
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
				WHERE
					[dailyReportID] = @DailyReportID
				SELECT @@ROWCOUNT
					
			


