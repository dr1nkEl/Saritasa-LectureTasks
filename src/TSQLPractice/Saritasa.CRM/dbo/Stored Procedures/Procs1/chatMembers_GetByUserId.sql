
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ChatMembers table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_GetByUserId]
(

	@UserId int   
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
					[UserId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON