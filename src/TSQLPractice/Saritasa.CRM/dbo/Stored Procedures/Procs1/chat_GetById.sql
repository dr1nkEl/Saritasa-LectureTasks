
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Chat table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_GetById]
(

	@Id int   
)
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
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT