/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the tasks_tags table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[tasks_tags_Find]
(

	@SearchUsingOR bit   = null ,

	@Task_tagID bigint   = null ,

	@TagID bigint   = null ,

	@TaskID bigint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [task_tagID]
	, [tagID]
	, [taskID]
    FROM
	[dbo].[tasks_tags]
    WHERE 
	 ([task_tagID] = @Task_tagID OR @Task_tagID IS NULL)
	AND ([tagID] = @TagID OR @TagID IS NULL)
	AND ([taskID] = @TaskID OR @TaskID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [task_tagID]
	, [tagID]
	, [taskID]
    FROM
	[dbo].[tasks_tags]
    WHERE 
	 ([task_tagID] = @Task_tagID AND @Task_tagID is not null)
	OR ([tagID] = @TagID AND @TagID is not null)
	OR ([taskID] = @TaskID AND @TaskID is not null)
	SELECT @@ROWCOUNT			
  END
