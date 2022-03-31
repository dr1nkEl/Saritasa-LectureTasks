
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Contacts table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_Find]
(

	@SearchUsingOR bit   = null ,

	@ContactID int   = null ,

	@UserId int   = null ,

	@ClientId int   = null ,

	@Notes varchar (MAX)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [contactID]
	, [UserId]
	, [ClientId]
	, [Notes]
    FROM
	[dbo].[Contacts]
    WHERE 
	 ([contactID] = @ContactID OR @ContactID IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([ClientId] = @ClientId OR @ClientId IS NULL)
	AND ([Notes] = @Notes OR @Notes IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [contactID]
	, [UserId]
	, [ClientId]
	, [Notes]
    FROM
	[dbo].[Contacts]
    WHERE 
	 ([contactID] = @ContactID AND @ContactID is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([ClientId] = @ClientId AND @ClientId is not null)
	OR ([Notes] = @Notes AND @Notes is not null)
	SELECT @@ROWCOUNT			
  END