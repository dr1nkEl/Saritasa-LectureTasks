
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectResources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_Insert
(

	@Id int    OUTPUT,

	@UserId int   ,

	@ProjectId int   ,

	@CreatedAt datetime   ,

	@CreatedByUserId int   ,

	@UpdatedAt datetime   ,

	@UpdatedByUserId int   ,

	@WorkTypeId int   ,

	@IsDedicated bit   
)
AS


				
				INSERT INTO [dbo].[ProjectResources]
					(
					[UserId]
					,[ProjectId]
					,[CreatedAt]
					,[CreatedByUserId]
					,[UpdatedAt]
					,[UpdatedByUserId]
					,[WorkTypeId]
					,[IsDedicated]
					)
				VALUES
					(
					@UserId
					,@ProjectId
					,@CreatedAt
					,@CreatedByUserId
					,@UpdatedAt
					,@UpdatedByUserId
					,@WorkTypeId
					,@IsDedicated
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()