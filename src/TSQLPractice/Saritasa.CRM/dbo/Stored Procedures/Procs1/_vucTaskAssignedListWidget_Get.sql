/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vucTaskAssignedListWidget view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucTaskAssignedListWidget_Get]
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
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [userID]'
				SET @SQL = @SQL + ', [assignedBy]'
				SET @SQL = @SQL + ', [firstName]'
				SET @SQL = @SQL + ', [fullName]'
				SET @SQL = @SQL + ', [lastName]'
				SET @SQL = @SQL + ', [email]'
				SET @SQL = @SQL + ', [AssignerEmail]'
				SET @SQL = @SQL + ', [AssignerFirstName]'
				SET @SQL = @SQL + ', [AssignerLastName]'
				SET @SQL = @SQL + ', [AssignerFullName]'
				SET @SQL = @SQL + ', [UserDocID]'
				SET @SQL = @SQL + ', [AssignDocID]'
				SET @SQL = @SQL + ', [accepted]'
				SET @SQL = @SQL + ', [startedWork]'
				SET @SQL = @SQL + ', [started]'
				SET @SQL = @SQL + ', [finishedWork]'
				SET @SQL = @SQL + ', [duration]'
				SET @SQL = @SQL + ', [durationLimit]'
				SET @SQL = @SQL + ', [taskLimit]'
				SET @SQL = @SQL + ', [subTaskLimit]'
				SET @SQL = @SQL + ', [menHours]'
				SET @SQL = @SQL + ', [madeother]'
				SET @SQL = @SQL + ', [isBugFixing]'
				SET @SQL = @SQL + ', [employeeID]'
				SET @SQL = @SQL + ' FROM [dbo].[_vucTaskAssignedListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [taskAssignmentID],'
				SET @SQL = @SQL + ' [assigned],'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [userID],'
				SET @SQL = @SQL + ' [assignedBy],'
				SET @SQL = @SQL + ' [firstName],'
				SET @SQL = @SQL + ' [fullName],'
				SET @SQL = @SQL + ' [lastName],'
				SET @SQL = @SQL + ' [email],'
				SET @SQL = @SQL + ' [AssignerEmail],'
				SET @SQL = @SQL + ' [AssignerFirstName],'
				SET @SQL = @SQL + ' [AssignerLastName],'
				SET @SQL = @SQL + ' [AssignerFullName],'
				SET @SQL = @SQL + ' [UserDocID],'
				SET @SQL = @SQL + ' [AssignDocID],'
				SET @SQL = @SQL + ' [accepted],'
				SET @SQL = @SQL + ' [startedWork],'
				SET @SQL = @SQL + ' [started],'
				SET @SQL = @SQL + ' [finishedWork],'
				SET @SQL = @SQL + ' [duration],'
				SET @SQL = @SQL + ' [durationLimit],'
				SET @SQL = @SQL + ' [taskLimit],'
				SET @SQL = @SQL + ' [subTaskLimit],'
				SET @SQL = @SQL + ' [menHours],'
				SET @SQL = @SQL + ' [madeother],'
				SET @SQL = @SQL + ' [isBugFixing],'
				SET @SQL = @SQL + ' [employeeID]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vucTaskAssignedListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
