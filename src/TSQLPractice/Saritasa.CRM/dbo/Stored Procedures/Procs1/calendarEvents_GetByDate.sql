
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarEvents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_GetByDate]
(

	@Date datetime   
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
					[Date] = @Date
				SELECT @@ROWCOUNT