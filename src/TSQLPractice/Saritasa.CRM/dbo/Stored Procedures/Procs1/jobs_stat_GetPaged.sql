/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the jobs_stat table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[jobs_stat_GetPaged]
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
					SET @OrderBy = '[jobStatID]'
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
				SET @SQL = @SQL + ', [jobStatID]'
				SET @SQL = @SQL + ', [billable]'
				SET @SQL = @SQL + ', [overbudget]'
				SET @SQL = @SQL + ', [inhouse]'
				SET @SQL = @SQL + ', [unutilized]'
				SET @SQL = @SQL + ', [admin]'
				SET @SQL = @SQL + ', [capacityTotal]'
				SET @SQL = @SQL + ', [capacityBillable]'
				SET @SQL = @SQL + ', [utilization]'
				SET @SQL = @SQL + ', [periodType]'
				SET @SQL = @SQL + ', [branchID]'
				SET @SQL = @SQL + ', [departmentID]'
				SET @SQL = @SQL + ', [date]'
				SET @SQL = @SQL + ', [capacityTotalReal]'
				SET @SQL = @SQL + ', [capacityBillableReal]'
				SET @SQL = @SQL + ', [capacityBillableTodayReal]'
				SET @SQL = @SQL + ', [workTypeID]'
				SET @SQL = @SQL + ' FROM [dbo].[jobs_stat]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [jobStatID],'
				SET @SQL = @SQL + ' [billable],'
				SET @SQL = @SQL + ' [overbudget],'
				SET @SQL = @SQL + ' [inhouse],'
				SET @SQL = @SQL + ' [unutilized],'
				SET @SQL = @SQL + ' [admin],'
				SET @SQL = @SQL + ' [capacityTotal],'
				SET @SQL = @SQL + ' [capacityBillable],'
				SET @SQL = @SQL + ' [utilization],'
				SET @SQL = @SQL + ' [periodType],'
				SET @SQL = @SQL + ' [branchID],'
				SET @SQL = @SQL + ' [departmentID],'
				SET @SQL = @SQL + ' [date],'
				SET @SQL = @SQL + ' [capacityTotalReal],'
				SET @SQL = @SQL + ' [capacityBillableReal],'
				SET @SQL = @SQL + ' [capacityBillableTodayReal],'
				SET @SQL = @SQL + ' [workTypeID]'
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
				SET @SQL = @SQL + ' FROM [dbo].[jobs_stat]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END
