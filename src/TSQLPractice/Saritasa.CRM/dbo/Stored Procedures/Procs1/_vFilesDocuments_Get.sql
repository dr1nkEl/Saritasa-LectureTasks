/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vFilesDocuments view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vFilesDocuments_Get]
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
					SET @OrderBy = '[fileID]'
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
				SET @SQL = @SQL + ', [fileID]'
				SET @SQL = @SQL + ', [groupKey]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [fileSize]'
				SET @SQL = @SQL + ', [filePath]'
				SET @SQL = @SQL + ', [fileMime]'
				SET @SQL = @SQL + ', [uniqueKey]'
				SET @SQL = @SQL + ', [fileName]'
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [targetID]'
				SET @SQL = @SQL + ', [typeID]'
				SET @SQL = @SQL + ', [priority]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [updated]'
				SET @SQL = @SQL + ', [deleted]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [updatedBy]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [folderID]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ' FROM [dbo].[_vFilesDocuments]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [fileID],'
				SET @SQL = @SQL + ' [groupKey],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [fileSize],'
				SET @SQL = @SQL + ' [filePath],'
				SET @SQL = @SQL + ' [fileMime],'
				SET @SQL = @SQL + ' [uniqueKey],'
				SET @SQL = @SQL + ' [fileName],'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [targetID],'
				SET @SQL = @SQL + ' [typeID],'
				SET @SQL = @SQL + ' [priority],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [updated],'
				SET @SQL = @SQL + ' [deleted],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [updatedBy],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [folderID],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [projectID]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vFilesDocuments]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
