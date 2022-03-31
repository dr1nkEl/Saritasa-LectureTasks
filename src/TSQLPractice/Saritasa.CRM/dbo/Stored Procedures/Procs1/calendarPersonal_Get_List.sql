
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the CalendarPersonal table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_Get_List]

AS


				
				SELECT
					[clId],
					[UserId],
					[Date],
					[Holiday],
					[Description],
					[Vacation],
					[IsVacation],
					[SupervisedBy],
					[IsSick]
				FROM
					[dbo].[CalendarPersonal]
					
				SELECT @@ROWCOUNT