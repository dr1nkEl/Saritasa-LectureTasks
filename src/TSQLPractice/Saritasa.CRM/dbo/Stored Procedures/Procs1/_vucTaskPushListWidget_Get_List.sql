
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucTaskPushListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucTaskPushListWidget_Get_List

AS


				
				SELECT
					[pushID],
					[taskID],
					[initiatorID],
					[recipientID],
					[created],
					[comment],
					[initiatorFirstName],
					[initiatorLastName],
					[recipientFirstName],
					[recipientLastName],
					[initiatorDepartmentID],
					[recipientDepartmentID],
					[IsInitiatorTester],
					[IsRecipientTester]
				FROM
					[dbo].[_vucTaskPushListWidget]
					
				SELECT @@ROWCOUNT			
			


