
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectResources table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_GetById
(

	@Id int   
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
					[Id] = @Id
				SELECT @@ROWCOUNT