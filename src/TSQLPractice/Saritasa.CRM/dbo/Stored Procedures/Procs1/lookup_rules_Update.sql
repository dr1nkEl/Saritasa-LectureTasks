
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_rules table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_Update
(

	@RuleID varchar (20)  ,

	@OriginalRuleID varchar (20)  ,

	@Description varchar (100)  ,

	@GroupID int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_rules]
				SET
					[ruleID] = @RuleID
					,[description] = @Description
					,[groupID] = @GroupID
				WHERE
[ruleID] = @OriginalRuleID 
				
			


