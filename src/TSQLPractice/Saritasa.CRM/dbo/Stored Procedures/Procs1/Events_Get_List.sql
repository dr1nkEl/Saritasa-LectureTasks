
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Events table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Events_Get_List

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
					
				SELECT @@ROWCOUNT
			


