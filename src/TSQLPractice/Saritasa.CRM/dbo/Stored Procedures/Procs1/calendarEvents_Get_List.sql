
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the CalendarEvents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_Get_List]

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
					
				SELECT @@ROWCOUNT