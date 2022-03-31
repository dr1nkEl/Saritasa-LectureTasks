
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarEvents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_GetByCreatedBy]
(

	@CreatedBy int   
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
					[CreatedBy] = @CreatedBy
				SELECT @@ROWCOUNT