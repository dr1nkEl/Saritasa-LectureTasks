
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucReportListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucReportListWidget_Get_List

AS


				
				SELECT
					[reportID],
					[clientID],
					[documentID],
					[created],
					[createdBy],
					[fileID],
					[uniqueKey],
					[dateFrom],
					[dateTo]
				FROM
					[dbo].[_vucReportListWidget]
					
				SELECT @@ROWCOUNT			
			


