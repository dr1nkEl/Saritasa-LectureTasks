
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the EmploymentScores table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_Insert]
(

	@ScoreID bigint    OUTPUT,

	@UserId int   ,

	@Points smallint   ,

	@CreatedBy int   ,

	@Created datetime   ,

	@Description varchar (MAX)  ,

	@UseForRotation bit   
)
AS


				
				INSERT INTO [dbo].[EmploymentScores]
					(
					[UserId]
					,[Points]
					,[CreatedBy]
					,[Created]
					,[Description]
					,[UseForRotation]
					)
				VALUES
					(
					@UserId
					,@Points
					,@CreatedBy
					,@Created
					,@Description
					,@UseForRotation
					)
				
				-- Get the identity value
				SET @ScoreID = SCOPE_IDENTITY()