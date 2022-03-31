
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectResources table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_GetByUserIdProjectId
(

	@UserId int   ,

	@ProjectId int   
)
AS


				SELECT
					[Id],
					[UserId],
					[ProjectId],
					[CreatedAt],
					[CreatedByUserId],
					[UpdatedAt],
					[UpdatedByUserId],
					[WorkTypeId],
					[IsDedicated]
				FROM
					[dbo].[ProjectResources]
				WHERE
					[UserId] = @UserId
					AND [ProjectId] = @ProjectId
				SELECT @@ROWCOUNT