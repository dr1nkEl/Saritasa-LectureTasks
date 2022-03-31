/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vucTaskListWidget view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucTaskListWidget_Get]
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
					SET @OrderBy = '[documentID]'
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
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [taskPriority]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [deleted]'
				SET @SQL = @SQL + ', [lastestReestimationId]'
				SET @SQL = @SQL + ', [lastestReestimationLimitType]'
				SET @SQL = @SQL + ', [lastestReestimationDueDateType]'
				SET @SQL = @SQL + ', [lastestReestimationLimit]'
				SET @SQL = @SQL + ', [lastestReestimationDueDate]'
				SET @SQL = @SQL + ', [lastestReestimationStatus]'
				SET @SQL = @SQL + ', [lastestReestimationUserId]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [taskID]'
				SET @SQL = @SQL + ', [CreateFullName]'
				SET @SQL = @SQL + ', [statusName]'
				SET @SQL = @SQL + ', [colorCode]'
				SET @SQL = @SQL + ', [priority]'
				SET @SQL = @SQL + ', [title]'
				SET @SQL = @SQL + ', [targName]'
				SET @SQL = @SQL + ', [targDocTypeID]'
				SET @SQL = @SQL + ', [targGenStatuc]'
				SET @SQL = @SQL + ', [createrLastName]'
				SET @SQL = @SQL + ', [createrFirstName]'
				SET @SQL = @SQL + ', [createrFillName]'
				SET @SQL = @SQL + ', [svLastName]'
				SET @SQL = @SQL + ', [svFirstName]'
				SET @SQL = @SQL + ', [svFillName]'
				SET @SQL = @SQL + ', [createrUserTypeID]'
				SET @SQL = @SQL + ', [svUserTypeID]'
				SET @SQL = @SQL + ', [trackType]'
				SET @SQL = @SQL + ', [Overdue]'
				SET @SQL = @SQL + ', [taskText]'
				SET @SQL = @SQL + ', [finishDate]'
				SET @SQL = @SQL + ', [svDocID]'
				SET @SQL = @SQL + ', [CreaterDocID]'
				SET @SQL = @SQL + ', [startDate]'
				SET @SQL = @SQL + ', [datePushed]'
				SET @SQL = @SQL + ', [targetObjectID]'
				SET @SQL = @SQL + ', [TargDocId]'
				SET @SQL = @SQL + ', [updated]'
				SET @SQL = @SQL + ', [durationLimit]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [billable]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [projDocID]'
				SET @SQL = @SQL + ', [menHours]'
				SET @SQL = @SQL + ', [locationName]'
				SET @SQL = @SQL + ', [locationUrl]'
				SET @SQL = @SQL + ', [projectName]'
				SET @SQL = @SQL + ', [testerID]'
				SET @SQL = @SQL + ', [isContainer]'
				SET @SQL = @SQL + ', [statusChanged]'
				SET @SQL = @SQL + ', [taskLimit]'
				SET @SQL = @SQL + ', [subTaskLimit]'
				SET @SQL = @SQL + ', [skype]'
				SET @SQL = @SQL + ', [email]'
				SET @SQL = @SQL + ', [createrPhoto]'
				SET @SQL = @SQL + ', [TaskTypeID]'
				SET @SQL = @SQL + ', [developerUserID]'
				SET @SQL = @SQL + ', [developerPhone]'
				SET @SQL = @SQL + ', [developerEmail]'
				SET @SQL = @SQL + ', [developerPhoto]'
				SET @SQL = @SQL + ', [subTasksLimitOrTaskLimit]'
				SET @SQL = @SQL + ', [technicalManagerID]'
				SET @SQL = @SQL + ', [overtime]'
				SET @SQL = @SQL + ', [sprintID]'
				SET @SQL = @SQL + ', [featureID]'
				SET @SQL = @SQL + ' FROM [dbo].[_vucTaskListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [taskPriority],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [deleted],'
				SET @SQL = @SQL + ' [lastestReestimationId],'
				SET @SQL = @SQL + ' [lastestReestimationLimitType],'
				SET @SQL = @SQL + ' [lastestReestimationDueDateType],'
				SET @SQL = @SQL + ' [lastestReestimationLimit],'
				SET @SQL = @SQL + ' [lastestReestimationDueDate],'
				SET @SQL = @SQL + ' [lastestReestimationStatus],'
				SET @SQL = @SQL + ' [lastestReestimationUserId],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [CreateFullName],'
				SET @SQL = @SQL + ' [statusName],'
				SET @SQL = @SQL + ' [colorCode],'
				SET @SQL = @SQL + ' [priority],'
				SET @SQL = @SQL + ' [title],'
				SET @SQL = @SQL + ' [targName],'
				SET @SQL = @SQL + ' [targDocTypeID],'
				SET @SQL = @SQL + ' [targGenStatuc],'
				SET @SQL = @SQL + ' [createrLastName],'
				SET @SQL = @SQL + ' [createrFirstName],'
				SET @SQL = @SQL + ' [createrFillName],'
				SET @SQL = @SQL + ' [svLastName],'
				SET @SQL = @SQL + ' [svFirstName],'
				SET @SQL = @SQL + ' [svFillName],'
				SET @SQL = @SQL + ' [createrUserTypeID],'
				SET @SQL = @SQL + ' [svUserTypeID],'
				SET @SQL = @SQL + ' [trackType],'
				SET @SQL = @SQL + ' [Overdue],'
				SET @SQL = @SQL + ' [taskText],'
				SET @SQL = @SQL + ' [finishDate],'
				SET @SQL = @SQL + ' [svDocID],'
				SET @SQL = @SQL + ' [CreaterDocID],'
				SET @SQL = @SQL + ' [startDate],'
				SET @SQL = @SQL + ' [datePushed],'
				SET @SQL = @SQL + ' [targetObjectID],'
				SET @SQL = @SQL + ' [TargDocId],'
				SET @SQL = @SQL + ' [updated],'
				SET @SQL = @SQL + ' [durationLimit],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [billable],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [projDocID],'
				SET @SQL = @SQL + ' [menHours],'
				SET @SQL = @SQL + ' [locationName],'
				SET @SQL = @SQL + ' [locationUrl],'
				SET @SQL = @SQL + ' [projectName],'
				SET @SQL = @SQL + ' [testerID],'
				SET @SQL = @SQL + ' [isContainer],'
				SET @SQL = @SQL + ' [statusChanged],'
				SET @SQL = @SQL + ' [taskLimit],'
				SET @SQL = @SQL + ' [subTaskLimit],'
				SET @SQL = @SQL + ' [skype],'
				SET @SQL = @SQL + ' [email],'
				SET @SQL = @SQL + ' [createrPhoto],'
				SET @SQL = @SQL + ' [TaskTypeID],'
				SET @SQL = @SQL + ' [developerUserID],'
				SET @SQL = @SQL + ' [developerPhone],'
				SET @SQL = @SQL + ' [developerEmail],'
				SET @SQL = @SQL + ' [developerPhoto],'
				SET @SQL = @SQL + ' [subTasksLimitOrTaskLimit],'
				SET @SQL = @SQL + ' [technicalManagerID],'
				SET @SQL = @SQL + ' [overtime],'
				SET @SQL = @SQL + ' [sprintID],'
				SET @SQL = @SQL + ' [featureID]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vucTaskListWidget]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
