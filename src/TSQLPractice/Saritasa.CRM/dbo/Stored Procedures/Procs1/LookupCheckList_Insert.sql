
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the LookupCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_Insert
(

	@Id int    OUTPUT,

	@Name varchar (240)  ,

	@IsKickOff bit   ,

	@OrderId int   ,

	@ParentId int   ,

	@IsRequired bit   ,

	@CheckType int   
)
AS


				
				INSERT INTO [dbo].[LookupCheckList]
					(
					[name]
					,[isKickOff]
					,[orderID]
					,[parentID]
					,[isRequired]
					,[checkType]
					)
				VALUES
					(
					@Name
					,@IsKickOff
					,@OrderId
					,@ParentId
					,@IsRequired
					,@CheckType
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()