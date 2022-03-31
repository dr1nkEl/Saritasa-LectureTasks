
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LookupBranch table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_GetById
(

	@Id int   
)
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
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT