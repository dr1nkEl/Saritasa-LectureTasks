/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vucProjectListWidget view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucProjectListWidget_Get]
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
					SET @OrderBy = '[projectID]'
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
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [title]'
				SET @SQL = @SQL + ', [durationLimit]'
				SET @SQL = @SQL + ', [MinHoursPerMonth]'
				SET @SQL = @SQL + ', [proposedFinishDate]'
				SET @SQL = @SQL + ', [startDate]'
				SET @SQL = @SQL + ', [menHours]'
				SET @SQL = @SQL + ', [billableMenHours]'
				SET @SQL = @SQL + ', [nonbillableMenHours]'
				SET @SQL = @SQL + ', [clientDocID]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [clientName]'
				SET @SQL = @SQL + ', [parentClientID]'
				SET @SQL = @SQL + ', [contactUserID]'
				SET @SQL = @SQL + ', [contactFullName]'
				SET @SQL = @SQL + ', [contactDocID]'
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [colorCode]'
				SET @SQL = @SQL + ', [statusName]'
				SET @SQL = @SQL + ', [TManagerUserID]'
				SET @SQL = @SQL + ', [SManagerUserID]'
				SET @SQL = @SQL + ', [tasks]'
				SET @SQL = @SQL + ', [pManagersUserIdList]'
				SET @SQL = @SQL + ', [pMmanagersDocIdList]'
				SET @SQL = @SQL + ', [utilization]'
				SET @SQL = @SQL + ', [TotalJobsForMonth]'
				SET @SQL = @SQL + ', [TotalJobsForPrevMonth]'
				SET @SQL = @SQL + ', [TotalJobsForNextMonth]'
				SET @SQL = @SQL + ', [WorkAllocationCurrentMonth]'
				SET @SQL = @SQL + ', [WorkAllocationPrevMonth]'
				SET @SQL = @SQL + ', [WorkAllocationNextMonth]'
				SET @SQL = @SQL + ', [currentDate]'
				SET @SQL = @SQL + ', [developmentStartDate]'
				SET @SQL = @SQL + ', [developmentStarted]'
				SET @SQL = @SQL + ', [reviewName]'
				SET @SQL = @SQL + ', [reviewRating]'
				SET @SQL = @SQL + ', [reviewDate]'
				SET @SQL = @SQL + ', [reviewerName]'
				SET @SQL = @SQL + ', [reviewerUserID]'
				SET @SQL = @SQL + ', [lastReviewName]'
				SET @SQL = @SQL + ', [lastReviewRating]'
				SET @SQL = @SQL + ', [lastReviewDate]'
				SET @SQL = @SQL + ', [lastReviewerName]'
				SET @SQL = @SQL + ', [lastReviewerUserID]'
				SET @SQL = @SQL + ', [CurrentMonthAmplification]'
				SET @SQL = @SQL + ', [PreviousMonthAmplification]'
				SET @SQL = @SQL + ' FROM [dbo].[_vucProjectListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [title],'
				SET @SQL = @SQL + ' [durationLimit],'
				SET @SQL = @SQL + ' [MinHoursPerMonth],'
				SET @SQL = @SQL + ' [proposedFinishDate],'
				SET @SQL = @SQL + ' [startDate],'
				SET @SQL = @SQL + ' [menHours],'
				SET @SQL = @SQL + ' [billableMenHours],'
				SET @SQL = @SQL + ' [nonbillableMenHours],'
				SET @SQL = @SQL + ' [clientDocID],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [clientName],'
				SET @SQL = @SQL + ' [parentClientID],'
				SET @SQL = @SQL + ' [contactUserID],'
				SET @SQL = @SQL + ' [contactFullName],'
				SET @SQL = @SQL + ' [contactDocID],'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [colorCode],'
				SET @SQL = @SQL + ' [statusName],'
				SET @SQL = @SQL + ' [TManagerUserID],'
				SET @SQL = @SQL + ' [SManagerUserID],'
				SET @SQL = @SQL + ' [tasks],'
				SET @SQL = @SQL + ' [pManagersUserIdList],'
				SET @SQL = @SQL + ' [pMmanagersDocIdList],'
				SET @SQL = @SQL + ' [utilization],'
				SET @SQL = @SQL + ' [TotalJobsForMonth],'
				SET @SQL = @SQL + ' [TotalJobsForPrevMonth],'
				SET @SQL = @SQL + ' [TotalJobsForNextMonth],'
				SET @SQL = @SQL + ' [WorkAllocationCurrentMonth],'
				SET @SQL = @SQL + ' [WorkAllocationPrevMonth],'
				SET @SQL = @SQL + ' [WorkAllocationNextMonth],'
				SET @SQL = @SQL + ' [currentDate],'
				SET @SQL = @SQL + ' [developmentStartDate],'
				SET @SQL = @SQL + ' [developmentStarted],'
				SET @SQL = @SQL + ' [reviewName],'
				SET @SQL = @SQL + ' [reviewRating],'
				SET @SQL = @SQL + ' [reviewDate],'
				SET @SQL = @SQL + ' [reviewerName],'
				SET @SQL = @SQL + ' [reviewerUserID],'
				SET @SQL = @SQL + ' [lastReviewName],'
				SET @SQL = @SQL + ' [lastReviewRating],'
				SET @SQL = @SQL + ' [lastReviewDate],'
				SET @SQL = @SQL + ' [lastReviewerName],'
				SET @SQL = @SQL + ' [lastReviewerUserID],'
				SET @SQL = @SQL + ' [CurrentMonthAmplification],'
				SET @SQL = @SQL + ' [PreviousMonthAmplification]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vucProjectListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
