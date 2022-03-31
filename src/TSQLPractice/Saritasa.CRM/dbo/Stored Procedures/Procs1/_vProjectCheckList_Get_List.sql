
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectCheckList view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vProjectCheckList_Get_List

AS


				
				SELECT
					[checkID],
					[name],
					[isKickOff],
					[orderID],
					[parentID],
					[projectID],
					[pmCheck],
					[amCheck],
					[actualDate],
					[projectCheckId],
					[isRequired],
					[checkType]
				FROM
					[dbo].[_vProjectCheckList]
					
				SELECT @@ROWCOUNT			
			


