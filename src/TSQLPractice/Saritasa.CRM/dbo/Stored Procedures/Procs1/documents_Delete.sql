
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Documents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_Delete]
(

	@DocumentID bigint   
)
AS


				DELETE FROM [dbo].[Documents] WITH (ROWLOCK) 
				WHERE
					[documentID] = @DocumentID