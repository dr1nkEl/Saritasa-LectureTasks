
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarEvents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_GetByDocumentID]
(

	@DocumentId bigint   
)
AS


				SELECT
					[ceID],
					[Date],
					[Text],
					[CreatedBy],
					[DocumentId],
					[TypeId],
					[SenderList]
				FROM
					[dbo].[CalendarEvents]
				WHERE
					[DocumentId] = @DocumentId
				SELECT @@ROWCOUNT