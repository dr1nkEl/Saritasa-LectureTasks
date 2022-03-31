/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vTasksBoomerangs view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vTasksBoomerangs_Get]
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
				SET @SQL = @SQL + ', [typeID]'
				SET @SQL = @SQL + ', [documentID]'
				SET @SQL = @SQL + ', [targetID]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [updated]'
				SET @SQL = @SQL + ', [deleted]'
				SET @SQL = @SQL + ', [generalStatusID]'
				SET @SQL = @SQL + ', [createdBy]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [updatedBy]'
				SET @SQL = @SQL + ', [statusName]'
				SET @SQL = @SQL + ', [title]'
				SET @SQL = @SQL + ', [finishDate]'
				SET @SQL = @SQL + ', [startDate]'
				SET @SQL = @SQL + ', [billable]'
				SET @SQL = @SQL + ', [clientID]'
				SET @SQL = @SQL + ', [projectID]'
				SET @SQL = @SQL + ', [durationLimit]'
				SET @SQL = @SQL + ', [isContainer]'
				SET @SQL = @SQL + ', [boomerangID]'
				SET @SQL = @SQL + ', [userID]'
				SET @SQL = @SQL + ', [type]'
				SET @SQL = @SQL + ', [fireTime]'
				SET @SQL = @SQL + ', [isFired]'
				SET @SQL = @SQL + ', [timeZone]'
				SET @SQL = @SQL + ', [timeZoneCode]'
				SET @SQL = @SQL + ', [firstName]'
				SET @SQL = @SQL + ', [lastName]'
				SET @SQL = @SQL + ' FROM [dbo].[_vTasksBoomerangs]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [taskID],'
				SET @SQL = @SQL + ' [typeID],'
				SET @SQL = @SQL + ' [documentID],'
				SET @SQL = @SQL + ' [targetID],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [updated],'
				SET @SQL = @SQL + ' [deleted],'
				SET @SQL = @SQL + ' [generalStatusID],'
				SET @SQL = @SQL + ' [createdBy],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [updatedBy],'
				SET @SQL = @SQL + ' [statusName],'
				SET @SQL = @SQL + ' [title],'
				SET @SQL = @SQL + ' [finishDate],'
				SET @SQL = @SQL + ' [startDate],'
				SET @SQL = @SQL + ' [billable],'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [durationLimit],'
				SET @SQL = @SQL + ' [isContainer],'
				SET @SQL = @SQL + ' [boomerangID],'
				SET @SQL = @SQL + ' [userID],'
				SET @SQL = @SQL + ' [type],'
				SET @SQL = @SQL + ' [fireTime],'
				SET @SQL = @SQL + ' [isFired],'
				SET @SQL = @SQL + ' [timeZone],'
				SET @SQL = @SQL + ' [timeZoneCode],'
				SET @SQL = @SQL + ' [firstName],'
				SET @SQL = @SQL + ' [lastName]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vTasksBoomerangs]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END
