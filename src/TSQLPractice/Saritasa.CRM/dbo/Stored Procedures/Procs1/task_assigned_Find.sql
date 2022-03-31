
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the task_assigned table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_Find
(

	@SearchUsingOR bit   = null ,

	@TaskAssignmentID int   = null ,

	@Assigned datetime   = null ,

	@Accepted datetime   = null ,

	@StartedWork datetime   = null ,

	@TaskID bigint   = null ,

	@UserID int   = null ,

	@AssignedBy int   = null ,

	@FinishedWork datetime   = null ,

	@Deleted datetime   = null ,

	@DurationLimit int   = null ,

	@Madeother bit   = null ,

	@IsBugFixing bit   = null ,

	@ExternalID bigint   = null ,

	@ExternalDBID int   = null ,

	@IsExternalCopy bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [taskAssignmentID]
	, [assigned]
	, [accepted]
	, [startedWork]
	, [taskID]
	, [userID]
	, [assignedBy]
	, [finishedWork]
	, [deleted]
	, [durationLimit]
	, [madeother]
	, [isBugFixing]
	, [externalID]
	, [externalDBID]
	, [isExternalCopy]
    FROM
	[dbo].[task_assigned]
    WHERE 
	 ([taskAssignmentID] = @TaskAssignmentID OR @TaskAssignmentID IS NULL)
	AND ([assigned] = @Assigned OR @Assigned IS NULL)
	AND ([accepted] = @Accepted OR @Accepted IS NULL)
	AND ([startedWork] = @StartedWork OR @StartedWork IS NULL)
	AND ([taskID] = @TaskID OR @TaskID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
	AND ([assignedBy] = @AssignedBy OR @AssignedBy IS NULL)
	AND ([finishedWork] = @FinishedWork OR @FinishedWork IS NULL)
	AND ([deleted] = @Deleted OR @Deleted IS NULL)
	AND ([durationLimit] = @DurationLimit OR @DurationLimit IS NULL)
	AND ([madeother] = @Madeother OR @Madeother IS NULL)
	AND ([isBugFixing] = @IsBugFixing OR @IsBugFixing IS NULL)
	AND ([externalID] = @ExternalID OR @ExternalID IS NULL)
	AND ([externalDBID] = @ExternalDBID OR @ExternalDBID IS NULL)
	AND ([isExternalCopy] = @IsExternalCopy OR @IsExternalCopy IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [taskAssignmentID]
	, [assigned]
	, [accepted]
	, [startedWork]
	, [taskID]
	, [userID]
	, [assignedBy]
	, [finishedWork]
	, [deleted]
	, [durationLimit]
	, [madeother]
	, [isBugFixing]
	, [externalID]
	, [externalDBID]
	, [isExternalCopy]
    FROM
	[dbo].[task_assigned]
    WHERE 
	 ([taskAssignmentID] = @TaskAssignmentID AND @TaskAssignmentID is not null)
	OR ([assigned] = @Assigned AND @Assigned is not null)
	OR ([accepted] = @Accepted AND @Accepted is not null)
	OR ([startedWork] = @StartedWork AND @StartedWork is not null)
	OR ([taskID] = @TaskID AND @TaskID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	OR ([assignedBy] = @AssignedBy AND @AssignedBy is not null)
	OR ([finishedWork] = @FinishedWork AND @FinishedWork is not null)
	OR ([deleted] = @Deleted AND @Deleted is not null)
	OR ([durationLimit] = @DurationLimit AND @DurationLimit is not null)
	OR ([madeother] = @Madeother AND @Madeother is not null)
	OR ([isBugFixing] = @IsBugFixing AND @IsBugFixing is not null)
	OR ([externalID] = @ExternalID AND @ExternalID is not null)
	OR ([externalDBID] = @ExternalDBID AND @ExternalDBID is not null)
	OR ([isExternalCopy] = @IsExternalCopy AND @IsExternalCopy is not null)
	SELECT @@ROWCOUNT			
  END
				


