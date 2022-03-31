
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the JiraMapping table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.JiraMapping_Find
(

	@SearchUsingOR bit   = null ,

	@Id bigint   = null ,

	@TypeId char (3)  = null ,

	@SourceId bigint   = null ,

	@DestinationId varchar (50)  = null ,

	@Instance varchar (20)  = null ,

	@LastUpdateTimestamp bigint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [TypeId]
	, [SourceId]
	, [DestinationId]
	, [Instance]
	, [LastUpdateTimestamp]
    FROM
	[dbo].[JiraMapping]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([SourceId] = @SourceId OR @SourceId IS NULL)
	AND ([DestinationId] = @DestinationId OR @DestinationId IS NULL)
	AND ([Instance] = @Instance OR @Instance IS NULL)
	AND ([LastUpdateTimestamp] = @LastUpdateTimestamp OR @LastUpdateTimestamp IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [TypeId]
	, [SourceId]
	, [DestinationId]
	, [Instance]
	, [LastUpdateTimestamp]
    FROM
	[dbo].[JiraMapping]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([SourceId] = @SourceId AND @SourceId is not null)
	OR ([DestinationId] = @DestinationId AND @DestinationId is not null)
	OR ([Instance] = @Instance AND @Instance is not null)
	OR ([LastUpdateTimestamp] = @LastUpdateTimestamp AND @LastUpdateTimestamp is not null)
	SELECT @@ROWCOUNT			
  END