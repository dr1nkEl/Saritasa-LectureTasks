
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_rules table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_Find
(

	@SearchUsingOR bit   = null ,

	@RuleID varchar (20)  = null ,

	@Description varchar (100)  = null ,

	@GroupID int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ruleID]
	, [description]
	, [groupID]
    FROM
	[dbo].[lookup_rules]
    WHERE 
	 ([ruleID] = @RuleID OR @RuleID IS NULL)
	AND ([description] = @Description OR @Description IS NULL)
	AND ([groupID] = @GroupID OR @GroupID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ruleID]
	, [description]
	, [groupID]
    FROM
	[dbo].[lookup_rules]
    WHERE 
	 ([ruleID] = @RuleID AND @RuleID is not null)
	OR ([description] = @Description AND @Description is not null)
	OR ([groupID] = @GroupID AND @GroupID is not null)
	SELECT @@ROWCOUNT			
  END
				


