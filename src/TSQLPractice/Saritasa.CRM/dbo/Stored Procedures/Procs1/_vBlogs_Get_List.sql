
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vBlogs view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vBlogs_Get_List

AS


				
				SELECT
					[Id],
					[UserId],
					[CreatedAt],
					[Title],
					[Text],
					[CommentBlogId],
					[ParentCommentId],
					[RemovedAt],
					[UserFullName],
					[UserPhoto],
					[Rating],
					[CommentsCount],
					[UserDocumentId],
					[UserSkype],
					[UserEmail]
				FROM
					[dbo].[_vBlogs]
					
				SELECT @@ROWCOUNT