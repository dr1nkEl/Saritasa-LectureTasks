
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarPersonalPeriods table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.CalendarPersonalPeriods_GetByPeriodID
(

	@PeriodID int   
)
AS


				SELECT
					[periodID],
					[UserId],
					[FileId],
					[Confirmed],
					[Type],
					[ApprovedBy],
					[StartDate],
					[EndDate],
					[ApprovedAt],
					[PaidAt],
					[ActualDays]
				FROM
					[dbo].[CalendarPersonalPeriods]
				WHERE
					[periodID] = @PeriodID
				SELECT @@ROWCOUNT