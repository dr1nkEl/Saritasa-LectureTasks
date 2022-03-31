
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the project_reviews table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_Insert
(

	@ID int    OUTPUT,

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


				
				INSERT INTO [dbo].[project_reviews]
					(
					[projectID]
					,[name]
					,[scheduledDate]
					,[createdBy]
					,[created]
					,[reviewTo]
					,[reviewedBy]
					,[reviewDate]
					,[updatedBy]
					,[updated]
					,[rating]
					,[comment]
					)
				VALUES
					(
					@ProjectID
					,@Name
					,@ScheduledDate
					,@CreatedBy
					,@Created
					,@ReviewTo
					,@ReviewedBy
					,@ReviewDate
					,@UpdatedBy
					,@Updated
					,@Rating
					,@Comment
					)
				
				-- Get the identity value
				SET @ID = SCOPE_IDENTITY()
									
							
			


