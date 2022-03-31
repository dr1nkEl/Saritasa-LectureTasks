
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_rules table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_rules_Insert
(

	@RuleID varchar (20)  ,

	@Description varchar (100)  ,

	@GroupID int   
)
AS


				
				INSERT INTO [dbo].[lookup_rules]
					(
					[ruleID]
					,[description]
					,[groupID]
					)
				VALUES
					(
					@RuleID
					,@Description
					,@GroupID
					)
				
									
							
			


