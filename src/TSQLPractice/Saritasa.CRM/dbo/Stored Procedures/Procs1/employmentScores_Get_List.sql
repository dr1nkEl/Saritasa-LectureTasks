
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the EmploymentScores table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_Get_List]

AS


				
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
					
				SELECT @@ROWCOUNT