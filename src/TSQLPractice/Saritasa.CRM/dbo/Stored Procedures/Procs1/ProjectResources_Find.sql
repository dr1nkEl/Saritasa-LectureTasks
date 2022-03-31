
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectResources table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@UserId int   = null ,

	@ProjectId int   = null ,

	@CreatedAt datetime   = null ,

	@CreatedByUserId int   = null ,

	@UpdatedAt datetime   = null ,

	@UpdatedByUserId int   = null ,

	@WorkTypeId int   = null ,

	@IsDedicated bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [UserId]
	, [ProjectId]
	, [CreatedAt]
	, [CreatedByUserId]
	, [UpdatedAt]
	, [UpdatedByUserId]
	, [WorkTypeId]
	, [IsDedicated]
    FROM
	[dbo].[ProjectResources]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([CreatedAt] = @CreatedAt OR @CreatedAt IS NULL)
	AND ([CreatedByUserId] = @CreatedByUserId OR @CreatedByUserId IS NULL)
	AND ([UpdatedAt] = @UpdatedAt OR @UpdatedAt IS NULL)
	AND ([UpdatedByUserId] = @UpdatedByUserId OR @UpdatedByUserId IS NULL)
	AND ([WorkTypeId] = @WorkTypeId OR @WorkTypeId IS NULL)
	AND ([IsDedicated] = @IsDedicated OR @IsDedicated IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [UserId]
	, [ProjectId]
	, [CreatedAt]
	, [CreatedByUserId]
	, [UpdatedAt]
	, [UpdatedByUserId]
	, [WorkTypeId]
	, [IsDedicated]
    FROM
	[dbo].[ProjectResources]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([CreatedAt] = @CreatedAt AND @CreatedAt is not null)
	OR ([CreatedByUserId] = @CreatedByUserId AND @CreatedByUserId is not null)
	OR ([UpdatedAt] = @UpdatedAt AND @UpdatedAt is not null)
	OR ([UpdatedByUserId] = @UpdatedByUserId AND @UpdatedByUserId is not null)
	OR ([WorkTypeId] = @WorkTypeId AND @WorkTypeId is not null)
	OR ([IsDedicated] = @IsDedicated AND @IsDedicated is not null)
	SELECT @@ROWCOUNT			
  END