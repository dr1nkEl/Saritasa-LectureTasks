
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vJobsByClientAndProject view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsByClientAndProject_Get
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
					SET @OrderBy = '[JobId]'
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
				SET @SQL = @SQL + ', [JobId]'
				SET @SQL = @SQL + ', [JobDuration]'
				SET @SQL = @SQL + ', [JobDescription]'
				SET @SQL = @SQL + ', [DurationWithJobRounding]'
				SET @SQL = @SQL + ', [DurationBillable]'
				SET @SQL = @SQL + ', [BillableWithJobRounding]'
				SET @SQL = @SQL + ', [DurationNonBillable]'
				SET @SQL = @SQL + ', [NonBillableWithJobRounding]'
				SET @SQL = @SQL + ', [JobDate]'
				SET @SQL = @SQL + ', [ClientId]'
				SET @SQL = @SQL + ', [ProjectId]'
				SET @SQL = @SQL + ', [ProjectName]'
				SET @SQL = @SQL + ', [ProjectDocumentId]'
				SET @SQL = @SQL + ', [ProjectMinHoursPerMonth]'
				SET @SQL = @SQL + ', [ClientMinHoursPerMonth]'
				SET @SQL = @SQL + ', [ClientName]'
				SET @SQL = @SQL + ', [BillableNote]'
				SET @SQL = @SQL + ', [ClientBillableType]'
				SET @SQL = @SQL + ', [DepartmentId]'
				SET @SQL = @SQL + ', [DepartmentName]'
				SET @SQL = @SQL + ', [ClientDocumentID]'
				SET @SQL = @SQL + ', [HasHosting]'
				SET @SQL = @SQL + ', [HostingStart]'
				SET @SQL = @SQL + ', [HostingFee]'
				SET @SQL = @SQL + ', [HostingFrequency]'
				SET @SQL = @SQL + ', [BillingVariable]'
				SET @SQL = @SQL + ', [BillingType]'
				SET @SQL = @SQL + ', [ProjectFrequency]'
				SET @SQL = @SQL + ', [ProjectPriorityId]'
				SET @SQL = @SQL + ', [ProjectUtilization]'
				SET @SQL = @SQL + ', [JobBillable]'
				SET @SQL = @SQL + ', [TargetName]'
				SET @SQL = @SQL + ', [TargetDocumentTypeId]'
				SET @SQL = @SQL + ', [TargetObjectId]'
				SET @SQL = @SQL + ', [UserFullName]'
				SET @SQL = @SQL + ', [UserTypeId]'
				SET @SQL = @SQL + ', [Paid]'
				SET @SQL = @SQL + ', [InHouse]'
				SET @SQL = @SQL + ', [InvestmentFree]'
				SET @SQL = @SQL + ', [Overbudget]'
				SET @SQL = @SQL + ', [NonBillable]'
				SET @SQL = @SQL + ', [BranchId]'
				SET @SQL = @SQL + ', [WorkTypeId]'
				SET @SQL = @SQL + ', [WorkTypeName]'
				SET @SQL = @SQL + ', [JobCreatedByUserId]'
				SET @SQL = @SQL + ' FROM [dbo].[_vJobsByClientAndProject]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [JobId],'
				SET @SQL = @SQL + ' [JobDuration],'
				SET @SQL = @SQL + ' [JobDescription],'
				SET @SQL = @SQL + ' [DurationWithJobRounding],'
				SET @SQL = @SQL + ' [DurationBillable],'
				SET @SQL = @SQL + ' [BillableWithJobRounding],'
				SET @SQL = @SQL + ' [DurationNonBillable],'
				SET @SQL = @SQL + ' [NonBillableWithJobRounding],'
				SET @SQL = @SQL + ' [JobDate],'
				SET @SQL = @SQL + ' [ClientId],'
				SET @SQL = @SQL + ' [ProjectId],'
				SET @SQL = @SQL + ' [ProjectName],'
				SET @SQL = @SQL + ' [ProjectDocumentId],'
				SET @SQL = @SQL + ' [ProjectMinHoursPerMonth],'
				SET @SQL = @SQL + ' [ClientMinHoursPerMonth],'
				SET @SQL = @SQL + ' [ClientName],'
				SET @SQL = @SQL + ' [BillableNote],'
				SET @SQL = @SQL + ' [ClientBillableType],'
				SET @SQL = @SQL + ' [DepartmentId],'
				SET @SQL = @SQL + ' [DepartmentName],'
				SET @SQL = @SQL + ' [ClientDocumentID],'
				SET @SQL = @SQL + ' [HasHosting],'
				SET @SQL = @SQL + ' [HostingStart],'
				SET @SQL = @SQL + ' [HostingFee],'
				SET @SQL = @SQL + ' [HostingFrequency],'
				SET @SQL = @SQL + ' [BillingVariable],'
				SET @SQL = @SQL + ' [BillingType],'
				SET @SQL = @SQL + ' [ProjectFrequency],'
				SET @SQL = @SQL + ' [ProjectPriorityId],'
				SET @SQL = @SQL + ' [ProjectUtilization],'
				SET @SQL = @SQL + ' [JobBillable],'
				SET @SQL = @SQL + ' [TargetName],'
				SET @SQL = @SQL + ' [TargetDocumentTypeId],'
				SET @SQL = @SQL + ' [TargetObjectId],'
				SET @SQL = @SQL + ' [UserFullName],'
				SET @SQL = @SQL + ' [UserTypeId],'
				SET @SQL = @SQL + ' [Paid],'
				SET @SQL = @SQL + ' [InHouse],'
				SET @SQL = @SQL + ' [InvestmentFree],'
				SET @SQL = @SQL + ' [Overbudget],'
				SET @SQL = @SQL + ' [NonBillable],'
				SET @SQL = @SQL + ' [BranchId],'
				SET @SQL = @SQL + ' [WorkTypeId],'
				SET @SQL = @SQL + ' [WorkTypeName],'
				SET @SQL = @SQL + ' [JobCreatedByUserId]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vJobsByClientAndProject]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END