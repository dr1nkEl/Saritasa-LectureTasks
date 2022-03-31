
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectCheckList table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_Update]
(

	@ProjectCheckId int   ,

	@CheckId int   ,

	@ProjectId int   ,

	@PmCheck bit   ,

	@AmCheck bit   ,

	@ActualDate datetime   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectCheckList]
				SET
					[CheckId] = @CheckId
					,[ProjectId] = @ProjectId
					,[PmCheck] = @PmCheck
					,[AmCheck] = @AmCheck
					,[ActualDate] = @ActualDate
				WHERE
[ProjectCheckId] = @ProjectCheckId