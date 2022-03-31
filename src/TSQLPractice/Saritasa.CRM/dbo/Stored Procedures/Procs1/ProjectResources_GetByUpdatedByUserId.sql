
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectResources table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_GetByUpdatedByUserId
(

	@UpdatedByUserId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[UpdatedByUserId] = @UpdatedByUserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON