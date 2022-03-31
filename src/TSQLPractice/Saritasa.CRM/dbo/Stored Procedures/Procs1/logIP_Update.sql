
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the LogIP table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_Update]
(

	@LogID bigint   ,

	@IP varchar (15)  ,

	@Date datetime   ,

	@Login varchar (100)  ,

	@UserId int   ,

	@Reason int   ,

	@Clear bit   ,

	@ApplicationId int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[LogIP]
				SET
					[IP] = @IP
					,[Date] = @Date
					,[Login] = @Login
					,[UserId] = @UserId
					,[Reason] = @Reason
					,[Clear] = @Clear
					,[ApplicationId] = @ApplicationId
				WHERE
[logID] = @LogID