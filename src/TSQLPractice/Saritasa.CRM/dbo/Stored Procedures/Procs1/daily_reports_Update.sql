
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the daily_reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_Update
(

	@DailyReportID int   ,

	@DocumentID bigint   ,

	@UserID int   ,

	@DateCreated datetime   ,

	@ReportDate datetime   ,

	@ReportText varchar (MAX)  ,

	@QuestionsText varchar (MAX)  ,

	@CalendarEventID bigint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[daily_reports]
				SET
					[documentID] = @DocumentID
					,[userID] = @UserID
					,[dateCreated] = @DateCreated
					,[reportDate] = @ReportDate
					,[reportText] = @ReportText
					,[questionsText] = @QuestionsText
					,[calendarEventID] = @CalendarEventID
				WHERE
[dailyReportID] = @DailyReportID 
				
			


