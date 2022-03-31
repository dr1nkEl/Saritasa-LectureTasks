
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_rule_groups table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rule_groups_Insert
(

	@GroupID int    OUTPUT,

	@GroupName varchar (100)  
)
AS


				
				INSERT INTO [dbo].[lookup_rule_groups]
					(
					[groupName]
					)
				VALUES
					(
					@GroupName
					)
				
				-- Get the identity value
				SET @GroupID = SCOPE_IDENTITY()
									
							
			


