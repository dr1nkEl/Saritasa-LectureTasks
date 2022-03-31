
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the CalendarList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarList_Update]
(

	@CID int   ,

	@Date datetime   ,

	@BranchId int   ,

	@Holiday bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[CalendarList]
				SET
					[Date] = @Date
					,[BranchId] = @BranchId
					,[Holiday] = @Holiday
				WHERE
[cID] = @CID