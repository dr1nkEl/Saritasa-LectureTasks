﻿
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_calcs_date table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_GetByDocumentID
(

	@DocumentID bigint   
)
AS


				SELECT
					[calcID],
					[documentID],
					[typeID],
					[val],
					[date],
					[val2]
				FROM
					[dbo].[document_calcs_date]
				WHERE
					[documentID] = @DocumentID
				SELECT @@ROWCOUNT
					
			


