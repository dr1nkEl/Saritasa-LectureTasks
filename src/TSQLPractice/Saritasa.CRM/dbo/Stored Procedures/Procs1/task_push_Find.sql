
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the task_push table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_Find
(

	@SearchUsingOR bit   = null ,

	@PushID bigint   = null ,

	@TaskID bigint   = null ,

	@InitiatorID int   = null ,

	@RecipientID int   = null ,

	@Created datetime   = null ,

	@Comment varchar (255)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [pushID]
	, [taskID]
	, [initiatorID]
	, [recipientID]
	, [created]
	, [comment]
    FROM
	[dbo].[task_push]
    WHERE 
	 ([pushID] = @PushID OR @PushID IS NULL)
	AND ([taskID] = @TaskID OR @TaskID IS NULL)
	AND ([initiatorID] = @InitiatorID OR @InitiatorID IS NULL)
	AND ([recipientID] = @RecipientID OR @RecipientID IS NULL)
	AND ([created] = @Created OR @Created IS NULL)
	AND ([comment] = @Comment OR @Comment IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [pushID]
	, [taskID]
	, [initiatorID]
	, [recipientID]
	, [created]
	, [comment]
    FROM
	[dbo].[task_push]
    WHERE 
	 ([pushID] = @PushID AND @PushID is not null)
	OR ([taskID] = @TaskID AND @TaskID is not null)
	OR ([initiatorID] = @InitiatorID AND @InitiatorID is not null)
	OR ([recipientID] = @RecipientID AND @RecipientID is not null)
	OR ([created] = @Created AND @Created is not null)
	OR ([comment] = @Comment AND @Comment is not null)
	SELECT @@ROWCOUNT			
  END
				


