
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Documents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_Update]
(

	@DocumentID bigint   ,

	@Priority int   ,

	@Name nvarchar (500)  ,

	@Created datetime   ,

	@Updated datetime   ,

	@Deleted datetime   ,

	@CreatedBy int   ,

	@UpdatedBy int   ,

	@TypeId char (3)  ,

	@GeneralStatusId int   ,

	@ObjectId bigint   ,

	@ClientId int   ,

	@ProjectId int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Documents]
				SET
					[Priority] = @Priority
					,[Name] = @Name
					,[Created] = @Created
					,[Updated] = @Updated
					,[Deleted] = @Deleted
					,[CreatedBy] = @CreatedBy
					,[UpdatedBy] = @UpdatedBy
					,[TypeId] = @TypeId
					,[GeneralStatusId] = @GeneralStatusId
					,[ObjectId] = @ObjectId
					,[ClientId] = @ClientId
					,[ProjectId] = @ProjectId
				WHERE
[documentID] = @DocumentID