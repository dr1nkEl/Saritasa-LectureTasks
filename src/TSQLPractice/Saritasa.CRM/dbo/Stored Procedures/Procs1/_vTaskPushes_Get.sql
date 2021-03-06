/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vTaskPushes view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vTaskPushes_Get]
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
					SET @OrderBy = '[pushID]'
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
				SET @SQL = @SQL + ', [pushID]'
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [recipientFirstName]'
				SET @SQL = @SQL + ', [recipientLastName]'
				SET @SQL = @SQL + ', [initiatorID]'
				SET @SQL = @SQL + ', [recipientID]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [finishDate]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [projectName]'
				SET @SQL = @SQL + ', [projectDocId]'
				SET @SQL = @SQL + ', [taskDocId]'
				SET @SQL = @SQL + ', [taskName]'
				SET @SQL = @SQL + ', [taskStatusName]'
				SET @SQL = @SQL + ', [recipientEmail]'
				SET @SQL = @SQL + ' FROM [dbo].[_vTaskPushes]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [pushID],'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [recipientFirstName],'
				SET @SQL = @SQL + ' [recipientLastName],'
				SET @SQL = @SQL + ' [initiatorID],'
				SET @SQL = @SQL + ' [recipientID],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [finishDate],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [projectName],'
				SET @SQL = @SQL + ' [projectDocId],'
				SET @SQL = @SQL + ' [taskDocId],'
				SET @SQL = @SQL + ' [taskName],'
				SET @SQL = @SQL + ' [taskStatusName],'
				SET @SQL = @SQL + ' [recipientEmail]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vTaskPushes]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
