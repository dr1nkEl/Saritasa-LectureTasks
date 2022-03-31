
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectMilestones table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_Find]
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@ProjectId int   = null ,

	@Name varchar (50)  = null ,

	@ReleaseVersion varchar (50)  = null ,

	@ScheduledDate datetime   = null ,

	@LimitHours int   = null ,

	@Released bit   = null ,

	@ActualReleaseDate datetime   = null ,

	@Order smallint   = null ,

	@CreatedAt datetime   = null ,

	@CreatedByUserId int   = null ,

	@UpdatedAt datetime   = null ,

	@UpdatedByUserId int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [ProjectId]
	, [Name]
	, [ReleaseVersion]
	, [ScheduledDate]
	, [LimitHours]
	, [Released]
	, [ActualReleaseDate]
	, [Order]
	, [CreatedAt]
	, [CreatedByUserId]
	, [UpdatedAt]
	, [UpdatedByUserId]
    FROM
	[dbo].[ProjectMilestones]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
	AND ([ReleaseVersion] = @ReleaseVersion OR @ReleaseVersion IS NULL)
	AND ([ScheduledDate] = @ScheduledDate OR @ScheduledDate IS NULL)
	AND ([LimitHours] = @LimitHours OR @LimitHours IS NULL)
	AND ([Released] = @Released OR @Released IS NULL)
	AND ([ActualReleaseDate] = @ActualReleaseDate OR @ActualReleaseDate IS NULL)
	AND ([Order] = @Order OR @Order IS NULL)
	AND ([CreatedAt] = @CreatedAt OR @CreatedAt IS NULL)
	AND ([CreatedByUserId] = @CreatedByUserId OR @CreatedByUserId IS NULL)
	AND ([UpdatedAt] = @UpdatedAt OR @UpdatedAt IS NULL)
	AND ([UpdatedByUserId] = @UpdatedByUserId OR @UpdatedByUserId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [ProjectId]
	, [Name]
	, [ReleaseVersion]
	, [ScheduledDate]
	, [LimitHours]
	, [Released]
	, [ActualReleaseDate]
	, [Order]
	, [CreatedAt]
	, [CreatedByUserId]
	, [UpdatedAt]
	, [UpdatedByUserId]
    FROM
	[dbo].[ProjectMilestones]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([Name] = @Name AND @Name is not null)
	OR ([ReleaseVersion] = @ReleaseVersion AND @ReleaseVersion is not null)
	OR ([ScheduledDate] = @ScheduledDate AND @ScheduledDate is not null)
	OR ([LimitHours] = @LimitHours AND @LimitHours is not null)
	OR ([Released] = @Released AND @Released is not null)
	OR ([ActualReleaseDate] = @ActualReleaseDate AND @ActualReleaseDate is not null)
	OR ([Order] = @Order AND @Order is not null)
	OR ([CreatedAt] = @CreatedAt AND @CreatedAt is not null)
	OR ([CreatedByUserId] = @CreatedByUserId AND @CreatedByUserId is not null)
	OR ([UpdatedAt] = @UpdatedAt AND @UpdatedAt is not null)
	OR ([UpdatedByUserId] = @UpdatedByUserId AND @UpdatedByUserId is not null)
	SELECT @@ROWCOUNT			
  END