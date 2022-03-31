
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the task_assigned table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_Insert
(

	@TaskAssignmentID int    OUTPUT,

	@Assigned datetime   ,

	@Accepted datetime   ,

	@StartedWork datetime   ,

	@TaskID bigint   ,

	@UserID int   ,

	@AssignedBy int   ,

	@FinishedWork datetime   ,

	@Deleted datetime   ,

	@DurationLimit int   ,

	@Madeother bit   ,

	@IsBugFixing bit   ,

	@ExternalID bigint   ,

	@ExternalDBID int   ,

	@IsExternalCopy bit   
)
AS


				
				INSERT INTO [dbo].[task_assigned]
					(
					[assigned]
					,[accepted]
					,[startedWork]
					,[taskID]
					,[userID]
					,[assignedBy]
					,[finishedWork]
					,[deleted]
					,[durationLimit]
					,[madeother]
					,[isBugFixing]
					,[externalID]
					,[externalDBID]
					,[isExternalCopy]
					)
				VALUES
					(
					@Assigned
					,@Accepted
					,@StartedWork
					,@TaskID
					,@UserID
					,@AssignedBy
					,@FinishedWork
					,@Deleted
					,@DurationLimit
					,@Madeother
					,@IsBugFixing
					,@ExternalID
					,@ExternalDBID
					,@IsExternalCopy
					)
				
				-- Get the identity value
				SET @TaskAssignmentID = SCOPE_IDENTITY()
									
							
			


