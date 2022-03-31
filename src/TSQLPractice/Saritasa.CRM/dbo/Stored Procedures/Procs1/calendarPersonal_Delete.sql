
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the CalendarPersonal table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_Delete]
(

	@ClId bigint   
)
AS


				DELETE FROM [dbo].[CalendarPersonal] WITH (ROWLOCK) 
				WHERE
					[clId] = @ClId