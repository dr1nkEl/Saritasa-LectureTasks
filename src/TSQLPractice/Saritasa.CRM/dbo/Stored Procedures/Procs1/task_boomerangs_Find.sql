
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the task_boomerangs table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_Find
(

	@SearchUsingOR bit   = null ,

	@BoomerangID bigint   = null ,

	@TaskID bigint   = null ,

	@UserID int   = null ,

	@Type char (2)  = null ,

	@FireTime datetime   = null ,

	@IsFired bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [boomerangID]
	, [taskID]
	, [userID]
	, [type]
	, [fireTime]
	, [isFired]
    FROM
	[dbo].[task_boomerangs]
    WHERE 
	 ([boomerangID] = @BoomerangID OR @BoomerangID IS NULL)
	AND ([taskID] = @TaskID OR @TaskID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
	AND ([type] = @Type OR @Type IS NULL)
	AND ([fireTime] = @FireTime OR @FireTime IS NULL)
	AND ([isFired] = @IsFired OR @IsFired IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [boomerangID]
	, [taskID]
	, [userID]
	, [type]
	, [fireTime]
	, [isFired]
    FROM
	[dbo].[task_boomerangs]
    WHERE 
	 ([boomerangID] = @BoomerangID AND @BoomerangID is not null)
	OR ([taskID] = @TaskID AND @TaskID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	OR ([type] = @Type AND @Type is not null)
	OR ([fireTime] = @FireTime AND @FireTime is not null)
	OR ([isFired] = @IsFired AND @IsFired is not null)
	SELECT @@ROWCOUNT			
  END
				


