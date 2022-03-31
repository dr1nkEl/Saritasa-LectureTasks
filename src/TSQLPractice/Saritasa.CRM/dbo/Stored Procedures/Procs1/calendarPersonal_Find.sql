
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the CalendarPersonal table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_Find]
(

	@SearchUsingOR bit   = null ,

	@ClId bigint   = null ,

	@UserId int   = null ,

	@Date datetime   = null ,

	@Holiday bit   = null ,

	@Description varchar (MAX)  = null ,

	@Vacation bit   = null ,

	@IsVacation tinyint   = null ,

	@SupervisedBy int   = null ,

	@IsSick bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [clId]
	, [UserId]
	, [Date]
	, [Holiday]
	, [Description]
	, [Vacation]
	, [IsVacation]
	, [SupervisedBy]
	, [IsSick]
    FROM
	[dbo].[CalendarPersonal]
    WHERE 
	 ([clId] = @ClId OR @ClId IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Date] = @Date OR @Date IS NULL)
	AND ([Holiday] = @Holiday OR @Holiday IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([Vacation] = @Vacation OR @Vacation IS NULL)
	AND ([IsVacation] = @IsVacation OR @IsVacation IS NULL)
	AND ([SupervisedBy] = @SupervisedBy OR @SupervisedBy IS NULL)
	AND ([IsSick] = @IsSick OR @IsSick IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [clId]
	, [UserId]
	, [Date]
	, [Holiday]
	, [Description]
	, [Vacation]
	, [IsVacation]
	, [SupervisedBy]
	, [IsSick]
    FROM
	[dbo].[CalendarPersonal]
    WHERE 
	 ([clId] = @ClId AND @ClId is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Date] = @Date AND @Date is not null)
	OR ([Holiday] = @Holiday AND @Holiday is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([Vacation] = @Vacation AND @Vacation is not null)
	OR ([IsVacation] = @IsVacation AND @IsVacation is not null)
	OR ([SupervisedBy] = @SupervisedBy AND @SupervisedBy is not null)
	OR ([IsSick] = @IsSick AND @IsSick is not null)
	SELECT @@ROWCOUNT			
  END