
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Chat table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_GetByLastCommentBy]
(

	@LastCommentBy int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[LastCommentBy],
					[Text],
					[Top],
					[Left],
					[Minimize]
				FROM
					[dbo].[Chat]
				WHERE
					[LastCommentBy] = @LastCommentBy
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON