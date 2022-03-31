
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the LookupBranch table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupBranch_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@Name varchar (50)  = null ,

	@WorkDayStartTime tinyint   = null ,

	@DayLightSaving bit   = null ,

	@TimeZone smallint   = null ,

	@TimeZoneCode varchar (100)  = null ,

	@ShortName varchar (8)  = null ,

	@CeoUserId int   = null ,

	@HumanResourceEmail varchar (255)  = null ,

	@IsVacationFileRequired bit   = null ,

	@IsOversea bit   = null ,

	@VacationPeriod int   = null ,

	@VacationDaysCount int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [Name]
	, [WorkDayStartTime]
	, [DayLightSaving]
	, [TimeZone]
	, [TimeZoneCode]
	, [ShortName]
	, [CeoUserId]
	, [HumanResourceEmail]
	, [IsVacationFileRequired]
	, [IsOversea]
	, [VacationPeriod]
	, [VacationDaysCount]
    FROM
	[dbo].[LookupBranch]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
	AND ([WorkDayStartTime] = @WorkDayStartTime OR @WorkDayStartTime IS NULL)
	AND ([DayLightSaving] = @DayLightSaving OR @DayLightSaving IS NULL)
	AND ([TimeZone] = @TimeZone OR @TimeZone IS NULL)
	AND ([TimeZoneCode] = @TimeZoneCode OR @TimeZoneCode IS NULL)
	AND ([ShortName] = @ShortName OR @ShortName IS NULL)
	AND ([CeoUserId] = @CeoUserId OR @CeoUserId IS NULL)
	AND ([HumanResourceEmail] = @HumanResourceEmail OR @HumanResourceEmail IS NULL)
	AND ([IsVacationFileRequired] = @IsVacationFileRequired OR @IsVacationFileRequired IS NULL)
	AND ([IsOversea] = @IsOversea OR @IsOversea IS NULL)
	AND ([VacationPeriod] = @VacationPeriod OR @VacationPeriod IS NULL)
	AND ([VacationDaysCount] = @VacationDaysCount OR @VacationDaysCount IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [Name]
	, [WorkDayStartTime]
	, [DayLightSaving]
	, [TimeZone]
	, [TimeZoneCode]
	, [ShortName]
	, [CeoUserId]
	, [HumanResourceEmail]
	, [IsVacationFileRequired]
	, [IsOversea]
	, [VacationPeriod]
	, [VacationDaysCount]
    FROM
	[dbo].[LookupBranch]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([Name] = @Name AND @Name is not null)
	OR ([WorkDayStartTime] = @WorkDayStartTime AND @WorkDayStartTime is not null)
	OR ([DayLightSaving] = @DayLightSaving AND @DayLightSaving is not null)
	OR ([TimeZone] = @TimeZone AND @TimeZone is not null)
	OR ([TimeZoneCode] = @TimeZoneCode AND @TimeZoneCode is not null)
	OR ([ShortName] = @ShortName AND @ShortName is not null)
	OR ([CeoUserId] = @CeoUserId AND @CeoUserId is not null)
	OR ([HumanResourceEmail] = @HumanResourceEmail AND @HumanResourceEmail is not null)
	OR ([IsVacationFileRequired] = @IsVacationFileRequired AND @IsVacationFileRequired is not null)
	OR ([IsOversea] = @IsOversea AND @IsOversea is not null)
	OR ([VacationPeriod] = @VacationPeriod AND @VacationPeriod is not null)
	OR ([VacationDaysCount] = @VacationDaysCount AND @VacationDaysCount is not null)
	SELECT @@ROWCOUNT			
  END