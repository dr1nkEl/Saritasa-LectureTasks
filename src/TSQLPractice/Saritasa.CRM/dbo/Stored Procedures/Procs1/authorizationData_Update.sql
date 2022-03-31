
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the AuthorizationData table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_Update]
(

	@AuthID int   ,

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


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[AuthorizationData]
				SET
					[UserId] = @UserId
					,[Login] = @Login
					,[Password] = @Password
					,[Email] = @Email
					,[SecurityQuestion] = @SecurityQuestion
					,[SecurityAnswer] = @SecurityAnswer
					,[LastActivity] = @LastActivity
					,[IsApproved] = @IsApproved
					,[IsLocked] = @IsLocked
					,[IsOnline] = @IsOnline
					,[WrongPassword] = @WrongPassword
					,[SessionKey] = @SessionKey
					,[LdapLogin] = @LdapLogin
				WHERE
[authID] = @AuthID