
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Reports table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_GetByDocumentID]
(

	@DocumentId bigint   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[reportID],
					[ClientId],
					[DocumentId],
					[EmailedTo],
					[Email],
					[DateFrom],
					[DateTo]
				FROM
					[dbo].[Reports]
				WHERE
					[DocumentId] = @DocumentId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON