/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_status_history table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[document_status_history_GetByDocumentID]
(

	@DocumentID bigint   
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
					[documentID] = @DocumentID
				SELECT @@ROWCOUNT
