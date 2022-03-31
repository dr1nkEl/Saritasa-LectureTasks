
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the CalendarPersonal table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarPersonal_Insert]
(

	@ClId bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[CalendarPersonal]
					(
					[UserId]
					,[Date]
					,[Holiday]
					,[Description]
					,[Vacation]
					,[IsVacation]
					,[SupervisedBy]
					,[IsSick]
					)
				VALUES
					(
					@UserId
					,@Date
					,@Holiday
					,@Description
					,@Vacation
					,@IsVacation
					,@SupervisedBy
					,@IsSick
					)
				
				-- Get the identity value
				SET @ClId = SCOPE_IDENTITY()