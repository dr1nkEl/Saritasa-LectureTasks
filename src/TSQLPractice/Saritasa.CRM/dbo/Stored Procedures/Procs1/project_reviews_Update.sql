
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the project_reviews table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_Update
(

	@ID int   ,

	@ProjectID int   ,

	@Name varchar (100)  ,

	@ScheduledDate datetime   ,

	@CreatedBy int   ,

	@Created datetime   ,

	@ReviewTo int   ,

	@ReviewedBy int   ,

	@ReviewDate datetime   ,

	@UpdatedBy int   ,

	@Updated datetime   ,

	@Rating int   ,

	@Comment text   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[project_reviews]
				SET
					[projectID] = @ProjectID
					,[name] = @Name
					,[scheduledDate] = @ScheduledDate
					,[createdBy] = @CreatedBy
					,[created] = @Created
					,[reviewTo] = @ReviewTo
					,[reviewedBy] = @ReviewedBy
					,[reviewDate] = @ReviewDate
					,[updatedBy] = @UpdatedBy
					,[updated] = @Updated
					,[rating] = @Rating
					,[comment] = @Comment
				WHERE
[ID] = @ID 
				
			


