
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the task_verify_stack table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_Find
(

	@SearchUsingOR bit   = null ,

	@TaskVerifyID bigint   = null ,

	@TaskID bigint   = null ,

	@UserID bigint   = null ,

	@IsVerified bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [taskVerifyID]
	, [taskID]
	, [userID]
	, [IsVerified]
    FROM
	[dbo].[task_verify_stack]
    WHERE 
	 ([taskVerifyID] = @TaskVerifyID OR @TaskVerifyID IS NULL)
	AND ([taskID] = @TaskID OR @TaskID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
	AND ([IsVerified] = @IsVerified OR @IsVerified IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [taskVerifyID]
	, [taskID]
	, [userID]
	, [IsVerified]
    FROM
	[dbo].[task_verify_stack]
    WHERE 
	 ([taskVerifyID] = @TaskVerifyID AND @TaskVerifyID is not null)
	OR ([taskID] = @TaskID AND @TaskID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	OR ([IsVerified] = @IsVerified AND @IsVerified is not null)
	SELECT @@ROWCOUNT			
  END
				


