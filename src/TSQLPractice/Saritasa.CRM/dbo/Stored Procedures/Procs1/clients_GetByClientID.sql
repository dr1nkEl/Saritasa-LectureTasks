
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Clients table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_GetByClientID]
(

	@ClientID int   
)
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
				WHERE
					[clientID] = @ClientID
				SELECT @@ROWCOUNT