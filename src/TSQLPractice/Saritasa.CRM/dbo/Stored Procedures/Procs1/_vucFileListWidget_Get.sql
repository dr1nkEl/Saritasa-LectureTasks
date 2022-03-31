﻿/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vucFileListWidget view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucFileListWidget_Get]
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
					SET @OrderBy = '[documentID]'
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
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [updated]'
				SET @SQL = @SQL + ', [deleted]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [fileID]'
				SET @SQL = @SQL + ', [fileSize]'
				SET @SQL = @SQL + ', [filePath]'
				SET @SQL = @SQL + ', [fileMime]'
				SET @SQL = @SQL + ', [fileName]'
				SET @SQL = @SQL + ', [typeID]'
				SET @SQL = @SQL + ', [targDocId]'
				SET @SQL = @SQL + ', [targName]'
				SET @SQL = @SQL + ', [targDocType]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [uniqueKey]'
				SET @SQL = @SQL + ', [userFullName]'
				SET @SQL = @SQL + ', [createrDocID]'
				SET @SQL = @SQL + ', [createrTypeID]'
				SET @SQL = @SQL + ', [email]'
				SET @SQL = @SQL + ', [skype]'
				SET @SQL = @SQL + ', [photo]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [folderName]'
				SET @SQL = @SQL + ', [folderID]'
				SET @SQL = @SQL + ' FROM [dbo].[_vucFileListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [updated],'
				SET @SQL = @SQL + ' [deleted],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [fileID],'
				SET @SQL = @SQL + ' [fileSize],'
				SET @SQL = @SQL + ' [filePath],'
				SET @SQL = @SQL + ' [fileMime],'
				SET @SQL = @SQL + ' [fileName],'
				SET @SQL = @SQL + ' [typeID],'
				SET @SQL = @SQL + ' [targDocId],'
				SET @SQL = @SQL + ' [targName],'
				SET @SQL = @SQL + ' [targDocType],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [uniqueKey],'
				SET @SQL = @SQL + ' [userFullName],'
				SET @SQL = @SQL + ' [createrDocID],'
				SET @SQL = @SQL + ' [createrTypeID],'
				SET @SQL = @SQL + ' [email],'
				SET @SQL = @SQL + ' [skype],'
				SET @SQL = @SQL + ' [photo],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [folderName],'
				SET @SQL = @SQL + ' [folderID]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vucFileListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
