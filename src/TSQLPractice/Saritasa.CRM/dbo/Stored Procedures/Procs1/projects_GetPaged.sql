
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Projects table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_GetPaged]
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
				SET @SQL = @SQL + ', [StartDate]'
				SET @SQL = @SQL + ', [ProposedFinishDate]'
				SET @SQL = @SQL + ', [DevSite]'
				SET @SQL = @SQL + ', [ActualSite]'
				SET @SQL = @SQL + ', [ActualFinishDate]'
				SET @SQL = @SQL + ', [Description]'
				SET @SQL = @SQL + ', [Title]'
				SET @SQL = @SQL + ', [ParentProjectId]'
				SET @SQL = @SQL + ', [Notes]'
				SET @SQL = @SQL + ', [CompleteLine]'
				SET @SQL = @SQL + ', [DocumentId]'
				SET @SQL = @SQL + ', [DiscountId]'
				SET @SQL = @SQL + ', [UserId]'
				SET @SQL = @SQL + ', [ClientId]'
				SET @SQL = @SQL + ', [Billable]'
				SET @SQL = @SQL + ', [DurationLimit]'
				SET @SQL = @SQL + ', [MailMan]'
				SET @SQL = @SQL + ', [ShowClient]'
				SET @SQL = @SQL + ', [Priority]'
				SET @SQL = @SQL + ', [HasHosting]'
				SET @SQL = @SQL + ', [HostingFee]'
				SET @SQL = @SQL + ', [BillingType]'
				SET @SQL = @SQL + ', [Frequency]'
				SET @SQL = @SQL + ', [PriorityId]'
				SET @SQL = @SQL + ', [HostingStart]'
				SET @SQL = @SQL + ', [HostingFrequency]'
				SET @SQL = @SQL + ', [LimitHistory]'
				SET @SQL = @SQL + ', [Send75Limit]'
				SET @SQL = @SQL + ', [SendLimitExceed]'
				SET @SQL = @SQL + ', [Send125Limit]'
				SET @SQL = @SQL + ', [Send150Limit]'
				SET @SQL = @SQL + ', [MobileAleas]'
				SET @SQL = @SQL + ', [MinHoursPerMonth]'
				SET @SQL = @SQL + ', [BillableMenHours]'
				SET @SQL = @SQL + ', [NonBillableMenHours]'
				SET @SQL = @SQL + ', [Utilization]'
				SET @SQL = @SQL + ', [BillingVariable]'
				SET @SQL = @SQL + ', [Overbudget]'
				SET @SQL = @SQL + ', [DevelopmentStartDate]'
				SET @SQL = @SQL + ', [Launched]'
				SET @SQL = @SQL + ', [DevelopmentStarted]'
				SET @SQL = @SQL + ', [JiraAllowAddJobs]'
				SET @SQL = @SQL + ', [IsMidProjectSurvey]'
				SET @SQL = @SQL + ', [MenHours]'
				SET @SQL = @SQL + ', [ZohoPotentialId]'
				SET @SQL = @SQL + ', [EnvironmentCode]'
				SET @SQL = @SQL + ', [Nickname]'
				SET @SQL = @SQL + ' FROM [dbo].[Projects]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [StartDate],'
				SET @SQL = @SQL + ' [ProposedFinishDate],'
				SET @SQL = @SQL + ' [DevSite],'
				SET @SQL = @SQL + ' [ActualSite],'
				SET @SQL = @SQL + ' [ActualFinishDate],'
				SET @SQL = @SQL + ' [Description],'
				SET @SQL = @SQL + ' [Title],'
				SET @SQL = @SQL + ' [ParentProjectId],'
				SET @SQL = @SQL + ' [Notes],'
				SET @SQL = @SQL + ' [CompleteLine],'
				SET @SQL = @SQL + ' [DocumentId],'
				SET @SQL = @SQL + ' [DiscountId],'
				SET @SQL = @SQL + ' [UserId],'
				SET @SQL = @SQL + ' [ClientId],'
				SET @SQL = @SQL + ' [Billable],'
				SET @SQL = @SQL + ' [DurationLimit],'
				SET @SQL = @SQL + ' [MailMan],'
				SET @SQL = @SQL + ' [ShowClient],'
				SET @SQL = @SQL + ' [Priority],'
				SET @SQL = @SQL + ' [HasHosting],'
				SET @SQL = @SQL + ' [HostingFee],'
				SET @SQL = @SQL + ' [BillingType],'
				SET @SQL = @SQL + ' [Frequency],'
				SET @SQL = @SQL + ' [PriorityId],'
				SET @SQL = @SQL + ' [HostingStart],'
				SET @SQL = @SQL + ' [HostingFrequency],'
				SET @SQL = @SQL + ' [LimitHistory],'
				SET @SQL = @SQL + ' [Send75Limit],'
				SET @SQL = @SQL + ' [SendLimitExceed],'
				SET @SQL = @SQL + ' [Send125Limit],'
				SET @SQL = @SQL + ' [Send150Limit],'
				SET @SQL = @SQL + ' [MobileAleas],'
				SET @SQL = @SQL + ' [MinHoursPerMonth],'
				SET @SQL = @SQL + ' [BillableMenHours],'
				SET @SQL = @SQL + ' [NonBillableMenHours],'
				SET @SQL = @SQL + ' [Utilization],'
				SET @SQL = @SQL + ' [BillingVariable],'
				SET @SQL = @SQL + ' [Overbudget],'
				SET @SQL = @SQL + ' [DevelopmentStartDate],'
				SET @SQL = @SQL + ' [Launched],'
				SET @SQL = @SQL + ' [DevelopmentStarted],'
				SET @SQL = @SQL + ' [JiraAllowAddJobs],'
				SET @SQL = @SQL + ' [IsMidProjectSurvey],'
				SET @SQL = @SQL + ' [MenHours],'
				SET @SQL = @SQL + ' [ZohoPotentialId],'
				SET @SQL = @SQL + ' [EnvironmentCode],'
				SET @SQL = @SQL + ' [Nickname]'
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
				SET @SQL = @SQL + ' FROM [dbo].[Projects]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END