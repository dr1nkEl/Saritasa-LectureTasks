
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_rules table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_Get_List

AS


				
				SELECT
					[ruleID],
					[description],
					[groupID]
				FROM
					[dbo].[lookup_rules]
					
				SELECT @@ROWCOUNT
			


