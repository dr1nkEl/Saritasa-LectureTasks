
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the task_reestimations table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_Insert
(

	@ID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[task_reestimations]
					(
					[taskID]
					,[status]
					,[oldLimit]
					,[oldDueDate]
					,[newLimit]
					,[newDueDate]
					,[createReason]
					,[declineReason]
					,[createdByID]
					,[createdDate]
					,[approvedByIDTM]
					,[approvedDateTM]
					,[declinedByIDTM]
					,[declinedDateTM]
					,[approvedByIDPM]
					,[approvedDatePM]
					,[declinedByIDPM]
					,[declinedDatePM]
					)
				VALUES
					(
					@TaskID
					,@Status
					,@OldLimit
					,@OldDueDate
					,@NewLimit
					,@NewDueDate
					,@CreateReason
					,@DeclineReason
					,@CreatedByID
					,@CreatedDate
					,@ApprovedByIDTM
					,@ApprovedDateTM
					,@DeclinedByIDTM
					,@DeclinedDateTM
					,@ApprovedByIDPM
					,@ApprovedDatePM
					,@DeclinedByIDPM
					,@DeclinedDatePM
					)
				
				-- Get the identity value
				SET @ID = SCOPE_IDENTITY()
									
							
			


