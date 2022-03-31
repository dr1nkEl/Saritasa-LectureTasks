
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Emails table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_Get_List]

AS


				
				SELECT
					[emailID],
					[Email],
					[TargetId],
					[TypeId]
				FROM
					[dbo].[Emails]
					
				SELECT @@ROWCOUNT