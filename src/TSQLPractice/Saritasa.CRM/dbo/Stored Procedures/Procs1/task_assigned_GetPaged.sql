/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the task_assigned table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[task_assigned_GetPaged]
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
					SET @OrderBy = '[taskAssignmentID]'
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
				SET @SQL = @SQL + ', [taskAssignmentID]'
				SET @SQL = @SQL + ', [assigned]'
				SET @SQL = @SQL + ', [accepted]'
				SET @SQL = @SQL + ', [startedWork]'
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [userID]'
				SET @SQL = @SQL + ', [assignedBy]'
				SET @SQL = @SQL + ', [finishedWork]'
				SET @SQL = @SQL + ', [deleted]'
				SET @SQL = @SQL + ', [durationLimit]'
				SET @SQL = @SQL + ', [madeother]'
				SET @SQL = @SQL + ', [isBugFixing]'
				SET @SQL = @SQL + ', [externalID]'
				SET @SQL = @SQL + ', [externalDBID]'
				SET @SQL = @SQL + ', [isExternalCopy]'
				SET @SQL = @SQL + ' FROM [dbo].[task_assigned]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [taskAssignmentID],'
				SET @SQL = @SQL + ' [assigned],'
				SET @SQL = @SQL + ' [accepted],'
				SET @SQL = @SQL + ' [startedWork],'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [userID],'
				SET @SQL = @SQL + ' [assignedBy],'
				SET @SQL = @SQL + ' [finishedWork],'
				SET @SQL = @SQL + ' [deleted],'
				SET @SQL = @SQL + ' [durationLimit],'
				SET @SQL = @SQL + ' [madeother],'
				SET @SQL = @SQL + ' [isBugFixing],'
				SET @SQL = @SQL + ' [externalID],'
				SET @SQL = @SQL + ' [externalDBID],'
				SET @SQL = @SQL + ' [isExternalCopy]'
				SET @SQL = @SQL + ' FROM PageIndex'
				SET @SQL = @SQL + ' WHERE RowIndex > ' + CONVERT(nvarchar, @PageLowerBound)
				IF @PageSize > 0
				BEGIN
					SET @SQL = @SQL + ' AND RowIndex <= ' + CONVERT(nvarchar, @PageUpperBound)
				END
				SET @SQL = @SQL + ' ORDER BY ' + @OrderBy
				EXEC sp_executesql @SQL
				
				-- get row count
				SET @SQL = 'SELECT COUNT(*) AS TotalRowCount'
				SET @SQL = @SQL + ' FROM [dbo].[task_assigned]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
