
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_Insert]
(

	@ProjectCheckId int    OUTPUT,

	@CheckId int   ,

	@ProjectId int   ,

	@PmCheck bit   ,

	@AmCheck bit   ,

	@ActualDate datetime   
)
AS


				
				INSERT INTO [dbo].[ProjectCheckList]
					(
					[CheckId]
					,[ProjectId]
					,[PmCheck]
					,[AmCheck]
					,[ActualDate]
					)
				VALUES
					(
					@CheckId
					,@ProjectId
					,@PmCheck
					,@AmCheck
					,@ActualDate
					)
				
				-- Get the identity value
				SET @ProjectCheckId = SCOPE_IDENTITY()