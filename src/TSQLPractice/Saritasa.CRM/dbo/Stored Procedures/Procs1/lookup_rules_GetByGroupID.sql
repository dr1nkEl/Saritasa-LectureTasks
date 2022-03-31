
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_rules table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_GetByGroupID
(

	@GroupID int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[ruleID],
					[description],
					[groupID]
				FROM
					[dbo].[lookup_rules]
				WHERE
					[groupID] = @GroupID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


