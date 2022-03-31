
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the project_features_resources table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_Find
(

	@SearchUsingOR bit   = null ,

	@ID int   = null ,

	@ProjectFeatureID int   = null ,

	@UserID int   = null ,

	@Role varchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ID]
	, [projectFeatureID]
	, [userID]
	, [role]
    FROM
	[dbo].[project_features_resources]
    WHERE 
	 ([ID] = @ID OR @ID IS NULL)
	AND ([projectFeatureID] = @ProjectFeatureID OR @ProjectFeatureID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
	AND ([role] = @Role OR @Role IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ID]
	, [projectFeatureID]
	, [userID]
	, [role]
    FROM
	[dbo].[project_features_resources]
    WHERE 
	 ([ID] = @ID AND @ID is not null)
	OR ([projectFeatureID] = @ProjectFeatureID AND @ProjectFeatureID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	OR ([role] = @Role AND @Role is not null)
	SELECT @@ROWCOUNT			
  END
				


