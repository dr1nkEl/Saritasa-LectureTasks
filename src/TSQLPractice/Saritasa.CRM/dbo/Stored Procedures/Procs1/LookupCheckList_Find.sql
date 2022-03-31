
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the LookupCheckList table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@Name varchar (240)  = null ,

	@IsKickOff bit   = null ,

	@OrderId int   = null ,

	@ParentId int   = null ,

	@IsRequired bit   = null ,

	@CheckType int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [name]
	, [isKickOff]
	, [orderID]
	, [parentID]
	, [isRequired]
	, [checkType]
    FROM
	[dbo].[LookupCheckList]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([isKickOff] = @IsKickOff OR @IsKickOff IS NULL)
	AND ([orderID] = @OrderId OR @OrderId IS NULL)
	AND ([parentID] = @ParentId OR @ParentId IS NULL)
	AND ([isRequired] = @IsRequired OR @IsRequired IS NULL)
	AND ([checkType] = @CheckType OR @CheckType IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [name]
	, [isKickOff]
	, [orderID]
	, [parentID]
	, [isRequired]
	, [checkType]
    FROM
	[dbo].[LookupCheckList]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([isKickOff] = @IsKickOff AND @IsKickOff is not null)
	OR ([orderID] = @OrderId AND @OrderId is not null)
	OR ([parentID] = @ParentId AND @ParentId is not null)
	OR ([isRequired] = @IsRequired AND @IsRequired is not null)
	OR ([checkType] = @CheckType AND @CheckType is not null)
	SELECT @@ROWCOUNT			
  END