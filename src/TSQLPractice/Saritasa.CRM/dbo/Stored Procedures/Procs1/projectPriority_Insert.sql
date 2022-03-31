
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectPriority table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectPriority_Insert]
(

	@PriorityID int    OUTPUT,

	@Name varchar (3)  ,

	@Color varchar (6)  
)
AS


				
				INSERT INTO [dbo].[ProjectPriority]
					(
					[Name]
					,[Color]
					)
				VALUES
					(
					@Name
					,@Color
					)
				
				-- Get the identity value
				SET @PriorityID = SCOPE_IDENTITY()