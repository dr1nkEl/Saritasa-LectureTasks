
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_rules table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_Delete
(

	@RuleID varchar (20)  
)
AS


				DELETE FROM [dbo].[lookup_rules] WITH (ROWLOCK) 
				WHERE
					[ruleID] = @RuleID
					
			


