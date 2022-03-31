/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vProjectCheckList view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vProjectCheckList_Get]
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
					SET @OrderBy = '[checkID]'
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
				SET @SQL = @SQL + ', [checkID]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [isKickOff]'
				SET @SQL = @SQL + ', [orderID]'
				SET @SQL = @SQL + ', [parentID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [pmCheck]'
				SET @SQL = @SQL + ', [amCheck]'
				SET @SQL = @SQL + ', [actualDate]'
				SET @SQL = @SQL + ', [projectCheckId]'
				SET @SQL = @SQL + ', [isRequired]'
				SET @SQL = @SQL + ', [checkType]'
				SET @SQL = @SQL + ' FROM [dbo].[_vProjectCheckList]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [checkID],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [isKickOff],'
				SET @SQL = @SQL + ' [orderID],'
				SET @SQL = @SQL + ' [parentID],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [pmCheck],'
				SET @SQL = @SQL + ' [amCheck],'
				SET @SQL = @SQL + ' [actualDate],'
				SET @SQL = @SQL + ' [projectCheckId],'
				SET @SQL = @SQL + ' [isRequired],'
				SET @SQL = @SQL + ' [checkType]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vProjectCheckList]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
