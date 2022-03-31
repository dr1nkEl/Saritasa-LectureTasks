
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the CalendarPersonal table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_Update]
(

	@ClId bigint   ,

	@UserId int   ,

	@Date datetime   ,

	@Holiday bit   ,

	@Description varchar (MAX)  ,

	@Vacation bit   ,

	@IsVacation tinyint   ,

	@SupervisedBy int   ,

	@IsSick bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[CalendarPersonal]
				SET
					[UserId] = @UserId
					,[Date] = @Date
					,[Holiday] = @Holiday
					,[Description] = @Description
					,[Vacation] = @Vacation
					,[IsVacation] = @IsVacation
					,[SupervisedBy] = @SupervisedBy
					,[IsSick] = @IsSick
				WHERE
[clId] = @ClId