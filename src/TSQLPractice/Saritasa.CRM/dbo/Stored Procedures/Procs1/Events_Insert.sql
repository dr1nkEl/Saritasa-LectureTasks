/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Events table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[Events_Insert]
(

	@Id int    OUTPUT,

	@Start_date datetime   ,

	@End_date datetime   ,

	@Description varchar (1000)  ,

	@CreatorID int   ,

	@EventType int   ,

	@Priority tinyint   
)
AS


				
				INSERT INTO [dbo].[Events]
					(
					[start_date]
					,[end_date]
					,[description]
					,[creatorID]
					,[eventType]
					,[priority]
					)
				VALUES
					(
					@Start_date
					,@End_date
					,@Description
					,@CreatorID
					,@EventType
					,@Priority
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()
