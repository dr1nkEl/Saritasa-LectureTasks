
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Clients table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_Insert]
(

	@ClientID int    OUTPUT,

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


				
				INSERT INTO [dbo].[Clients]
					(
					[parentClientID]
					,[Website]
					,[Name]
					,[DocumentId]
					,[Notes]
					,[Billable]
					,[ContractTill]
					,[NotifiedContractTill]
					,[MainContactUserId]
					,[BillableType]
					,[BillableMethod]
					,[BillableNote]
					,[MinHoursPerMonth]
					,[ZohoAccountId]
					,[QbClientId]
					)
				VALUES
					(
					@ParentClientID
					,@Website
					,@Name
					,@DocumentId
					,@Notes
					,@Billable
					,@ContractTill
					,@NotifiedContractTill
					,@MainContactUserId
					,@BillableType
					,@BillableMethod
					,@BillableNote
					,@MinHoursPerMonth
					,@ZohoAccountId
					,@QbClientId
					)
				
				-- Get the identity value
				SET @ClientID = SCOPE_IDENTITY()