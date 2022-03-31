
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the task_reestimations table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_reestimations_Get_List

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
					
				SELECT @@ROWCOUNT
			


