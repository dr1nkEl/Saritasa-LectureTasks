
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the CalendarPersonalPeriods table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.CalendarPersonalPeriods_Get_List

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
					
				SELECT @@ROWCOUNT