
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the project_sprints table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_Insert
(

	@ID int    OUTPUT,

	@DocumentID bigint   ,

	@ProjectID int   ,

	@Name varchar (50)  ,

	@Limit int   ,

	@StartDate datetime   ,

	@FinishDate datetime   ,

	@Description varchar (MAX)  
)
AS


				
				INSERT INTO [dbo].[project_sprints]
					(
					[documentID]
					,[projectID]
					,[name]
					,[limit]
					,[startDate]
					,[finishDate]
					,[description]
					)
				VALUES
					(
					@DocumentID
					,@ProjectID
					,@Name
					,@Limit
					,@StartDate
					,@FinishDate
					,@Description
					)
				
				-- Get the identity value
				SET @ID = SCOPE_IDENTITY()
									
							
			


