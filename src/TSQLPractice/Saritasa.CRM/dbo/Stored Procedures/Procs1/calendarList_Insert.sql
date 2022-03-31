
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the CalendarList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_Insert]
(

	@CID int    OUTPUT,

	@Date datetime   ,

	@BranchId int   ,

	@Holiday bit   
)
AS


				
				INSERT INTO [dbo].[CalendarList]
					(
					[Date]
					,[BranchId]
					,[Holiday]
					)
				VALUES
					(
					@Date
					,@BranchId
					,@Holiday
					)
				
				-- Get the identity value
				SET @CID = SCOPE_IDENTITY()