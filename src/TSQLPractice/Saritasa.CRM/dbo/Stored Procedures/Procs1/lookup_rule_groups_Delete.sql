
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_rule_groups table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rule_groups_Delete
(

	@GroupID int   
)
AS


				DELETE FROM [dbo].[lookup_rule_groups] WITH (ROWLOCK) 
				WHERE
					[groupID] = @GroupID
					
			


