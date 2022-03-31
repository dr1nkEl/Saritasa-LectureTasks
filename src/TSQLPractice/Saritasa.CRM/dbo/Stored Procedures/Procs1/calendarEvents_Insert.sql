
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the CalendarEvents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_Insert]
(

	@CeID bigint    OUTPUT,

	@Date datetime   ,

	@Text varchar (MAX)  ,

	@CreatedBy int   ,

	@DocumentId bigint   ,

	@TypeId varchar (3)  ,

	@SenderList varchar (200)  
)
AS


				
				INSERT INTO [dbo].[CalendarEvents]
					(
					[Date]
					,[Text]
					,[CreatedBy]
					,[DocumentId]
					,[TypeId]
					,[SenderList]
					)
				VALUES
					(
					@Date
					,@Text
					,@CreatedBy
					,@DocumentId
					,@TypeId
					,@SenderList
					)
				
				-- Get the identity value
				SET @CeID = SCOPE_IDENTITY()