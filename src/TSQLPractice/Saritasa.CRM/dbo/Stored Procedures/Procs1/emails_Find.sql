
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Emails table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_Find]
(

	@SearchUsingOR bit   = null ,

	@EmailID int   = null ,

	@Email varchar (MAX)  = null ,

	@TargetId bigint   = null ,

	@TypeId char (2)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [emailID]
	, [Email]
	, [TargetId]
	, [TypeId]
    FROM
	[dbo].[Emails]
    WHERE 
	 ([emailID] = @EmailID OR @EmailID IS NULL)
	AND ([Email] = @Email OR @Email IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [emailID]
	, [Email]
	, [TargetId]
	, [TypeId]
    FROM
	[dbo].[Emails]
    WHERE 
	 ([emailID] = @EmailID AND @EmailID is not null)
	OR ([Email] = @Email AND @Email is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	SELECT @@ROWCOUNT			
  END