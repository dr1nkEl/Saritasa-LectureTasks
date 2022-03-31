
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the CalendarList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_Delete]
(

	@CID int   
)
AS


				DELETE FROM [dbo].[CalendarList] WITH (ROWLOCK) 
				WHERE
					[cID] = @CID