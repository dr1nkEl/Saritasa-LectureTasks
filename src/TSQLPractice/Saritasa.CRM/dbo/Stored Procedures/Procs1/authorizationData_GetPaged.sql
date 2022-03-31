
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the AuthorizationData table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_GetPaged]
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
					SET @OrderBy = '[authID]'
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
				SET @SQL = @SQL + ', [authID]'
				SET @SQL = @SQL + ', [UserId]'
				SET @SQL = @SQL + ', [Login]'
				SET @SQL = @SQL + ', [Password]'
				SET @SQL = @SQL + ', [Email]'
				SET @SQL = @SQL + ', [SecurityQuestion]'
				SET @SQL = @SQL + ', [SecurityAnswer]'
				SET @SQL = @SQL + ', [LastActivity]'
				SET @SQL = @SQL + ', [IsApproved]'
				SET @SQL = @SQL + ', [IsLocked]'
				SET @SQL = @SQL + ', [IsOnline]'
				SET @SQL = @SQL + ', [WrongPassword]'
				SET @SQL = @SQL + ', [SessionKey]'
				SET @SQL = @SQL + ', [LdapLogin]'
				SET @SQL = @SQL + ' FROM [dbo].[AuthorizationData]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [authID],'
				SET @SQL = @SQL + ' [UserId],'
				SET @SQL = @SQL + ' [Login],'
				SET @SQL = @SQL + ' [Password],'
				SET @SQL = @SQL + ' [Email],'
				SET @SQL = @SQL + ' [SecurityQuestion],'
				SET @SQL = @SQL + ' [SecurityAnswer],'
				SET @SQL = @SQL + ' [LastActivity],'
				SET @SQL = @SQL + ' [IsApproved],'
				SET @SQL = @SQL + ' [IsLocked],'
				SET @SQL = @SQL + ' [IsOnline],'
				SET @SQL = @SQL + ' [WrongPassword],'
				SET @SQL = @SQL + ' [SessionKey],'
				SET @SQL = @SQL + ' [LdapLogin]'
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
				SET @SQL = @SQL + ' FROM [dbo].[AuthorizationData]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END