
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the daily_reports table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_GetByUserID
(

	@UserID int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[userID] = @UserID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


