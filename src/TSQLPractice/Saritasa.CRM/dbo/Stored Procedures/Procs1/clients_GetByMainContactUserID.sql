
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Clients table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_GetByMainContactUserID]
(

	@MainContactUserId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[MainContactUserId] = @MainContactUserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON