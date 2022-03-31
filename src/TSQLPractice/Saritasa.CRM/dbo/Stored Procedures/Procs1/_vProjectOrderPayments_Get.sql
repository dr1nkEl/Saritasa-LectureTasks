/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the _vProjectOrderPayments view passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vProjectOrderPayments_Get]
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
				SET @SQL = @SQL + ', [changeOrderID]'
				SET @SQL = @SQL + ', [milestouneID]'
				SET @SQL = @SQL + ', [userID]'
				SET @SQL = @SQL + ', [hours]'
				SET @SQL = @SQL + ', [description]'
				SET @SQL = @SQL + ', [orderID]'
				SET @SQL = @SQL + ', [paperworkRecieved]'
				SET @SQL = @SQL + ', [created]'
				SET @SQL = @SQL + ', [name]'
				SET @SQL = @SQL + ', [unpaidCount]'
				SET @SQL = @SQL + ', [employeeID]'
				SET @SQL = @SQL + ', [email]'
				SET @SQL = @SQL + ', [fullName]'
				SET @SQL = @SQL + ', [photo]'
				SET @SQL = @SQL + ', [skype]'
				SET @SQL = @SQL + ' FROM [dbo].[_vProjectOrderPayments]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [projectID],'
				SET @SQL = @SQL + ' [title],'
				SET @SQL = @SQL + ' [changeOrderID],'
				SET @SQL = @SQL + ' [milestouneID],'
				SET @SQL = @SQL + ' [userID],'
				SET @SQL = @SQL + ' [hours],'
				SET @SQL = @SQL + ' [description],'
				SET @SQL = @SQL + ' [orderID],'
				SET @SQL = @SQL + ' [paperworkRecieved],'
				SET @SQL = @SQL + ' [created],'
				SET @SQL = @SQL + ' [name],'
				SET @SQL = @SQL + ' [unpaidCount],'
				SET @SQL = @SQL + ' [employeeID],'
				SET @SQL = @SQL + ' [email],'
				SET @SQL = @SQL + ' [fullName],'
				SET @SQL = @SQL + ' [photo],'
				SET @SQL = @SQL + ' [skype]'
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
				SET @SQL = @SQL + ' FROM [dbo].[_vProjectOrderPayments]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
				
				END