
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucRCBTask view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucRCBTask_Get_List

AS


				
				SELECT
					[taskID],
					[title],
					[generalStatusID],
					[statusName],
					[targetID],
					[targetObjID],
					[targetObjType],
					[targetName]
				FROM
					[dbo].[_vucRCBTask]
					
				SELECT @@ROWCOUNT			
			


