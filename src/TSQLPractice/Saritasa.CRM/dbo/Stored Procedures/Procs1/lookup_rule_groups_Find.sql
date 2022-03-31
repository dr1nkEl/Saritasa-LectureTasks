
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_rule_groups table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rule_groups_Find
(

	@SearchUsingOR bit   = null ,

	@GroupID int   = null ,

	@GroupName varchar (100)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [groupID]
	, [groupName]
    FROM
	[dbo].[lookup_rule_groups]
    WHERE 
	 ([groupID] = @GroupID OR @GroupID IS NULL)
	AND ([groupName] = @GroupName OR @GroupName IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [groupID]
	, [groupName]
    FROM
	[dbo].[lookup_rule_groups]
    WHERE 
	 ([groupID] = @GroupID AND @GroupID is not null)
	OR ([groupName] = @GroupName AND @GroupName is not null)
	SELECT @@ROWCOUNT			
  END
				


