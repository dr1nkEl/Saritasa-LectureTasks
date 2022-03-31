
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_rule_groups table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rule_groups_GetByGroupID
(

	@GroupID int   
)
AS


				SELECT
					[groupID],
					[groupName]
				FROM
					[dbo].[lookup_rule_groups]
				WHERE
					[groupID] = @GroupID
				SELECT @@ROWCOUNT
					
			


