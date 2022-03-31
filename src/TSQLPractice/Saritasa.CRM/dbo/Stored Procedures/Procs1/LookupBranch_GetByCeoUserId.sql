
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LookupBranch table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_GetByCeoUserId
(

	@CeoUserId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[CeoUserId] = @CeoUserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON