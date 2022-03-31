
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vJobsReport view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsReport_Get
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
					SET @OrderBy = '[jobID]'
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
				SET @SQL = @SQL + ', [jobID]'
				SET @SQL = @SQL + ', [targetID]'
				SET @SQL = @SQL + ', [duration]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [billable]'
				SET @SQL = @SQL + ', [jobDate]'
				SET @SQL = @SQL + ', [workType]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [clientName]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [projectName]'
				SET @SQL = @SQL + ', [projectBillingType]'
				SET @SQL = @SQL + ', [projectFrequency]'
				SET @SQL = @SQL + ', [projectUtilization]'
				SET @SQL = @SQL + ', [projectPriority]'
				SET @SQL = @SQL + ', [projectPriotityColor]'
				SET @SQL = @SQL + ', [targName]'
				SET @SQL = @SQL + ', [targDocTypeId]'
				SET @SQL = @SQL + ', [targetObjectId]'
				SET @SQL = @SQL + ', [overtime]'
				SET @SQL = @SQL + ', [isError]'
				SET @SQL = @SQL + ', [errorBy]'
				SET @SQL = @SQL + ', [errorReason]'
				SET @SQL = @SQL + ', [errorCreatorName]'
				SET @SQL = @SQL + ', [errorCreatorPhoto]'
				SET @SQL = @SQL + ', [creatorID]'
				SET @SQL = @SQL + ', [creatorName]'
				SET @SQL = @SQL + ', [creatorEmail]'
				SET @SQL = @SQL + ', [creatorUtilization]'
				SET @SQL = @SQL + ', [creatorBrancID]'
				SET @SQL = @SQL + ', [departmentID]'
				SET @SQL = @SQL + ', [jobType]'
				SET @SQL = @SQL + ', [WorklogType]'
				SET @SQL = @SQL + ', [creatorCreated]'
				SET @SQL = @SQL + ', [creatorTaskDuration]'
				SET @SQL = @SQL + ', [creatorTaskLimit]'
				SET @SQL = @SQL + ', [taskStatusID]'
				SET @SQL = @SQL + ', [outsorserClientID]'
				SET @SQL = @SQL + ', [outsorserName]'
				SET @SQL = @SQL + ', [projectBillable]'
				SET @SQL = @SQL + ', [featureName]'
				SET @SQL = @SQL + ', [sprintName]'
				SET @SQL = @SQL + ' FROM [dbo].[_vJobsReport]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [jobID],'
				SET @SQL = @SQL + ' [targetID],'
				SET @SQL = @SQL + ' [duration],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [billable],'
				SET @SQL = @SQL + ' [jobDate],'
				SET @SQL = @SQL + ' [workType],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [clientName],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [projectName],'
				SET @SQL = @SQL + ' [projectBillingType],'
				SET @SQL = @SQL + ' [projectFrequency],'
				SET @SQL = @SQL + ' [projectUtilization],'
				SET @SQL = @SQL + ' [projectPriority],'
				SET @SQL = @SQL + ' [projectPriotityColor],'
				SET @SQL = @SQL + ' [targName],'
				SET @SQL = @SQL + ' [targDocTypeId],'
				SET @SQL = @SQL + ' [targetObjectId],'
				SET @SQL = @SQL + ' [overtime],'
				SET @SQL = @SQL + ' [isError],'
				SET @SQL = @SQL + ' [errorBy],'
				SET @SQL = @SQL + ' [errorReason],'
				SET @SQL = @SQL + ' [errorCreatorName],'
				SET @SQL = @SQL + ' [errorCreatorPhoto],'
				SET @SQL = @SQL + ' [creatorID],'
				SET @SQL = @SQL + ' [creatorName],'
				SET @SQL = @SQL + ' [creatorEmail],'
				SET @SQL = @SQL + ' [creatorUtilization],'
				SET @SQL = @SQL + ' [creatorBrancID],'
				SET @SQL = @SQL + ' [departmentID],'
				SET @SQL = @SQL + ' [jobType],'
				SET @SQL = @SQL + ' [WorklogType],'
				SET @SQL = @SQL + ' [creatorCreated],'
				SET @SQL = @SQL + ' [creatorTaskDuration],'
				SET @SQL = @SQL + ' [creatorTaskLimit],'
				SET @SQL = @SQL + ' [taskStatusID],'
				SET @SQL = @SQL + ' [outsorserClientID],'
				SET @SQL = @SQL + ' [outsorserName],'
				SET @SQL = @SQL + ' [projectBillable],'
				SET @SQL = @SQL + ' [featureName],'
				SET @SQL = @SQL + ' [sprintName]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vJobsReport]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END