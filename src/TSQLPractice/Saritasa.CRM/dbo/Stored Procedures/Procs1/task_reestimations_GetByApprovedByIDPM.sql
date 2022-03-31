
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_reestimations table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_GetByApprovedByIDPM
(

	@ApprovedByIDPM int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[ID],
					[taskID],
					[status],
					[oldLimit],
					[oldDueDate],
					[newLimit],
					[newDueDate],
					[createReason],
					[declineReason],
					[createdByID],
					[createdDate],
					[approvedByIDTM],
					[approvedDateTM],
					[declinedByIDTM],
					[declinedDateTM],
					[approvedByIDPM],
					[approvedDatePM],
					[declinedByIDPM],
					[declinedDatePM]
				FROM
					[dbo].[task_reestimations]
				WHERE
					[approvedByIDPM] = @ApprovedByIDPM
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


