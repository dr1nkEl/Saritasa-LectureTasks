
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the CalendarEvents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_Update]
(

	@CeID bigint   ,

	@Date datetime   ,

	@Text varchar (MAX)  ,

	@CreatedBy int   ,

	@DocumentId bigint   ,

	@TypeId varchar (3)  ,

	@SenderList varchar (200)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[CalendarEvents]
				SET
					[Date] = @Date
					,[Text] = @Text
					,[CreatedBy] = @CreatedBy
					,[DocumentId] = @DocumentId
					,[TypeId] = @TypeId
					,[SenderList] = @SenderList
				WHERE
[ceID] = @CeID