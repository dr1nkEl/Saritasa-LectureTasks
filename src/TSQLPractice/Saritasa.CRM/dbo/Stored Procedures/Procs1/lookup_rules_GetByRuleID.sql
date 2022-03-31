
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_rules table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_GetByRuleID
(

	@RuleID varchar (20)  
)
AS


				SELECT
					[ruleID],
					[description],
					[groupID]
				FROM
					[dbo].[lookup_rules]
				WHERE
					[ruleID] = @RuleID
				SELECT @@ROWCOUNT
					
			


