
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Employees table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_GetPaged
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
				SET @SQL = @SQL + ', [PreviousEmployment]'
				SET @SQL = @SQL + ', [ContractSignedAt]'
				SET @SQL = @SQL + ', [BranchId]'
				SET @SQL = @SQL + ', [OnSite]'
				SET @SQL = @SQL + ', [Comments]'
				SET @SQL = @SQL + ', [Photo]'
				SET @SQL = @SQL + ', [Score]'
				SET @SQL = @SQL + ', [DailyReportNotRequired]'
				SET @SQL = @SQL + ', [LastHrmContactAt]'
				SET @SQL = @SQL + ', [IsPartTime]'
				SET @SQL = @SQL + ', [BucketTaskId]'
				SET @SQL = @SQL + ', [DefaultBucketJobText]'
				SET @SQL = @SQL + ', [DefaultBucketTaskTitle]'
				SET @SQL = @SQL + ', [RecruitedByUserId]'
				SET @SQL = @SQL + ', [VendorId]'
				SET @SQL = @SQL + ', [RecruitSourceId]'
				SET @SQL = @SQL + ', [FirstWorkingDate]'
				SET @SQL = @SQL + ', [LastWorkingDate]'
				SET @SQL = @SQL + ', [IsIntern]'
				SET @SQL = @SQL + ' FROM [dbo].[Employees]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [Id],'
				SET @SQL = @SQL + ' [PreviousEmployment],'
				SET @SQL = @SQL + ' [ContractSignedAt],'
				SET @SQL = @SQL + ' [BranchId],'
				SET @SQL = @SQL + ' [OnSite],'
				SET @SQL = @SQL + ' [Comments],'
				SET @SQL = @SQL + ' [Photo],'
				SET @SQL = @SQL + ' [Score],'
				SET @SQL = @SQL + ' [DailyReportNotRequired],'
				SET @SQL = @SQL + ' [LastHrmContactAt],'
				SET @SQL = @SQL + ' [IsPartTime],'
				SET @SQL = @SQL + ' [BucketTaskId],'
				SET @SQL = @SQL + ' [DefaultBucketJobText],'
				SET @SQL = @SQL + ' [DefaultBucketTaskTitle],'
				SET @SQL = @SQL + ' [RecruitedByUserId],'
				SET @SQL = @SQL + ' [VendorId],'
				SET @SQL = @SQL + ' [RecruitSourceId],'
				SET @SQL = @SQL + ' [FirstWorkingDate],'
				SET @SQL = @SQL + ' [LastWorkingDate],'
				SET @SQL = @SQL + ' [IsIntern]'
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
				SET @SQL = @SQL + ' FROM [dbo].[Employees]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END