
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the project_features table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_Insert
(

	@ID int    OUTPUT,

	@DocumentID bigint   ,

	@ProjectID int   ,

	@Name varchar (255)  ,

	@Limit int   ,

	@Description varchar (MAX)  
)
AS


				
				INSERT INTO [dbo].[project_features]
					(
					[documentID]
					,[projectID]
					,[name]
					,[limit]
					,[description]
					)
				VALUES
					(
					@DocumentID
					,@ProjectID
					,@Name
					,@Limit
					,@Description
					)
				
				-- Get the identity value
				SET @ID = SCOPE_IDENTITY()
									
							
			


