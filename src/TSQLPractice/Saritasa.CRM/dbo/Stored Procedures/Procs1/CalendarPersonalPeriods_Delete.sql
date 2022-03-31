
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the CalendarPersonalPeriods table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.CalendarPersonalPeriods_Delete
(

	@PeriodID int   
)
AS


				DELETE FROM [dbo].[CalendarPersonalPeriods] WITH (ROWLOCK) 
				WHERE
					[periodID] = @PeriodID
					
			


