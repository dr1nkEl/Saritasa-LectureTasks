
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ChatMembers table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_Find]
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@ChatId int   = null ,

	@UserId int   = null ,

	@Closed bit   = null ,

	@ViewedTextLength int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [ChatId]
	, [UserId]
	, [Closed]
	, [ViewedTextLength]
    FROM
	[dbo].[ChatMembers]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([ChatId] = @ChatId OR @ChatId IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Closed] = @Closed OR @Closed IS NULL)
	AND ([ViewedTextLength] = @ViewedTextLength OR @ViewedTextLength IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [ChatId]
	, [UserId]
	, [Closed]
	, [ViewedTextLength]
    FROM
	[dbo].[ChatMembers]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([ChatId] = @ChatId AND @ChatId is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Closed] = @Closed AND @Closed is not null)
	OR ([ViewedTextLength] = @ViewedTextLength AND @ViewedTextLength is not null)
	SELECT @@ROWCOUNT			
  END