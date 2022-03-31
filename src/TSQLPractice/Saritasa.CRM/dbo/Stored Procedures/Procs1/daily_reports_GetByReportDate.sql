
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the daily_reports table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_GetByReportDate
(

	@ReportDate datetime   
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
					[reportDate] = @ReportDate
				SELECT @@ROWCOUNT
					
			


