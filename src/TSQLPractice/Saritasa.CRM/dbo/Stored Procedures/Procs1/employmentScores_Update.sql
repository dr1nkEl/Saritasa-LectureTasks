
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the EmploymentScores table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_Update]
(

	@ScoreID bigint   ,

	@UserId int   ,

	@Points smallint   ,

	@CreatedBy int   ,

	@Created datetime   ,

	@Description varchar (MAX)  ,

	@UseForRotation bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[EmploymentScores]
				SET
					[UserId] = @UserId
					,[Points] = @Points
					,[CreatedBy] = @CreatedBy
					,[Created] = @Created
					,[Description] = @Description
					,[UseForRotation] = @UseForRotation
				WHERE
[scoreID] = @ScoreID