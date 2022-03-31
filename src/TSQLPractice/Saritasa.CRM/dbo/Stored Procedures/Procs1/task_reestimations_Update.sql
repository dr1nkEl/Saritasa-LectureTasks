
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the task_reestimations table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_Update
(

	@ID bigint   ,

	@TaskID bigint   ,

	@Status int   ,

	@OldLimit int   ,

	@OldDueDate datetime   ,

	@NewLimit int   ,

	@NewDueDate datetime   ,

	@CreateReason varchar (MAX)  ,

	@DeclineReason varchar (MAX)  ,

	@CreatedByID int   ,

	@CreatedDate datetime   ,

	@ApprovedByIDTM int   ,

	@ApprovedDateTM datetime   ,

	@DeclinedByIDTM int   ,

	@DeclinedDateTM datetime   ,

	@ApprovedByIDPM int   ,

	@ApprovedDatePM datetime   ,

	@DeclinedByIDPM int   ,

	@DeclinedDatePM datetime   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[task_reestimations]
				SET
					[taskID] = @TaskID
					,[status] = @Status
					,[oldLimit] = @OldLimit
					,[oldDueDate] = @OldDueDate
					,[newLimit] = @NewLimit
					,[newDueDate] = @NewDueDate
					,[createReason] = @CreateReason
					,[declineReason] = @DeclineReason
					,[createdByID] = @CreatedByID
					,[createdDate] = @CreatedDate
					,[approvedByIDTM] = @ApprovedByIDTM
					,[approvedDateTM] = @ApprovedDateTM
					,[declinedByIDTM] = @DeclinedByIDTM
					,[declinedDateTM] = @DeclinedDateTM
					,[approvedByIDPM] = @ApprovedByIDPM
					,[approvedDatePM] = @ApprovedDatePM
					,[declinedByIDPM] = @DeclinedByIDPM
					,[declinedDatePM] = @DeclinedDatePM
				WHERE
[ID] = @ID 
				
			


