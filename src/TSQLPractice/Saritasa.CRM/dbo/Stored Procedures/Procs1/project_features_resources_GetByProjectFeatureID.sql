
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_features_resources table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_GetByProjectFeatureID
(

	@ProjectFeatureID int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[ID],
					[projectFeatureID],
					[userID],
					[role]
				FROM
					[dbo].[project_features_resources]
				WHERE
					[projectFeatureID] = @ProjectFeatureID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


