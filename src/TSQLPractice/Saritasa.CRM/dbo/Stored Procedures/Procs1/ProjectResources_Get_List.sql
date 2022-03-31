
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectResources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectResources_Get_List

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
					
				SELECT @@ROWCOUNT