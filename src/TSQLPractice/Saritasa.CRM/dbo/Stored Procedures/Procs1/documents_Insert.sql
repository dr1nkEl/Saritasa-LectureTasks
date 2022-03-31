
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Documents table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_Insert]
(

	@DocumentID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[Documents]
					(
					[Priority]
					,[Name]
					,[Created]
					,[Updated]
					,[Deleted]
					,[CreatedBy]
					,[UpdatedBy]
					,[TypeId]
					,[GeneralStatusId]
					,[ObjectId]
					,[ClientId]
					,[ProjectId]
					)
				VALUES
					(
					@Priority
					,@Name
					,@Created
					,@Updated
					,@Deleted
					,@CreatedBy
					,@UpdatedBy
					,@TypeId
					,@GeneralStatusId
					,@ObjectId
					,@ClientId
					,@ProjectId
					)
				
				-- Get the identity value
				SET @DocumentID = SCOPE_IDENTITY()