
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the LookupBranch table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_Get_List

AS


				
				SELECT
					[Id],
					[Name],
					[WorkDayStartTime],
					[DayLightSaving],
					[TimeZone],
					[TimeZoneCode],
					[ShortName],
					[CeoUserId],
					[HumanResourceEmail],
					[IsVacationFileRequired],
					[IsOversea],
					[VacationPeriod],
					[VacationDaysCount]
				FROM
					[dbo].[LookupBranch]
					
				SELECT @@ROWCOUNT