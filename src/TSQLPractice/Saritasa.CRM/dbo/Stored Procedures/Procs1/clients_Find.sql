
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Clients table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[clients_Find]
(

	@SearchUsingOR bit   = null ,

	@ClientID int   = null ,

	@ParentClientID int   = null ,

	@Website varchar (255)  = null ,

	@Name varchar (200)  = null ,

	@DocumentId bigint   = null ,

	@Notes varchar (MAX)  = null ,

	@Billable bit   = null ,

	@ContractTill datetime   = null ,

	@NotifiedContractTill bit   = null ,

	@MainContactUserId int   = null ,

	@BillableType char (1)  = null ,

	@BillableMethod char (1)  = null ,

	@BillableNote varchar (MAX)  = null ,

	@MinHoursPerMonth int   = null ,

	@ZohoAccountId bigint   = null ,

	@QbClientId bigint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [clientID]
	, [parentClientID]
	, [Website]
	, [Name]
	, [DocumentId]
	, [Notes]
	, [Billable]
	, [ContractTill]
	, [NotifiedContractTill]
	, [MainContactUserId]
	, [BillableType]
	, [BillableMethod]
	, [BillableNote]
	, [MinHoursPerMonth]
	, [ZohoAccountId]
	, [QbClientId]
    FROM
	[dbo].[Clients]
    WHERE 
	 ([clientID] = @ClientID OR @ClientID IS NULL)
	AND ([parentClientID] = @ParentClientID OR @ParentClientID IS NULL)
	AND ([Website] = @Website OR @Website IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([Notes] = @Notes OR @Notes IS NULL)
	AND ([Billable] = @Billable OR @Billable IS NULL)
	AND ([ContractTill] = @ContractTill OR @ContractTill IS NULL)
	AND ([NotifiedContractTill] = @NotifiedContractTill OR @NotifiedContractTill IS NULL)
	AND ([MainContactUserId] = @MainContactUserId OR @MainContactUserId IS NULL)
	AND ([BillableType] = @BillableType OR @BillableType IS NULL)
	AND ([BillableMethod] = @BillableMethod OR @BillableMethod IS NULL)
	AND ([BillableNote] = @BillableNote OR @BillableNote IS NULL)
	AND ([MinHoursPerMonth] = @MinHoursPerMonth OR @MinHoursPerMonth IS NULL)
	AND ([ZohoAccountId] = @ZohoAccountId OR @ZohoAccountId IS NULL)
	AND ([QbClientId] = @QbClientId OR @QbClientId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [clientID]
	, [parentClientID]
	, [Website]
	, [Name]
	, [DocumentId]
	, [Notes]
	, [Billable]
	, [ContractTill]
	, [NotifiedContractTill]
	, [MainContactUserId]
	, [BillableType]
	, [BillableMethod]
	, [BillableNote]
	, [MinHoursPerMonth]
	, [ZohoAccountId]
	, [QbClientId]
    FROM
	[dbo].[Clients]
    WHERE 
	 ([clientID] = @ClientID AND @ClientID is not null)
	OR ([parentClientID] = @ParentClientID AND @ParentClientID is not null)
	OR ([Website] = @Website AND @Website is not null)
	OR ([Name] = @Name AND @Name is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([Notes] = @Notes AND @Notes is not null)
	OR ([Billable] = @Billable AND @Billable is not null)
	OR ([ContractTill] = @ContractTill AND @ContractTill is not null)
	OR ([NotifiedContractTill] = @NotifiedContractTill AND @NotifiedContractTill is not null)
	OR ([MainContactUserId] = @MainContactUserId AND @MainContactUserId is not null)
	OR ([BillableType] = @BillableType AND @BillableType is not null)
	OR ([BillableMethod] = @BillableMethod AND @BillableMethod is not null)
	OR ([BillableNote] = @BillableNote AND @BillableNote is not null)
	OR ([MinHoursPerMonth] = @MinHoursPerMonth AND @MinHoursPerMonth is not null)
	OR ([ZohoAccountId] = @ZohoAccountId AND @ZohoAccountId is not null)
	OR ([QbClientId] = @QbClientId AND @QbClientId is not null)
	SELECT @@ROWCOUNT			
  END