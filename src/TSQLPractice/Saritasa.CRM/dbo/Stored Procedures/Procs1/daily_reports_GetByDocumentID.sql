
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the daily_reports table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.daily_reports_GetByDocumentID
(

	@DocumentID bigint   
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
					[documentID] = @DocumentID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


