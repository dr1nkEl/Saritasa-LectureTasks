
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_Update]
(

	@Id int   ,

	@ProjectId int   ,

	@Name varchar (50)  ,

	@ReleaseVersion varchar (50)  ,

	@ScheduledDate datetime   ,

	@LimitHours int   ,

	@Released bit   ,

	@ActualReleaseDate datetime   ,

	@Order smallint   ,

	@CreatedAt datetime   ,

	@CreatedByUserId int   ,

	@UpdatedAt datetime   ,

	@UpdatedByUserId int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectMilestones]
				SET
					[ProjectId] = @ProjectId
					,[Name] = @Name
					,[ReleaseVersion] = @ReleaseVersion
					,[ScheduledDate] = @ScheduledDate
					,[LimitHours] = @LimitHours
					,[Released] = @Released
					,[ActualReleaseDate] = @ActualReleaseDate
					,[Order] = @Order
					,[CreatedAt] = @CreatedAt
					,[CreatedByUserId] = @CreatedByUserId
					,[UpdatedAt] = @UpdatedAt
					,[UpdatedByUserId] = @UpdatedByUserId
				WHERE
[Id] = @Id