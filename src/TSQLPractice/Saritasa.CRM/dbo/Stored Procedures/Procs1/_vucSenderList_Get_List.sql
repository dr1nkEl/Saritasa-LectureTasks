
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucSenderList view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucSenderList_Get_List

AS


				
				SELECT
					[documentID],
					[email],
					[name],
					[typeID],
					[typeName]
				FROM
					[dbo].[_vucSenderList]
					
				SELECT @@ROWCOUNT			
			


