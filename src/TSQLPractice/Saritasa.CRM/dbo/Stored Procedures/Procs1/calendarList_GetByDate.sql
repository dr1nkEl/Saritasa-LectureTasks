
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarList table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_GetByDate]
(

	@Date datetime   
)
AS


				SELECT
					[cID],
					[Date],
					[BranchId],
					[Holiday]
				FROM
					[dbo].[CalendarList]
				WHERE
					[Date] = @Date
				SELECT @@ROWCOUNT