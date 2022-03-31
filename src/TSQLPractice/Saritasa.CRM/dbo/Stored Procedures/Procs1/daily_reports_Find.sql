
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the daily_reports table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_Find
(

	@SearchUsingOR bit   = null ,

	@DailyReportID int   = null ,

	@DocumentID bigint   = null ,

	@UserID int   = null ,

	@DateCreated datetime   = null ,

	@ReportDate datetime   = null ,

	@ReportText varchar (MAX)  = null ,

	@QuestionsText varchar (MAX)  = null ,

	@CalendarEventID bigint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [dailyReportID]
	, [documentID]
	, [userID]
	, [dateCreated]
	, [reportDate]
	, [reportText]
	, [questionsText]
	, [calendarEventID]
    FROM
	[dbo].[daily_reports]
    WHERE 
	 ([dailyReportID] = @DailyReportID OR @DailyReportID IS NULL)
	AND ([documentID] = @DocumentID OR @DocumentID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
	AND ([dateCreated] = @DateCreated OR @DateCreated IS NULL)
	AND ([reportDate] = @ReportDate OR @ReportDate IS NULL)
	AND ([reportText] = @ReportText OR @ReportText IS NULL)
	AND ([questionsText] = @QuestionsText OR @QuestionsText IS NULL)
	AND ([calendarEventID] = @CalendarEventID OR @CalendarEventID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [dailyReportID]
	, [documentID]
	, [userID]
	, [dateCreated]
	, [reportDate]
	, [reportText]
	, [questionsText]
	, [calendarEventID]
    FROM
	[dbo].[daily_reports]
    WHERE 
	 ([dailyReportID] = @DailyReportID AND @DailyReportID is not null)
	OR ([documentID] = @DocumentID AND @DocumentID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	OR ([dateCreated] = @DateCreated AND @DateCreated is not null)
	OR ([reportDate] = @ReportDate AND @ReportDate is not null)
	OR ([reportText] = @ReportText AND @ReportText is not null)
	OR ([questionsText] = @QuestionsText AND @QuestionsText is not null)
	OR ([calendarEventID] = @CalendarEventID AND @CalendarEventID is not null)
	SELECT @@ROWCOUNT			
  END
				


