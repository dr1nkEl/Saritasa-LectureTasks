
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_rule_groups table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rule_groups_Update
(

	@GroupID int   ,

	@GroupName varchar (100)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_rule_groups]
				SET
					[groupName] = @GroupName
				WHERE
[groupID] = @GroupID 
				
			


