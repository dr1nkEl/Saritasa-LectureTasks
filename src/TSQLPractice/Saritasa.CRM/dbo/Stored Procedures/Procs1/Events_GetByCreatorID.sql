
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Events table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Events_GetByCreatorID
(

	@CreatorID int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[id],
					[start_date],
					[end_date],
					[description],
					[creatorID],
					[eventType],
					[priority]
				FROM
					[dbo].[Events]
				WHERE
					[creatorID] = @CreatorID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


