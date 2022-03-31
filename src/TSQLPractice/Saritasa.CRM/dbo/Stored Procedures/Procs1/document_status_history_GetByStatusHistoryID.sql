/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_status_history table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[document_status_history_GetByStatusHistoryID]
(

	@StatusHistoryID int   
)
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
				WHERE
					[statusHistoryID] = @StatusHistoryID
				SELECT @@ROWCOUNT
