
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Permissions table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_GetByRuleID]
(

	@RuleId varchar (20)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[permissionID],
					[RoleId],
					[RuleId]
				FROM
					[dbo].[Permissions]
				WHERE
					[RuleId] = @RuleId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON