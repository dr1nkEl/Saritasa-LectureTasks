
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the task_boomerangs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_Update
(

	@BoomerangID bigint   ,

	@TaskID bigint   ,

	@UserID int   ,

	@Type char (2)  ,

	@FireTime datetime   ,

	@IsFired bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[task_boomerangs]
				SET
					[taskID] = @TaskID
					,[userID] = @UserID
					,[type] = @Type
					,[fireTime] = @FireTime
					,[isFired] = @IsFired
				WHERE
[boomerangID] = @BoomerangID 
				
			


