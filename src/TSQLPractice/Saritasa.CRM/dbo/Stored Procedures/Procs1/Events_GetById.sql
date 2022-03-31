
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Events table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Events_GetById
(

	@Id int   
)
AS


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
					[id] = @Id
				SELECT @@ROWCOUNT
					
			


