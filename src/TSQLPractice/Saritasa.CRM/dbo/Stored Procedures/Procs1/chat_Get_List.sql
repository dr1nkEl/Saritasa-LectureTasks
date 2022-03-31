
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Chat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_Get_List]

AS


				
				SELECT
					[Id],
					[LastCommentBy],
					[Text],
					[Top],
					[Left],
					[Minimize]
				FROM
					[dbo].[Chat]
					
				SELECT @@ROWCOUNT