/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Events table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[Events_Update]
(

	@Id int   ,

	@Start_date datetime   ,

	@End_date datetime   ,

	@Description varchar (1000)  ,

	@CreatorID int   ,

	@EventType int   ,

	@Priority tinyint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Events]
				SET
					[start_date] = @Start_date
					,[end_date] = @End_date
					,[description] = @Description
					,[creatorID] = @CreatorID
					,[eventType] = @EventType
					,[priority] = @Priority
				WHERE
[id] = @Id
