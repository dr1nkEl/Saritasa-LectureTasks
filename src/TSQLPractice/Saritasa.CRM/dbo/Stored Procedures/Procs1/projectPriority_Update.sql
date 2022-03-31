
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectPriority table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectPriority_Update]
(

	@PriorityID int   ,

	@Name varchar (3)  ,

	@Color varchar (6)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectPriority]
				SET
					[Name] = @Name
					,[Color] = @Color
				WHERE
[priorityID] = @PriorityID