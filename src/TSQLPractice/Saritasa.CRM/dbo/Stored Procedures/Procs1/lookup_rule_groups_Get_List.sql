
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_rule_groups table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rule_groups_Get_List

AS


				
				SELECT
					[groupID],
					[groupName]
				FROM
					[dbo].[lookup_rule_groups]
					
				SELECT @@ROWCOUNT
			


