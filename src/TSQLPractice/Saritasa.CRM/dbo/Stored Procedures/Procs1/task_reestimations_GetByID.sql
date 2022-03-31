
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_reestimations table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_GetByID
(

	@ID bigint   
)
AS


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
					[ID] = @ID
				SELECT @@ROWCOUNT
					
			


