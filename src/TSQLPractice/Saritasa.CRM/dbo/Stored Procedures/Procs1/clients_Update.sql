
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Clients table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_Update]
(

	@ClientID int   ,

	@ParentClientID int   ,

	@Website varchar (255)  ,

	@Name varchar (200)  ,

	@DocumentId bigint   ,

	@Notes varchar (MAX)  ,

	@Billable bit   ,

	@ContractTill datetime   ,

	@NotifiedContractTill bit   ,

	@MainContactUserId int   ,

	@BillableType char (1)  ,

	@BillableMethod char (1)  ,

	@BillableNote varchar (MAX)  ,

	@MinHoursPerMonth int   ,

	@ZohoAccountId bigint   ,

	@QbClientId bigint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Clients]
				SET
					[parentClientID] = @ParentClientID
					,[Website] = @Website
					,[Name] = @Name
					,[DocumentId] = @DocumentId
					,[Notes] = @Notes
					,[Billable] = @Billable
					,[ContractTill] = @ContractTill
					,[NotifiedContractTill] = @NotifiedContractTill
					,[MainContactUserId] = @MainContactUserId
					,[BillableType] = @BillableType
					,[BillableMethod] = @BillableMethod
					,[BillableNote] = @BillableNote
					,[MinHoursPerMonth] = @MinHoursPerMonth
					,[ZohoAccountId] = @ZohoAccountId
					,[QbClientId] = @QbClientId
				WHERE
[clientID] = @ClientID