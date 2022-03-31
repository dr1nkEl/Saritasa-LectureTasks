
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Clients table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_Get_List]

AS


				
				SELECT
					[clientID],
					[parentClientID],
					[Website],
					[Name],
					[DocumentId],
					[Notes],
					[Billable],
					[ContractTill],
					[NotifiedContractTill],
					[MainContactUserId],
					[BillableType],
					[BillableMethod],
					[BillableNote],
					[MinHoursPerMonth],
					[ZohoAccountId],
					[QbClientId]
				FROM
					[dbo].[Clients]
					
				SELECT @@ROWCOUNT