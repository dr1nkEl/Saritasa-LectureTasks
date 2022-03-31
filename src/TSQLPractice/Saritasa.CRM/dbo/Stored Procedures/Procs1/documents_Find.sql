
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Documents table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_Find]
(

	@SearchUsingOR bit   = null ,

	@DocumentID bigint   = null ,

	@Priority int   = null ,

	@Name nvarchar (500)  = null ,

	@Created datetime   = null ,

	@Updated datetime   = null ,

	@Deleted datetime   = null ,

	@CreatedBy int   = null ,

	@UpdatedBy int   = null ,

	@TypeId char (3)  = null ,

	@GeneralStatusId int   = null ,

	@ObjectId bigint   = null ,

	@ClientId int   = null ,

	@ProjectId int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [documentID]
	, [Priority]
	, [Name]
	, [Created]
	, [Updated]
	, [Deleted]
	, [CreatedBy]
	, [UpdatedBy]
	, [TypeId]
	, [GeneralStatusId]
	, [ObjectId]
	, [ClientId]
	, [ProjectId]
    FROM
	[dbo].[Documents]
    WHERE 
	 ([documentID] = @DocumentID OR @DocumentID IS NULL)
	AND ([Priority] = @Priority OR @Priority IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
	AND ([Created] = @Created OR @Created IS NULL)
	AND ([Updated] = @Updated OR @Updated IS NULL)
	AND ([Deleted] = @Deleted OR @Deleted IS NULL)
	AND ([CreatedBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([UpdatedBy] = @UpdatedBy OR @UpdatedBy IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([GeneralStatusId] = @GeneralStatusId OR @GeneralStatusId IS NULL)
	AND ([ObjectId] = @ObjectId OR @ObjectId IS NULL)
	AND ([ClientId] = @ClientId OR @ClientId IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [documentID]
	, [Priority]
	, [Name]
	, [Created]
	, [Updated]
	, [Deleted]
	, [CreatedBy]
	, [UpdatedBy]
	, [TypeId]
	, [GeneralStatusId]
	, [ObjectId]
	, [ClientId]
	, [ProjectId]
    FROM
	[dbo].[Documents]
    WHERE 
	 ([documentID] = @DocumentID AND @DocumentID is not null)
	OR ([Priority] = @Priority AND @Priority is not null)
	OR ([Name] = @Name AND @Name is not null)
	OR ([Created] = @Created AND @Created is not null)
	OR ([Updated] = @Updated AND @Updated is not null)
	OR ([Deleted] = @Deleted AND @Deleted is not null)
	OR ([CreatedBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([UpdatedBy] = @UpdatedBy AND @UpdatedBy is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([GeneralStatusId] = @GeneralStatusId AND @GeneralStatusId is not null)
	OR ([ObjectId] = @ObjectId AND @ObjectId is not null)
	OR ([ClientId] = @ClientId AND @ClientId is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	SELECT @@ROWCOUNT			
  END