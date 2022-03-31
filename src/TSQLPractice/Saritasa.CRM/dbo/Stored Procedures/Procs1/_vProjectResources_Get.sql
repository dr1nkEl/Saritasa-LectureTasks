
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vProjectResources view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vProjectResources_Get
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
				SET @SQL = @SQL + ', [UserId]'
				SET @SQL = @SQL + ', [ProjectId]'
				SET @SQL = @SQL + ', [WorkTypeId]'
				SET @SQL = @SQL + ', [WorkTypeName]'
				SET @SQL = @SQL + ', [CreatedAt]'
				SET @SQL = @SQL + ', [CreatedByUserId]'
				SET @SQL = @SQL + ', [ProjectDepartmentId]'
				SET @SQL = @SQL + ', [ProjectDepartmentName]'
				SET @SQL = @SQL + ', [FirstName]'
				SET @SQL = @SQL + ', [LastName]'
				SET @SQL = @SQL + ', [UserTitle]'
				SET @SQL = @SQL + ', [UserFullName]'
				SET @SQL = @SQL + ', [UserEmailId]'
				SET @SQL = @SQL + ', [UserEmail]'
				SET @SQL = @SQL + ', [UserDocumentId]'
				SET @SQL = @SQL + ', [UserTypeId]'
				SET @SQL = @SQL + ', [StartDate]'
				SET @SQL = @SQL + ', [ProposedFinishDate]'
				SET @SQL = @SQL + ', [DevelopmentSite]'
				SET @SQL = @SQL + ', [ActualSite]'
				SET @SQL = @SQL + ', [ActualFinishDate]'
				SET @SQL = @SQL + ', [Description]'
				SET @SQL = @SQL + ', [ProjectName]'
				SET @SQL = @SQL + ', [ParentProjectId]'
				SET @SQL = @SQL + ', [Notes]'
				SET @SQL = @SQL + ', [ProjectDocumentId]'
				SET @SQL = @SQL + ', [ClientId]'
				SET @SQL = @SQL + ', [UserBirthday]'
				SET @SQL = @SQL + ', [UserTimeZone]'
				SET @SQL = @SQL + ', [Billable]'
				SET @SQL = @SQL + ', [DurationLimit]'
				SET @SQL = @SQL + ', [UserStatusId]'
				SET @SQL = @SQL + ', [CurrentMonthJobsMinutes]'
				SET @SQL = @SQL + ', [PreviousMonthJobsMinutes]'
				SET @SQL = @SQL + ', [IsDedicated]'
				SET @SQL = @SQL + ', [UpdatedAt]'
				SET @SQL = @SQL + ', [UpdatedByUserId]'
				SET @SQL = @SQL + ' FROM [dbo].[_vProjectResources]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [Id],'
				SET @SQL = @SQL + ' [UserId],'
				SET @SQL = @SQL + ' [ProjectId],'
				SET @SQL = @SQL + ' [WorkTypeId],'
				SET @SQL = @SQL + ' [WorkTypeName],'
				SET @SQL = @SQL + ' [CreatedAt],'
				SET @SQL = @SQL + ' [CreatedByUserId],'
				SET @SQL = @SQL + ' [ProjectDepartmentId],'
				SET @SQL = @SQL + ' [ProjectDepartmentName],'
				SET @SQL = @SQL + ' [FirstName],'
				SET @SQL = @SQL + ' [LastName],'
				SET @SQL = @SQL + ' [UserTitle],'
				SET @SQL = @SQL + ' [UserFullName],'
				SET @SQL = @SQL + ' [UserEmailId],'
				SET @SQL = @SQL + ' [UserEmail],'
				SET @SQL = @SQL + ' [UserDocumentId],'
				SET @SQL = @SQL + ' [UserTypeId],'
				SET @SQL = @SQL + ' [StartDate],'
				SET @SQL = @SQL + ' [ProposedFinishDate],'
				SET @SQL = @SQL + ' [DevelopmentSite],'
				SET @SQL = @SQL + ' [ActualSite],'
				SET @SQL = @SQL + ' [ActualFinishDate],'
				SET @SQL = @SQL + ' [Description],'
				SET @SQL = @SQL + ' [ProjectName],'
				SET @SQL = @SQL + ' [ParentProjectId],'
				SET @SQL = @SQL + ' [Notes],'
				SET @SQL = @SQL + ' [ProjectDocumentId],'
				SET @SQL = @SQL + ' [ClientId],'
				SET @SQL = @SQL + ' [UserBirthday],'
				SET @SQL = @SQL + ' [UserTimeZone],'
				SET @SQL = @SQL + ' [Billable],'
				SET @SQL = @SQL + ' [DurationLimit],'
				SET @SQL = @SQL + ' [UserStatusId],'
				SET @SQL = @SQL + ' [CurrentMonthJobsMinutes],'
				SET @SQL = @SQL + ' [PreviousMonthJobsMinutes],'
				SET @SQL = @SQL + ' [IsDedicated],'
				SET @SQL = @SQL + ' [UpdatedAt],'
				SET @SQL = @SQL + ' [UpdatedByUserId]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vProjectResources]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END