
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the LookupBranch table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_Insert
(

	@Id int    OUTPUT,

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


				
				INSERT INTO [dbo].[LookupBranch]
					(
					[Name]
					,[WorkDayStartTime]
					,[DayLightSaving]
					,[TimeZone]
					,[TimeZoneCode]
					,[ShortName]
					,[CeoUserId]
					,[HumanResourceEmail]
					,[IsVacationFileRequired]
					,[IsOversea]
					,[VacationPeriod]
					,[VacationDaysCount]
					)
				VALUES
					(
					@Name
					,@WorkDayStartTime
					,@DayLightSaving
					,@TimeZone
					,@TimeZoneCode
					,@ShortName
					,@CeoUserId
					,@HumanResourceEmail
					,@IsVacationFileRequired
					,@IsOversea
					,@VacationPeriod
					,@VacationDaysCount
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()