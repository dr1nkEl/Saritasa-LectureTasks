
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Tasks table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tasks_GetPaged]
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
					SET @OrderBy = '[taskID]'
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
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [Title]'
				SET @SQL = @SQL + ', [TaskText]'
				SET @SQL = @SQL + ', [StartDate]'
				SET @SQL = @SQL + ', [FinishDate]'
				SET @SQL = @SQL + ', [TypeId]'
				SET @SQL = @SQL + ', [DocumentId]'
				SET @SQL = @SQL + ', [TargetId]'
				SET @SQL = @SQL + ', [Billable]'
				SET @SQL = @SQL + ', [DurationLimit]'
				SET @SQL = @SQL + ', [ClientId]'
				SET @SQL = @SQL + ', [ProjectId]'
				SET @SQL = @SQL + ', [TesterId]'
				SET @SQL = @SQL + ', [IsContainer]'
				SET @SQL = @SQL + ', [MayAddJobs]'
				SET @SQL = @SQL + ', [WorkType]'
				SET @SQL = @SQL + ', [MakeJobsBillable]'
				SET @SQL = @SQL + ', [BillableMenHours]'
				SET @SQL = @SQL + ', [NonBillableMenHours]'
				SET @SQL = @SQL + ', [EmailMessageId]'
				SET @SQL = @SQL + ', [CurrentPushId]'
				SET @SQL = @SQL + ', [TechnicalManagerId]'
				SET @SQL = @SQL + ', [TaskVerifyId]'
				SET @SQL = @SQL + ', [DepartmentId]'
				SET @SQL = @SQL + ', [Priority]'
				SET @SQL = @SQL + ', [LastestReestimationId]'
				SET @SQL = @SQL + ', [LastestReestimationLimitType]'
				SET @SQL = @SQL + ', [LastestReestimationDueDateType]'
				SET @SQL = @SQL + ', [SprintId]'
				SET @SQL = @SQL + ', [FeatureId]'
				SET @SQL = @SQL + ', [LastestReestimationDateTime]'
				SET @SQL = @SQL + ', [MenHours]'
				SET @SQL = @SQL + ' FROM [dbo].[Tasks]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [Title],'
				SET @SQL = @SQL + ' [TaskText],'
				SET @SQL = @SQL + ' [StartDate],'
				SET @SQL = @SQL + ' [FinishDate],'
				SET @SQL = @SQL + ' [TypeId],'
				SET @SQL = @SQL + ' [DocumentId],'
				SET @SQL = @SQL + ' [TargetId],'
				SET @SQL = @SQL + ' [Billable],'
				SET @SQL = @SQL + ' [DurationLimit],'
				SET @SQL = @SQL + ' [ClientId],'
				SET @SQL = @SQL + ' [ProjectId],'
				SET @SQL = @SQL + ' [TesterId],'
				SET @SQL = @SQL + ' [IsContainer],'
				SET @SQL = @SQL + ' [MayAddJobs],'
				SET @SQL = @SQL + ' [WorkType],'
				SET @SQL = @SQL + ' [MakeJobsBillable],'
				SET @SQL = @SQL + ' [BillableMenHours],'
				SET @SQL = @SQL + ' [NonBillableMenHours],'
				SET @SQL = @SQL + ' [EmailMessageId],'
				SET @SQL = @SQL + ' [CurrentPushId],'
				SET @SQL = @SQL + ' [TechnicalManagerId],'
				SET @SQL = @SQL + ' [TaskVerifyId],'
				SET @SQL = @SQL + ' [DepartmentId],'
				SET @SQL = @SQL + ' [Priority],'
				SET @SQL = @SQL + ' [LastestReestimationId],'
				SET @SQL = @SQL + ' [LastestReestimationLimitType],'
				SET @SQL = @SQL + ' [LastestReestimationDueDateType],'
				SET @SQL = @SQL + ' [SprintId],'
				SET @SQL = @SQL + ' [FeatureId],'
				SET @SQL = @SQL + ' [LastestReestimationDateTime],'
				SET @SQL = @SQL + ' [MenHours]'
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
				SET @SQL = @SQL + ' FROM [dbo].[Tasks]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END