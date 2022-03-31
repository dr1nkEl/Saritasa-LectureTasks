
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_Insert]
(

	@Id int    OUTPUT,

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


				
				INSERT INTO [dbo].[ProjectMilestones]
					(
					[ProjectId]
					,[Name]
					,[ReleaseVersion]
					,[ScheduledDate]
					,[LimitHours]
					,[Released]
					,[ActualReleaseDate]
					,[Order]
					,[CreatedAt]
					,[CreatedByUserId]
					,[UpdatedAt]
					,[UpdatedByUserId]
					)
				VALUES
					(
					@ProjectId
					,@Name
					,@ReleaseVersion
					,@ScheduledDate
					,@LimitHours
					,@Released
					,@ActualReleaseDate
					,@Order
					,@CreatedAt
					,@CreatedByUserId
					,@UpdatedAt
					,@UpdatedByUserId
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()