
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_Get_List]

AS


				
				SELECT
					[ProjectCheckId],
					[CheckId],
					[ProjectId],
					[PmCheck],
					[AmCheck],
					[ActualDate]
				FROM
					[dbo].[ProjectCheckList]
					
				SELECT @@ROWCOUNT