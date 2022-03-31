
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the task_assigned table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_Update
(

	@TaskAssignmentID int   ,

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


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[task_assigned]
				SET
					[assigned] = @Assigned
					,[accepted] = @Accepted
					,[startedWork] = @StartedWork
					,[taskID] = @TaskID
					,[userID] = @UserID
					,[assignedBy] = @AssignedBy
					,[finishedWork] = @FinishedWork
					,[deleted] = @Deleted
					,[durationLimit] = @DurationLimit
					,[madeother] = @Madeother
					,[isBugFixing] = @IsBugFixing
					,[externalID] = @ExternalID
					,[externalDBID] = @ExternalDBID
					,[isExternalCopy] = @IsExternalCopy
				WHERE
[taskAssignmentID] = @TaskAssignmentID 
				
			


