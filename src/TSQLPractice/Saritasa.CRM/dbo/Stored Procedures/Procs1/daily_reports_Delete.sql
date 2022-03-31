
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the daily_reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_Delete
(

	@DailyReportID int   
)
AS


				DELETE FROM [dbo].[daily_reports] WITH (ROWLOCK) 
				WHERE
					[dailyReportID] = @DailyReportID
					
			


