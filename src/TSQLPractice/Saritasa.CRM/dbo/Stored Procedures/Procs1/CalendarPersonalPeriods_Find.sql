
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the CalendarPersonalPeriods table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.CalendarPersonalPeriods_Find
(

	@SearchUsingOR bit   = null ,

	@PeriodID int   = null ,

	@UserId int   = null ,

	@FileId int   = null ,

	@Confirmed bit   = null ,

	@Type int   = null ,

	@ApprovedBy int   = null ,

	@StartDate datetime   = null ,

	@EndDate datetime   = null ,

	@ApprovedAt datetime   = null ,

	@PaidAt datetime   = null ,

	@ActualDays int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [periodID]
	, [UserId]
	, [FileId]
	, [Confirmed]
	, [Type]
	, [ApprovedBy]
	, [StartDate]
	, [EndDate]
	, [ApprovedAt]
	, [PaidAt]
	, [ActualDays]
    FROM
	[dbo].[CalendarPersonalPeriods]
    WHERE 
	 ([periodID] = @PeriodID OR @PeriodID IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([FileId] = @FileId OR @FileId IS NULL)
	AND ([Confirmed] = @Confirmed OR @Confirmed IS NULL)
	AND ([Type] = @Type OR @Type IS NULL)
	AND ([ApprovedBy] = @ApprovedBy OR @ApprovedBy IS NULL)
	AND ([StartDate] = @StartDate OR @StartDate IS NULL)
	AND ([EndDate] = @EndDate OR @EndDate IS NULL)
	AND ([ApprovedAt] = @ApprovedAt OR @ApprovedAt IS NULL)
	AND ([PaidAt] = @PaidAt OR @PaidAt IS NULL)
	AND ([ActualDays] = @ActualDays OR @ActualDays IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [periodID]
	, [UserId]
	, [FileId]
	, [Confirmed]
	, [Type]
	, [ApprovedBy]
	, [StartDate]
	, [EndDate]
	, [ApprovedAt]
	, [PaidAt]
	, [ActualDays]
    FROM
	[dbo].[CalendarPersonalPeriods]
    WHERE 
	 ([periodID] = @PeriodID AND @PeriodID is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([FileId] = @FileId AND @FileId is not null)
	OR ([Confirmed] = @Confirmed AND @Confirmed is not null)
	OR ([Type] = @Type AND @Type is not null)
	OR ([ApprovedBy] = @ApprovedBy AND @ApprovedBy is not null)
	OR ([StartDate] = @StartDate AND @StartDate is not null)
	OR ([EndDate] = @EndDate AND @EndDate is not null)
	OR ([ApprovedAt] = @ApprovedAt AND @ApprovedAt is not null)
	OR ([PaidAt] = @PaidAt AND @PaidAt is not null)
	OR ([ActualDays] = @ActualDays AND @ActualDays is not null)
	SELECT @@ROWCOUNT			
  END