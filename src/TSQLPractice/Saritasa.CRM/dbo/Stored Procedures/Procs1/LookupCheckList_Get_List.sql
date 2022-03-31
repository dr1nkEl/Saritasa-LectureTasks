
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the LookupCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_Get_List

AS


				
				SELECT
					[Id],
					[name],
					[isKickOff],
					[orderID],
					[parentID],
					[isRequired],
					[checkType]
				FROM
					[dbo].[LookupCheckList]
					
				SELECT @@ROWCOUNT