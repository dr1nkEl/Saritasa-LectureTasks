
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the CalendarEvents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_Delete]
(

	@CeID bigint   
)
AS


				DELETE FROM [dbo].[CalendarEvents] WITH (ROWLOCK) 
				WHERE
					[ceID] = @CeID