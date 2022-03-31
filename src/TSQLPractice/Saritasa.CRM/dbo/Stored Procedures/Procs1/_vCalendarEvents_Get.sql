/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vCalendarEvents view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vCalendarEvents_Get]
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
					SET @OrderBy = '[ceID]'
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
				SET @SQL = @SQL + ', [ceID]'
				SET @SQL = @SQL + ', [date]'
				SET @SQL = @SQL + ', [text]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [typeID]'
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [objectID]'
				SET @SQL = @SQL + ', [docTypeId]'
				SET @SQL = @SQL + ', [statusID]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [taskDocID]'
				SET @SQL = @SQL + ', [taskName]'
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [projDocID]'
				SET @SQL = @SQL + ', [projName]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [clientDocID]'
				SET @SQL = @SQL + ', [clientName]'
				SET @SQL = @SQL + ', [billable]'
				SET @SQL = @SQL + ', [taskBillable]'
				SET @SQL = @SQL + ', [projectBillable]'
				SET @SQL = @SQL + ', [clientBillable]'
				SET @SQL = @SQL + ', [senderList]'
				SET @SQL = @SQL + ' FROM [dbo].[_vCalendarEvents]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [ceID],'
				SET @SQL = @SQL + ' [date],'
				SET @SQL = @SQL + ' [text],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [typeID],'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [objectID],'
				SET @SQL = @SQL + ' [docTypeId],'
				SET @SQL = @SQL + ' [statusID],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [taskDocID],'
				SET @SQL = @SQL + ' [taskName],'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [projDocID],'
				SET @SQL = @SQL + ' [projName],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [clientDocID],'
				SET @SQL = @SQL + ' [clientName],'
				SET @SQL = @SQL + ' [billable],'
				SET @SQL = @SQL + ' [taskBillable],'
				SET @SQL = @SQL + ' [projectBillable],'
				SET @SQL = @SQL + ' [clientBillable],'
				SET @SQL = @SQL + ' [senderList]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vCalendarEvents]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
