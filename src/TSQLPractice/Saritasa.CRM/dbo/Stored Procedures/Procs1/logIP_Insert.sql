
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the LogIP table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_Insert]
(

	@LogID bigint    OUTPUT,

	@IP varchar (15)  ,

	@Date datetime   ,

	@Login varchar (100)  ,

	@UserId int   ,

	@Reason int   ,

	@Clear bit   ,

	@ApplicationId int   
)
AS


				
				INSERT INTO [dbo].[LogIP]
					(
					[IP]
					,[Date]
					,[Login]
					,[UserId]
					,[Reason]
					,[Clear]
					,[ApplicationId]
					)
				VALUES
					(
					@IP
					,@Date
					,@Login
					,@UserId
					,@Reason
					,@Clear
					,@ApplicationId
					)
				
				-- Get the identity value
				SET @LogID = SCOPE_IDENTITY()