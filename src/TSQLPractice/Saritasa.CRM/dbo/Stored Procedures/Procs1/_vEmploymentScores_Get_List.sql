
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vEmploymentScores view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vEmploymentScores_Get_List

AS


				
				SELECT
					[firstName],
					[lastName],
					[documentID],
					[crFirstName],
					[crLastName],
					[crDocID],
					[fullName],
					[crFullName],
					[scoreID],
					[userID],
					[points],
					[createdBy],
					[created],
					[description],
					[useForRotation]
				FROM
					[dbo].[_vEmploymentScores]
					
				SELECT @@ROWCOUNT			
			


