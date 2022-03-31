
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vBlogs view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vBlogs_Get
(

	@WhereClause varchar (2000)  ,

	@OrderBy varchar (2000)  ,

	@PageIndex int   ,

	@PageSize int   
)
AS


				
				BEGIN

				DECLARE @PageLowerBound int
				DECLARE @PageUpperBound int
				
				-- Set the page bounds
				SET @PageLowerBound = @PageSize * @PageIndex
				SET @PageUpperBound = @PageLowerBound + @PageSize

				IF (@OrderBy IS NULL OR LEN(@OrderBy) < 1)
				BEGIN
					-- default order by to first column
					SET @OrderBy = '[Id]'
				END

				-- SQL Server 2005 Paging
				DECLARE @SQL AS nvarchar(MAX)
				SET @SQL = 'WITH PageIndex AS ('
				SET @SQL = @SQL + ' SELECT'
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' TOP ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') as RowIndex'
				SET @SQL = @SQL + ', [Id]'
				SET @SQL = @SQL + ', [UserId]'
				SET @SQL = @SQL + ', [CreatedAt]'
				SET @SQL = @SQL + ', [Title]'
				SET @SQL = @SQL + ', [Text]'
				SET @SQL = @SQL + ', [CommentBlogId]'
				SET @SQL = @SQL + ', [ParentCommentId]'
				SET @SQL = @SQL + ', [RemovedAt]'
				SET @SQL = @SQL + ', [UserFullName]'
				SET @SQL = @SQL + ', [UserPhoto]'
				SET @SQL = @SQL + ', [Rating]'
				SET @SQL = @SQL + ', [CommentsCount]'
				SET @SQL = @SQL + ', [UserDocumentId]'
				SET @SQL = @SQL + ', [UserSkype]'
				SET @SQL = @SQL + ', [UserEmail]'
				SET @SQL = @SQL + ' FROM [dbo].[_vBlogs]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [Id],'
				SET @SQL = @SQL + ' [UserId],'
				SET @SQL = @SQL + ' [CreatedAt],'
				SET @SQL = @SQL + ' [Title],'
				SET @SQL = @SQL + ' [Text],'
				SET @SQL = @SQL + ' [CommentBlogId],'
				SET @SQL = @SQL + ' [ParentCommentId],'
				SET @SQL = @SQL + ' [RemovedAt],'
				SET @SQL = @SQL + ' [UserFullName],'
				SET @SQL = @SQL + ' [UserPhoto],'
				SET @SQL = @SQL + ' [Rating],'
				SET @SQL = @SQL + ' [CommentsCount],'
				SET @SQL = @SQL + ' [UserDocumentId],'
				SET @SQL = @SQL + ' [UserSkype],'
				SET @SQL = @SQL + ' [UserEmail]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				IF LEN(@OrderBy) > 0
				BEGIN
					SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				END
				EXEC sp_executesql @SQL

				-- get row count
				SET @SQL = 'SELECT COUNT(*) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[_vBlogs]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END