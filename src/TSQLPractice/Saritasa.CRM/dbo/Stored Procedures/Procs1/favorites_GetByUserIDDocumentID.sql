
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Favorites table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[favorites_GetByUserIDDocumentID]
(

	@UserId int   ,

	@DocumentId bigint   
)
AS


				SELECT
					[favoriteID],
					[DocumentId],
					[UserId],
					[Created]
				FROM
					[dbo].[Favorites]
				WHERE
					[UserId] = @UserId
					AND [DocumentId] = @DocumentId
				SELECT @@ROWCOUNT