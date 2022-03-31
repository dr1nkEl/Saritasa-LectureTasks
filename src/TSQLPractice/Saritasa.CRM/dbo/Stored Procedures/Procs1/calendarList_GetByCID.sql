
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarList table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_GetByCID]
(

	@CID int   
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
					[cID] = @CID
				SELECT @@ROWCOUNT