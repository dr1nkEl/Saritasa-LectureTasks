
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the daily_reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_Insert
(

	@DailyReportID int    OUTPUT,

	@DocumentID bigint   ,

	@UserID int   ,

	@DateCreated datetime   ,

	@ReportDate datetime   ,

	@ReportText varchar (MAX)  ,

	@QuestionsText varchar (MAX)  ,

	@CalendarEventID bigint   
)
AS


				
				INSERT INTO [dbo].[daily_reports]
					(
					[documentID]
					,[userID]
					,[dateCreated]
					,[reportDate]
					,[reportText]
					,[questionsText]
					,[calendarEventID]
					)
				VALUES
					(
					@DocumentID
					,@UserID
					,@DateCreated
					,@ReportDate
					,@ReportText
					,@QuestionsText
					,@CalendarEventID
					)
				
				-- Get the identity value
				SET @DailyReportID = SCOPE_IDENTITY()
									
							
			


