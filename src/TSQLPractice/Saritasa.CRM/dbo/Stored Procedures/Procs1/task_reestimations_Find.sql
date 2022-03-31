
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the task_reestimations table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_Find
(

	@SearchUsingOR bit   = null ,

	@ID bigint   = null ,

	@TaskID bigint   = null ,

	@Status int   = null ,

	@OldLimit int   = null ,

	@OldDueDate datetime   = null ,

	@NewLimit int   = null ,

	@NewDueDate datetime   = null ,

	@CreateReason varchar (MAX)  = null ,

	@DeclineReason varchar (MAX)  = null ,

	@CreatedByID int   = null ,

	@CreatedDate datetime   = null ,

	@ApprovedByIDTM int   = null ,

	@ApprovedDateTM datetime   = null ,

	@DeclinedByIDTM int   = null ,

	@DeclinedDateTM datetime   = null ,

	@ApprovedByIDPM int   = null ,

	@ApprovedDatePM datetime   = null ,

	@DeclinedByIDPM int   = null ,

	@DeclinedDatePM datetime   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ID]
	, [taskID]
	, [status]
	, [oldLimit]
	, [oldDueDate]
	, [newLimit]
	, [newDueDate]
	, [createReason]
	, [declineReason]
	, [createdByID]
	, [createdDate]
	, [approvedByIDTM]
	, [approvedDateTM]
	, [declinedByIDTM]
	, [declinedDateTM]
	, [approvedByIDPM]
	, [approvedDatePM]
	, [declinedByIDPM]
	, [declinedDatePM]
    FROM
	[dbo].[task_reestimations]
    WHERE 
	 ([ID] = @ID OR @ID IS NULL)
	AND ([taskID] = @TaskID OR @TaskID IS NULL)
	AND ([status] = @Status OR @Status IS NULL)
	AND ([oldLimit] = @OldLimit OR @OldLimit IS NULL)
	AND ([oldDueDate] = @OldDueDate OR @OldDueDate IS NULL)
	AND ([newLimit] = @NewLimit OR @NewLimit IS NULL)
	AND ([newDueDate] = @NewDueDate OR @NewDueDate IS NULL)
	AND ([createReason] = @CreateReason OR @CreateReason IS NULL)
	AND ([declineReason] = @DeclineReason OR @DeclineReason IS NULL)
	AND ([createdByID] = @CreatedByID OR @CreatedByID IS NULL)
	AND ([createdDate] = @CreatedDate OR @CreatedDate IS NULL)
	AND ([approvedByIDTM] = @ApprovedByIDTM OR @ApprovedByIDTM IS NULL)
	AND ([approvedDateTM] = @ApprovedDateTM OR @ApprovedDateTM IS NULL)
	AND ([declinedByIDTM] = @DeclinedByIDTM OR @DeclinedByIDTM IS NULL)
	AND ([declinedDateTM] = @DeclinedDateTM OR @DeclinedDateTM IS NULL)
	AND ([approvedByIDPM] = @ApprovedByIDPM OR @ApprovedByIDPM IS NULL)
	AND ([approvedDatePM] = @ApprovedDatePM OR @ApprovedDatePM IS NULL)
	AND ([declinedByIDPM] = @DeclinedByIDPM OR @DeclinedByIDPM IS NULL)
	AND ([declinedDatePM] = @DeclinedDatePM OR @DeclinedDatePM IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ID]
	, [taskID]
	, [status]
	, [oldLimit]
	, [oldDueDate]
	, [newLimit]
	, [newDueDate]
	, [createReason]
	, [declineReason]
	, [createdByID]
	, [createdDate]
	, [approvedByIDTM]
	, [approvedDateTM]
	, [declinedByIDTM]
	, [declinedDateTM]
	, [approvedByIDPM]
	, [approvedDatePM]
	, [declinedByIDPM]
	, [declinedDatePM]
    FROM
	[dbo].[task_reestimations]
    WHERE 
	 ([ID] = @ID AND @ID is not null)
	OR ([taskID] = @TaskID AND @TaskID is not null)
	OR ([status] = @Status AND @Status is not null)
	OR ([oldLimit] = @OldLimit AND @OldLimit is not null)
	OR ([oldDueDate] = @OldDueDate AND @OldDueDate is not null)
	OR ([newLimit] = @NewLimit AND @NewLimit is not null)
	OR ([newDueDate] = @NewDueDate AND @NewDueDate is not null)
	OR ([createReason] = @CreateReason AND @CreateReason is not null)
	OR ([declineReason] = @DeclineReason AND @DeclineReason is not null)
	OR ([createdByID] = @CreatedByID AND @CreatedByID is not null)
	OR ([createdDate] = @CreatedDate AND @CreatedDate is not null)
	OR ([approvedByIDTM] = @ApprovedByIDTM AND @ApprovedByIDTM is not null)
	OR ([approvedDateTM] = @ApprovedDateTM AND @ApprovedDateTM is not null)
	OR ([declinedByIDTM] = @DeclinedByIDTM AND @DeclinedByIDTM is not null)
	OR ([declinedDateTM] = @DeclinedDateTM AND @DeclinedDateTM is not null)
	OR ([approvedByIDPM] = @ApprovedByIDPM AND @ApprovedByIDPM is not null)
	OR ([approvedDatePM] = @ApprovedDatePM AND @ApprovedDatePM is not null)
	OR ([declinedByIDPM] = @DeclinedByIDPM AND @DeclinedByIDPM is not null)
	OR ([declinedDatePM] = @DeclinedDatePM AND @DeclinedDatePM is not null)
	SELECT @@ROWCOUNT			
  END
				


