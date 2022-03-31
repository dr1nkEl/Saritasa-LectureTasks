
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarList table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_GetByBranchID]
(

	@BranchId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[cID],
					[Date],
					[BranchId],
					[Holiday]
				FROM
					[dbo].[CalendarList]
				WHERE
					[BranchId] = @BranchId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON