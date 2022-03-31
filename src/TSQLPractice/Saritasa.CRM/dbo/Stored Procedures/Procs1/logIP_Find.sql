
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the LogIP table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_Find]
(

	@SearchUsingOR bit   = null ,

	@LogID bigint   = null ,

	@IP varchar (15)  = null ,

	@Date datetime   = null ,

	@Login varchar (100)  = null ,

	@UserId int   = null ,

	@Reason int   = null ,

	@Clear bit   = null ,

	@ApplicationId int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [logID]
	, [IP]
	, [Date]
	, [Login]
	, [UserId]
	, [Reason]
	, [Clear]
	, [ApplicationId]
    FROM
	[dbo].[LogIP]
    WHERE 
	 ([logID] = @LogID OR @LogID IS NULL)
	AND ([IP] = @IP OR @IP IS NULL)
	AND ([Date] = @Date OR @Date IS NULL)
	AND ([Login] = @Login OR @Login IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Reason] = @Reason OR @Reason IS NULL)
	AND ([Clear] = @Clear OR @Clear IS NULL)
	AND ([ApplicationId] = @ApplicationId OR @ApplicationId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [logID]
	, [IP]
	, [Date]
	, [Login]
	, [UserId]
	, [Reason]
	, [Clear]
	, [ApplicationId]
    FROM
	[dbo].[LogIP]
    WHERE 
	 ([logID] = @LogID AND @LogID is not null)
	OR ([IP] = @IP AND @IP is not null)
	OR ([Date] = @Date AND @Date is not null)
	OR ([Login] = @Login AND @Login is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Reason] = @Reason AND @Reason is not null)
	OR ([Clear] = @Clear AND @Clear is not null)
	OR ([ApplicationId] = @ApplicationId AND @ApplicationId is not null)
	SELECT @@ROWCOUNT			
  END