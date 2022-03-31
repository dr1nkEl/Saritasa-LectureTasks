
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vCalendarPersonal view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vCalendarPersonal_Get
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
					SET @OrderBy = '[UserId]'
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
				SET @SQL = @SQL + ', [UserId]'
				SET @SQL = @SQL + ', [BranchId]'
				SET @SQL = @SQL + ', [superviserIds]'
				SET @SQL = @SQL + ', [Score]'
				SET @SQL = @SQL + ', [cID]'
				SET @SQL = @SQL + ', [date]'
				SET @SQL = @SQL + ', [holiday]'
				SET @SQL = @SQL + ', [perClId]'
				SET @SQL = @SQL + ', [num]'
				SET @SQL = @SQL + ', [perHoliday]'
				SET @SQL = @SQL + ', [isSick]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [dayType]'
				SET @SQL = @SQL + ', [onsite]'
				SET @SQL = @SQL + ' FROM [dbo].[_vCalendarPersonal]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [UserId],'
				SET @SQL = @SQL + ' [BranchId],'
				SET @SQL = @SQL + ' [superviserIds],'
				SET @SQL = @SQL + ' [Score],'
				SET @SQL = @SQL + ' [cID],'
				SET @SQL = @SQL + ' [date],'
				SET @SQL = @SQL + ' [holiday],'
				SET @SQL = @SQL + ' [perClId],'
				SET @SQL = @SQL + ' [num],'
				SET @SQL = @SQL + ' [perHoliday],'
				SET @SQL = @SQL + ' [isSick],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [dayType],'
				SET @SQL = @SQL + ' [onsite]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vCalendarPersonal]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END