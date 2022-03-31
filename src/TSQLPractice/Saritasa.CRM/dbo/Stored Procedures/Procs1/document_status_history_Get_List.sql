/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the document_status_history table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[document_status_history_Get_List]

AS


				
				SELECT
					[statusHistoryID],
					[documentID],
					[created],
					[createdBy],
					[trackID],
					[statusID],
					[comment]
				FROM
					[dbo].[document_status_history]
					
				SELECT @@ROWCOUNT
