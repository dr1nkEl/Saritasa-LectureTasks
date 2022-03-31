
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vDailyReportList view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vDailyReportList_Get_List

AS


				
				SELECT
					[dailyReportID],
					[documentID],
					[userID],
					[dateCreated],
					[reportDate],
					[reportText],
					[questionsText],
					[fullName],
					[superviserIDs],
					[userCreated]
				FROM
					[dbo].[_vDailyReportList]
					
				SELECT @@ROWCOUNT			
			


