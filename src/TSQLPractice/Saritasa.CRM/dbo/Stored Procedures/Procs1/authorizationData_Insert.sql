
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the AuthorizationData table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_Insert]
(

	@AuthID int    OUTPUT,

	@UserId int   ,

	@Login varchar (50)  ,

	@Password varchar (50)  ,

	@Email varchar (200)  ,

	@SecurityQuestion varchar (200)  ,

	@SecurityAnswer varchar (255)  ,

	@LastActivity datetime   ,

	@IsApproved bit   ,

	@IsLocked bit   ,

	@IsOnline bit   ,

	@WrongPassword int   ,

	@SessionKey char (32)  ,

	@LdapLogin varchar (250)  
)
AS


				
				INSERT INTO [dbo].[AuthorizationData]
					(
					[UserId]
					,[Login]
					,[Password]
					,[Email]
					,[SecurityQuestion]
					,[SecurityAnswer]
					,[LastActivity]
					,[IsApproved]
					,[IsLocked]
					,[IsOnline]
					,[WrongPassword]
					,[SessionKey]
					,[LdapLogin]
					)
				VALUES
					(
					@UserId
					,@Login
					,@Password
					,@Email
					,@SecurityQuestion
					,@SecurityAnswer
					,@LastActivity
					,@IsApproved
					,@IsLocked
					,@IsOnline
					,@WrongPassword
					,@SessionKey
					,@LdapLogin
					)
				
				-- Get the identity value
				SET @AuthID = SCOPE_IDENTITY()