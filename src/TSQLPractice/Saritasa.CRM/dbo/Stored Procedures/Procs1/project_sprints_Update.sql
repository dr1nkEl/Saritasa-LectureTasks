
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the project_sprints table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_Update
(

	@ID int   ,

	@DocumentID bigint   ,

	@ProjectID int   ,

	@Name varchar (50)  ,

	@Limit int   ,

	@StartDate datetime   ,

	@FinishDate datetime   ,

	@Description varchar (MAX)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[project_sprints]
				SET
					[documentID] = @DocumentID
					,[projectID] = @ProjectID
					,[name] = @Name
					,[limit] = @Limit
					,[startDate] = @StartDate
					,[finishDate] = @FinishDate
					,[description] = @Description
				WHERE
[ID] = @ID 
				
			


