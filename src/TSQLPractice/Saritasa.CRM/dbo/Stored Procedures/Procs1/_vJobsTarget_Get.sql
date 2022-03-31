﻿
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vJobsTarget view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsTarget_Get
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
					SET @OrderBy = '[clientID]'
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
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [clientName]'
				SET @SQL = @SQL + ', [clientDocID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [projName]'
				SET @SQL = @SQL + ', [projDocID]'
				SET @SQL = @SQL + ', [jobID]'
				SET @SQL = @SQL + ', [billable]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [JobType]'
				SET @SQL = @SQL + ', [duration]'
				SET @SQL = @SQL + ', [targetID]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [targName]'
				SET @SQL = @SQL + ', [targDocTypeId]'
				SET @SQL = @SQL + ', [targetobjectId]'
				SET @SQL = @SQL + ', [userID]'
				SET @SQL = @SQL + ', [fullName]'
				SET @SQL = @SQL + ', [userDocID]'
				SET @SQL = @SQL + ', [date]'
				SET @SQL = @SQL + ', [JobDate]'
				SET @SQL = @SQL + ', [birthday]'
				SET @SQL = @SQL + ', [timeZone]'
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [TaskTargetID]'
				SET @SQL = @SQL + ', [isError]'
				SET @SQL = @SQL + ', [errorBy]'
				SET @SQL = @SQL + ', [errorReason]'
				SET @SQL = @SQL + ', [EmployeeId]'
				SET @SQL = @SQL + ', [hasHosting]'
				SET @SQL = @SQL + ', [hostingFee]'
				SET @SQL = @SQL + ', [hostingStart]'
				SET @SQL = @SQL + ', [hostingFrequency]'
				SET @SQL = @SQL + ', [workTypeID]'
				SET @SQL = @SQL + ', [workTypeName]'
				SET @SQL = @SQL + ', [projectBillable]'
				SET @SQL = @SQL + ', [taskBillable]'
				SET @SQL = @SQL + ', [clientBillable]'
				SET @SQL = @SQL + ', [makeJobsBillable]'
				SET @SQL = @SQL + ', [DepartmentId]'
				SET @SQL = @SQL + ', [featureID]'
				SET @SQL = @SQL + ', [sprintID]'
				SET @SQL = @SQL + ', [featureName]'
				SET @SQL = @SQL + ', [sprintName]'
				SET @SQL = @SQL + ', [DedicatedResource]'
				SET @SQL = @SQL + ', [TaskTagName]'
				SET @SQL = @SQL + ' FROM [dbo].[_vJobsTarget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [clientName],'
				SET @SQL = @SQL + ' [clientDocID],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [projName],'
				SET @SQL = @SQL + ' [projDocID],'
				SET @SQL = @SQL + ' [jobID],'
				SET @SQL = @SQL + ' [billable],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [JobType],'
				SET @SQL = @SQL + ' [duration],'
				SET @SQL = @SQL + ' [targetID],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [targName],'
				SET @SQL = @SQL + ' [targDocTypeId],'
				SET @SQL = @SQL + ' [targetobjectId],'
				SET @SQL = @SQL + ' [userID],'
				SET @SQL = @SQL + ' [fullName],'
				SET @SQL = @SQL + ' [userDocID],'
				SET @SQL = @SQL + ' [date],'
				SET @SQL = @SQL + ' [JobDate],'
				SET @SQL = @SQL + ' [birthday],'
				SET @SQL = @SQL + ' [timeZone],'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [TaskTargetID],'
				SET @SQL = @SQL + ' [isError],'
				SET @SQL = @SQL + ' [errorBy],'
				SET @SQL = @SQL + ' [errorReason],'
				SET @SQL = @SQL + ' [EmployeeId],'
				SET @SQL = @SQL + ' [hasHosting],'
				SET @SQL = @SQL + ' [hostingFee],'
				SET @SQL = @SQL + ' [hostingStart],'
				SET @SQL = @SQL + ' [hostingFrequency],'
				SET @SQL = @SQL + ' [workTypeID],'
				SET @SQL = @SQL + ' [workTypeName],'
				SET @SQL = @SQL + ' [projectBillable],'
				SET @SQL = @SQL + ' [taskBillable],'
				SET @SQL = @SQL + ' [clientBillable],'
				SET @SQL = @SQL + ' [makeJobsBillable],'
				SET @SQL = @SQL + ' [DepartmentId],'
				SET @SQL = @SQL + ' [featureID],'
				SET @SQL = @SQL + ' [sprintID],'
				SET @SQL = @SQL + ' [featureName],'
				SET @SQL = @SQL + ' [sprintName],'
				SET @SQL = @SQL + ' [DedicatedResource],'
				SET @SQL = @SQL + ' [TaskTagName]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vJobsTarget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END