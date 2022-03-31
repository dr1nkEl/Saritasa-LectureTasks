
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ChatMembers table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_GetByChatId]
(

	@ChatId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[ChatId],
					[UserId],
					[Closed],
					[ViewedTextLength]
				FROM
					[dbo].[ChatMembers]
				WHERE
					[ChatId] = @ChatId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON