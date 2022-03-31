
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the CalendarEvents table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[calendarEvents_GetByTypeID]
(

	@TypeId varchar (3)  
)
AS


				SET ANSI_NULLS OFF
				
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
					[TypeId] = @TypeId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON