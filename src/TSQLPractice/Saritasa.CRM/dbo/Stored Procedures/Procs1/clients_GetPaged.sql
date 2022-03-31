
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records from the Clients table passing page index and page count parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_GetPaged]
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
				SET @SQL = @SQL + ', [parentClientID]'
				SET @SQL = @SQL + ', [Website]'
				SET @SQL = @SQL + ', [Name]'
				SET @SQL = @SQL + ', [DocumentId]'
				SET @SQL = @SQL + ', [Notes]'
				SET @SQL = @SQL + ', [Billable]'
				SET @SQL = @SQL + ', [ContractTill]'
				SET @SQL = @SQL + ', [NotifiedContractTill]'
				SET @SQL = @SQL + ', [MainContactUserId]'
				SET @SQL = @SQL + ', [BillableType]'
				SET @SQL = @SQL + ', [BillableMethod]'
				SET @SQL = @SQL + ', [BillableNote]'
				SET @SQL = @SQL + ', [MinHoursPerMonth]'
				SET @SQL = @SQL + ', [ZohoAccountId]'
				SET @SQL = @SQL + ', [QbClientId]'
				SET @SQL = @SQL + ' FROM [dbo].[Clients]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				SET @SQL = @SQL + ' ) SELECT'
				SET @SQL = @SQL + ' [clientID],'
				SET @SQL = @SQL + ' [parentClientID],'
				SET @SQL = @SQL + ' [Website],'
				SET @SQL = @SQL + ' [Name],'
				SET @SQL = @SQL + ' [DocumentId],'
				SET @SQL = @SQL + ' [Notes],'
				SET @SQL = @SQL + ' [Billable],'
				SET @SQL = @SQL + ' [ContractTill],'
				SET @SQL = @SQL + ' [NotifiedContractTill],'
				SET @SQL = @SQL + ' [MainContactUserId],'
				SET @SQL = @SQL + ' [BillableType],'
				SET @SQL = @SQL + ' [BillableMethod],'
				SET @SQL = @SQL + ' [BillableNote],'
				SET @SQL = @SQL + ' [MinHoursPerMonth],'
				SET @SQL = @SQL + ' [ZohoAccountId],'
				SET @SQL = @SQL + ' [QbClientId]'
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
				SET @SQL = @SQL + ' FROM [dbo].[Clients]'
				IF LEN(@WhereClause) > 0
				BEGIN
					SET @SQL = @SQL + ' WHERE ' + @WhereClause
				END
				EXEC sp_executesql @SQL
			
				END