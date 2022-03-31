
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the ProjectMilestones table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_GetPaged]
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
					SET @OrderBy = '[Id]'
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
				SET @SQL = @SQL + ', [Id]'
				SET @SQL = @SQL + ', [ProjectId]'
				SET @SQL = @SQL + ', [Name]'
				SET @SQL = @SQL + ', [ReleaseVersion]'
				SET @SQL = @SQL + ', [ScheduledDate]'
				SET @SQL = @SQL + ', [LimitHours]'
				SET @SQL = @SQL + ', [Released]'
				SET @SQL = @SQL + ', [ActualReleaseDate]'
				SET @SQL = @SQL + ', [Order]'
				SET @SQL = @SQL + ', [CreatedAt]'
				SET @SQL = @SQL + ', [CreatedByUserId]'
				SET @SQL = @SQL + ', [UpdatedAt]'
				SET @SQL = @SQL + ', [UpdatedByUserId]'
				SET @SQL = @SQL + ' FROM [dbo].[ProjectMilestones]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [Id],'
				SET @SQL = @SQL + ' [ProjectId],'
				SET @SQL = @SQL + ' [Name],'
				SET @SQL = @SQL + ' [ReleaseVersion],'
				SET @SQL = @SQL + ' [ScheduledDate],'
				SET @SQL = @SQL + ' [LimitHours],'
				SET @SQL = @SQL + ' [Released],'
				SET @SQL = @SQL + ' [ActualReleaseDate],'
				SET @SQL = @SQL + ' [Order],'
				SET @SQL = @SQL + ' [CreatedAt],'
				SET @SQL = @SQL + ' [CreatedByUserId],'
				SET @SQL = @SQL + ' [UpdatedAt],'
				SET @SQL = @SQL + ' [UpdatedByUserId]'
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
				SET @SQL = @SQL + ' FROM [dbo].[ProjectMilestones]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END