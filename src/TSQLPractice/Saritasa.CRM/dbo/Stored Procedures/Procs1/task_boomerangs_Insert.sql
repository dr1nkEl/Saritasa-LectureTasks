
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the task_boomerangs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_Insert
(

	@BoomerangID bigint    OUTPUT,

	@TaskID bigint   ,

	@UserID int   ,

	@Type char (2)  ,

	@FireTime datetime   ,

	@IsFired bit   
)
AS


				
				INSERT INTO [dbo].[task_boomerangs]
					(
					[taskID]
					,[userID]
					,[type]
					,[fireTime]
					,[isFired]
					)
				VALUES
					(
					@TaskID
					,@UserID
					,@Type
					,@FireTime
					,@IsFired
					)
				
				-- Get the identity value
				SET @BoomerangID = SCOPE_IDENTITY()
									
							
			


