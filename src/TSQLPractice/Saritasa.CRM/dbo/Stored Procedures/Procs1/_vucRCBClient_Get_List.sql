
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucRCBClient view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucRCBClient_Get_List

AS


				
				SELECT
					[clientID],
					[parentClientID],
					[state],
					[city],
					[name],
					[documentID],
					[brokerName]
				FROM
					[dbo].[_vucRCBClient]
					
				SELECT @@ROWCOUNT			
			


