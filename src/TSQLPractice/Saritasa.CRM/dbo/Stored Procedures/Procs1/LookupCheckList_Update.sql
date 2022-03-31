
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the LookupCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_Update
(

	@Id int   ,

	@Name varchar (240)  ,

	@IsKickOff bit   ,

	@OrderId int   ,

	@ParentId int   ,

	@IsRequired bit   ,

	@CheckType int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[LookupCheckList]
				SET
					[name] = @Name
					,[isKickOff] = @IsKickOff
					,[orderID] = @OrderId
					,[parentID] = @ParentId
					,[isRequired] = @IsRequired
					,[checkType] = @CheckType
				WHERE
[Id] = @Id