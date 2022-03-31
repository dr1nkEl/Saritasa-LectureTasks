
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_calcs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_GetByDocumentID
(

	@DocumentID bigint   
)
AS


				SELECT
					[calcID],
					[documentID],
					[typeID],
					[val]
				FROM
					[dbo].[document_calcs]
				WHERE
					[documentID] = @DocumentID
				SELECT @@ROWCOUNT
					
			


