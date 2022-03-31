
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Phones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_Get_List]

AS


				
				SELECT
					[phoneID],
					[Phone],
					[TargetId],
					[TypeId]
				FROM
					[dbo].[Phones]
					
				SELECT @@ROWCOUNT