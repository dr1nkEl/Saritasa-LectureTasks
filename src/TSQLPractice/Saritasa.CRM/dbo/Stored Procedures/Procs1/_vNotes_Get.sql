/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vNotes view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vNotes_Get]
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
					SET @OrderBy = '[noteID]'
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
				SET @SQL = @SQL + ', [noteID]'
				SET @SQL = @SQL + ', [parentNoteID]'
				SET @SQL = @SQL + ', [noteText]'
				SET @SQL = @SQL + ', [typeID]'
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [targetID]'
				SET @SQL = @SQL + ', [showClient]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [updated]'
				SET @SQL = @SQL + ', [updatedBy]'
				SET @SQL = @SQL + ', [deleted]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [firstName]'
				SET @SQL = @SQL + ', [lastName]'
				SET @SQL = @SQL + ', [fullName]'
				SET @SQL = @SQL + ', [creterDocID]'
				SET @SQL = @SQL + ', [emailID]'
				SET @SQL = @SQL + ', [email]'
				SET @SQL = @SQL + ', [birthday]'
				SET @SQL = @SQL + ', [timeZone]'
				SET @SQL = @SQL + ', [targetName]'
				SET @SQL = @SQL + ', [targetTypeID]'
				SET @SQL = @SQL + ', [objectID]'
				SET @SQL = @SQL + ', [needAnswer]'
				SET @SQL = @SQL + ', [viewed]'
				SET @SQL = @SQL + ' FROM [dbo].[_vNotes]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [noteID],'
				SET @SQL = @SQL + ' [parentNoteID],'
				SET @SQL = @SQL + ' [noteText],'
				SET @SQL = @SQL + ' [typeID],'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [targetID],'
				SET @SQL = @SQL + ' [showClient],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [updated],'
				SET @SQL = @SQL + ' [updatedBy],'
				SET @SQL = @SQL + ' [deleted],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [firstName],'
				SET @SQL = @SQL + ' [lastName],'
				SET @SQL = @SQL + ' [fullName],'
				SET @SQL = @SQL + ' [creterDocID],'
				SET @SQL = @SQL + ' [emailID],'
				SET @SQL = @SQL + ' [email],'
				SET @SQL = @SQL + ' [birthday],'
				SET @SQL = @SQL + ' [timeZone],'
				SET @SQL = @SQL + ' [targetName],'
				SET @SQL = @SQL + ' [targetTypeID],'
				SET @SQL = @SQL + ' [objectID],'
				SET @SQL = @SQL + ' [needAnswer],'
				SET @SQL = @SQL + ' [viewed]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vNotes]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
