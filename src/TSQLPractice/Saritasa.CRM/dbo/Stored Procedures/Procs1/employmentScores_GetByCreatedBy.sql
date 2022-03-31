
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the EmploymentScores table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_GetByCreatedBy]
(

	@CreatedBy int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[scoreID],
					[UserId],
					[Points],
					[CreatedBy],
					[Created],
					[Description],
					[UseForRotation]
				FROM
					[dbo].[EmploymentScores]
				WHERE
					[CreatedBy] = @CreatedBy
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON