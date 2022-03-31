
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the project_features table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_Update
(

	@ID int   ,

	@DocumentID bigint   ,

	@ProjectID int   ,

	@Name varchar (255)  ,

	@Limit int   ,

	@Description varchar (MAX)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[project_features]
				SET
					[documentID] = @DocumentID
					,[projectID] = @ProjectID
					,[name] = @Name
					,[limit] = @Limit
					,[description] = @Description
				WHERE
[ID] = @ID 
				
			


