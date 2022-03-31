
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the CalendarPersonalPeriods table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.CalendarPersonalPeriods_Insert
(

	@PeriodID int    OUTPUT,

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


				
				INSERT INTO [dbo].[CalendarPersonalPeriods]
					(
					[UserId]
					,[FileId]
					,[Confirmed]
					,[Type]
					,[ApprovedBy]
					,[StartDate]
					,[EndDate]
					,[ApprovedAt]
					,[PaidAt]
					,[ActualDays]
					)
				VALUES
					(
					@UserId
					,@FileId
					,@Confirmed
					,@Type
					,@ApprovedBy
					,@StartDate
					,@EndDate
					,@ApprovedAt
					,@PaidAt
					,@ActualDays
					)
				
				-- Get the identity value
				SET @PeriodID = SCOPE_IDENTITY()