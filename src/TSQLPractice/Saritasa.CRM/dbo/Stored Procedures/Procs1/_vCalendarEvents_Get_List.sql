
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vCalendarEvents view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vCalendarEvents_Get_List

AS


				
				SELECT
					[ceID],
					[date],
					[text],
					[createdBy],
					[typeID],
					[documentID],
					[objectID],
					[docTypeId],
					[statusID],
					[name],
					[taskDocID],
					[taskName],
					[taskID],
					[projectID],
					[projDocID],
					[projName],
					[clientID],
					[clientDocID],
					[clientName],
					[billable],
					[taskBillable],
					[projectBillable],
					[clientBillable],
					[senderList]
				FROM
					[dbo].[_vCalendarEvents]
					
				SELECT @@ROWCOUNT			
			


