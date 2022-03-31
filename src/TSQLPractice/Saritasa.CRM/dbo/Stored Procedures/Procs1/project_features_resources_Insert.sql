
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the project_features_resources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_Insert
(

	@ID int    OUTPUT,

	@ProjectFeatureID int   ,

	@UserID int   ,

	@Role varchar (50)  
)
AS


				
				INSERT INTO [dbo].[project_features_resources]
					(
					[projectFeatureID]
					,[userID]
					,[role]
					)
				VALUES
					(
					@ProjectFeatureID
					,@UserID
					,@Role
					)
				
				-- Get the identity value
				SET @ID = SCOPE_IDENTITY()
									
							
			


