
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ChatMembers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_GetById]
(

	@Id int   
)
AS


				SELECT
					[Id],
					[ChatId],
					[UserId],
					[Closed],
					[ViewedTextLength]
				FROM
					[dbo].[ChatMembers]
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT