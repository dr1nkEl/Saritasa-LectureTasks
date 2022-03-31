
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the document_status_history table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_status_history_Delete
(

	@StatusHistoryID int   
)
AS


				DELETE FROM [dbo].[document_status_history] WITH (ROWLOCK) 
				WHERE
					[statusHistoryID] = @StatusHistoryID
					
			


