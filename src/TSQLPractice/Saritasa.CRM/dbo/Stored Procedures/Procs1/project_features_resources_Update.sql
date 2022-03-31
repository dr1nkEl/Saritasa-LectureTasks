
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the project_features_resources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_Update
(

	@ID int   ,

	@ProjectFeatureID int   ,

	@UserID int   ,

	@Role varchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[project_features_resources]
				SET
					[projectFeatureID] = @ProjectFeatureID
					,[userID] = @UserID
					,[role] = @Role
				WHERE
[ID] = @ID 
				
			


