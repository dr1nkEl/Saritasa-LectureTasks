
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vClientParent view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vClientParent_Get_List

AS


				
				SELECT
					[clientID],
					[name],
					[created],
					[parentClientID],
					[parentName],
					[parentCreated],
					[parentParentClientID]
				FROM
					[dbo].[_vClientParent]
					
				SELECT @@ROWCOUNT			
			


