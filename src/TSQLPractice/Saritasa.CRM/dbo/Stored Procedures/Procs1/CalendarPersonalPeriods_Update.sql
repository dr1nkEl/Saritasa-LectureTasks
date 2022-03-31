
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the CalendarPersonalPeriods table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.CalendarPersonalPeriods_Update
(

	@PeriodID int   ,

	@UserId int   ,

	@FileId int   ,

	@Confirmed bit   ,

	@Type int   ,

	@ApprovedBy int   ,

	@StartDate datetime   ,

	@EndDate datetime   ,

	@ApprovedAt datetime   ,

	@PaidAt datetime   ,

	@ActualDays int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[CalendarPersonalPeriods]
				SET
					[UserId] = @UserId
					,[FileId] = @FileId
					,[Confirmed] = @Confirmed
					,[Type] = @Type
					,[ApprovedBy] = @ApprovedBy
					,[StartDate] = @StartDate
					,[EndDate] = @EndDate
					,[ApprovedAt] = @ApprovedAt
					,[PaidAt] = @PaidAt
					,[ActualDays] = @ActualDays
				WHERE
[periodID] = @PeriodID