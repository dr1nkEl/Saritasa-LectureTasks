
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ChatMembers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_Get_List]

AS


				
				SELECT
					[Id],
					[ChatId],
					[UserId],
					[Closed],
					[ViewedTextLength]
				FROM
					[dbo].[ChatMembers]
					
				SELECT @@ROWCOUNT