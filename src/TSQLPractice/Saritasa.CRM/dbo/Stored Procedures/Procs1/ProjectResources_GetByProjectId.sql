
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectResources table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_GetByProjectId
(

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
					[ProjectId] = @ProjectId
				SELECT @@ROWCOUNT