
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_document_statuses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_statuses_Delete
(

	@StatusID int   
)
AS


				DELETE FROM [dbo].[lookup_document_statuses] WITH (ROWLOCK) 
				WHERE
					[statusID] = @StatusID
					
			


