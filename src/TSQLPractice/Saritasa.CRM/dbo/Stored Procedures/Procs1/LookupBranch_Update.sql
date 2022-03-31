
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the LookupBranch table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_Update
(

	@Id int   ,

	@Name varchar (50)  ,

	@WorkDayStartTime tinyint   ,

	@DayLightSaving bit   ,

	@TimeZone smallint   ,

	@TimeZoneCode varchar (100)  ,

	@ShortName varchar (8)  ,

	@CeoUserId int   ,

	@HumanResourceEmail varchar (255)  ,

	@IsVacationFileRequired bit   ,

	@IsOversea bit   ,

	@VacationPeriod int   ,

	@VacationDaysCount int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[LookupBranch]
				SET
					[Name] = @Name
					,[WorkDayStartTime] = @WorkDayStartTime
					,[DayLightSaving] = @DayLightSaving
					,[TimeZone] = @TimeZone
					,[TimeZoneCode] = @TimeZoneCode
					,[ShortName] = @ShortName
					,[CeoUserId] = @CeoUserId
					,[HumanResourceEmail] = @HumanResourceEmail
					,[IsVacationFileRequired] = @IsVacationFileRequired
					,[IsOversea] = @IsOversea
					,[VacationPeriod] = @VacationPeriod
					,[VacationDaysCount] = @VacationDaysCount
				WHERE
[Id] = @Id