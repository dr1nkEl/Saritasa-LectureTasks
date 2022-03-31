
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarPersonal table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_GetByClId]
(

	@ClId bigint   
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
					[clId] = @ClId
				SELECT @@ROWCOUNT