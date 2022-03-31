
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vChatMembers view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vChatMembers_Get_List

AS


				
				SELECT
					[id],
					[chatId],
					[userId],
					[closed],
					[fullName],
					[documentID],
					[email],
					[photo],
					[viewedTextLength]
				FROM
					[dbo].[_vChatMembers]
					
				SELECT @@ROWCOUNT			
			


