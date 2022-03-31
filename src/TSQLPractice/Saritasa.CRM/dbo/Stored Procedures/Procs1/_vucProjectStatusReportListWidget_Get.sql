
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vucProjectStatusReportListWidget view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucProjectStatusReportListWidget_Get
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
					SET @OrderBy = '[ProjectId]'
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
				SET @SQL = @SQL + ', [ProjectId]'
				SET @SQL = @SQL + ', [ProjectName]'
				SET @SQL = @SQL + ', [DurationLimit]'
				SET @SQL = @SQL + ', [MinHoursPerMonth]'
				SET @SQL = @SQL + ', [StartDate]'
				SET @SQL = @SQL + ', [ProposedFinishDate]'
				SET @SQL = @SQL + ', [MenHours]'
				SET @SQL = @SQL + ', [BillableMenHours]'
				SET @SQL = @SQL + ', [NonBillableMenHours]'
				SET @SQL = @SQL + ', [BillingType]'
				SET @SQL = @SQL + ', [PriorityId]'
				SET @SQL = @SQL + ', [Frequency]'
				SET @SQL = @SQL + ', [Notes]'
				SET @SQL = @SQL + ', [ClientDocumentId]'
				SET @SQL = @SQL + ', [ClientId]'
				SET @SQL = @SQL + ', [ClientName]'
				SET @SQL = @SQL + ', [ClientContractTill]'
				SET @SQL = @SQL + ', [ProjectManagersUserIdsList]'
				SET @SQL = @SQL + ', [WorkAllocationCurrentMonth]'
				SET @SQL = @SQL + ', [WorkAllocationNextMonth]'
				SET @SQL = @SQL + ', [TotalMonthJobs]'
				SET @SQL = @SQL + ', [BillibleMonthJobs]'
				SET @SQL = @SQL + ', [StatusId]'
				SET @SQL = @SQL + ', [NotPaidMilestonesCount]'
				SET @SQL = @SQL + ', [AccountManagerName]'
				SET @SQL = @SQL + ', [AccountManagerDocumentID]'
				SET @SQL = @SQL + ', [AccountManagerEmail]'
				SET @SQL = @SQL + ', [AccountManagerSkype]'
				SET @SQL = @SQL + ', [AccountManagerPhoto]'
				SET @SQL = @SQL + ', [DevelopmentStartDate]'
				SET @SQL = @SQL + ', [DevelopmentStarted]'
				SET @SQL = @SQL + ', [ReviewName]'
				SET @SQL = @SQL + ', [ReviewRating]'
				SET @SQL = @SQL + ', [ReviewDate]'
				SET @SQL = @SQL + ', [ReviewerName]'
				SET @SQL = @SQL + ', [ReviewerUserId]'
				SET @SQL = @SQL + ', [LastReviewName]'
				SET @SQL = @SQL + ', [LastReviewRating]'
				SET @SQL = @SQL + ', [LastReviewDate]'
				SET @SQL = @SQL + ', [LastReviewerName]'
				SET @SQL = @SQL + ', [LastReviewerUserId]'
				SET @SQL = @SQL + ', [IsMidProjectSurvey]'
				SET @SQL = @SQL + ', [LastMilestoneId]'
				SET @SQL = @SQL + ', [LastMilestoneActualReleaseDate]'
				SET @SQL = @SQL + ', [LastMilestoneName]'
				SET @SQL = @SQL + ', [LastMilestoneReleaseVersion]'
				SET @SQL = @SQL + ', [NextMilestoneId]'
				SET @SQL = @SQL + ', [NextMilestoneActualReleaseDate]'
				SET @SQL = @SQL + ', [NextMilestoneName]'
				SET @SQL = @SQL + ', [NextMilestoneReleaseVersion]'
				SET @SQL = @SQL + ' FROM [dbo].[_vucProjectStatusReportListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [ProjectId],'
				SET @SQL = @SQL + ' [ProjectName],'
				SET @SQL = @SQL + ' [DurationLimit],'
				SET @SQL = @SQL + ' [MinHoursPerMonth],'
				SET @SQL = @SQL + ' [StartDate],'
				SET @SQL = @SQL + ' [ProposedFinishDate],'
				SET @SQL = @SQL + ' [MenHours],'
				SET @SQL = @SQL + ' [BillableMenHours],'
				SET @SQL = @SQL + ' [NonBillableMenHours],'
				SET @SQL = @SQL + ' [BillingType],'
				SET @SQL = @SQL + ' [PriorityId],'
				SET @SQL = @SQL + ' [Frequency],'
				SET @SQL = @SQL + ' [Notes],'
				SET @SQL = @SQL + ' [ClientDocumentId],'
				SET @SQL = @SQL + ' [ClientId],'
				SET @SQL = @SQL + ' [ClientName],'
				SET @SQL = @SQL + ' [ClientContractTill],'
				SET @SQL = @SQL + ' [ProjectManagersUserIdsList],'
				SET @SQL = @SQL + ' [WorkAllocationCurrentMonth],'
				SET @SQL = @SQL + ' [WorkAllocationNextMonth],'
				SET @SQL = @SQL + ' [TotalMonthJobs],'
				SET @SQL = @SQL + ' [BillibleMonthJobs],'
				SET @SQL = @SQL + ' [StatusId],'
				SET @SQL = @SQL + ' [NotPaidMilestonesCount],'
				SET @SQL = @SQL + ' [AccountManagerName],'
				SET @SQL = @SQL + ' [AccountManagerDocumentID],'
				SET @SQL = @SQL + ' [AccountManagerEmail],'
				SET @SQL = @SQL + ' [AccountManagerSkype],'
				SET @SQL = @SQL + ' [AccountManagerPhoto],'
				SET @SQL = @SQL + ' [DevelopmentStartDate],'
				SET @SQL = @SQL + ' [DevelopmentStarted],'
				SET @SQL = @SQL + ' [ReviewName],'
				SET @SQL = @SQL + ' [ReviewRating],'
				SET @SQL = @SQL + ' [ReviewDate],'
				SET @SQL = @SQL + ' [ReviewerName],'
				SET @SQL = @SQL + ' [ReviewerUserId],'
				SET @SQL = @SQL + ' [LastReviewName],'
				SET @SQL = @SQL + ' [LastReviewRating],'
				SET @SQL = @SQL + ' [LastReviewDate],'
				SET @SQL = @SQL + ' [LastReviewerName],'
				SET @SQL = @SQL + ' [LastReviewerUserId],'
				SET @SQL = @SQL + ' [IsMidProjectSurvey],'
				SET @SQL = @SQL + ' [LastMilestoneId],'
				SET @SQL = @SQL + ' [LastMilestoneActualReleaseDate],'
				SET @SQL = @SQL + ' [LastMilestoneName],'
				SET @SQL = @SQL + ' [LastMilestoneReleaseVersion],'
				SET @SQL = @SQL + ' [NextMilestoneId],'
				SET @SQL = @SQL + ' [NextMilestoneActualReleaseDate],'
				SET @SQL = @SQL + ' [NextMilestoneName],'
				SET @SQL = @SQL + ' [NextMilestoneReleaseVersion]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vucProjectStatusReportListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END