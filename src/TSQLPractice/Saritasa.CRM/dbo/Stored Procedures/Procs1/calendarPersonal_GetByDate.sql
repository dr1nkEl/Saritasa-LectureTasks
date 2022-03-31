
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarPersonal table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_GetByDate]
(

	@Date datetime   
)
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
				WHERE
					[Date] = @Date
				SELECT @@ROWCOUNT