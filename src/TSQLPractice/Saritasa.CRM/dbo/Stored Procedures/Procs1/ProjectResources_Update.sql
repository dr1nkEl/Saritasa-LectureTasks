
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectResources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_Update
(

	@Id int   ,

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


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectResources]
				SET
					[UserId] = @UserId
					,[ProjectId] = @ProjectId
					,[CreatedAt] = @CreatedAt
					,[CreatedByUserId] = @CreatedByUserId
					,[UpdatedAt] = @UpdatedAt
					,[UpdatedByUserId] = @UpdatedByUserId
					,[WorkTypeId] = @WorkTypeId
					,[IsDedicated] = @IsDedicated
				WHERE
[Id] = @Id