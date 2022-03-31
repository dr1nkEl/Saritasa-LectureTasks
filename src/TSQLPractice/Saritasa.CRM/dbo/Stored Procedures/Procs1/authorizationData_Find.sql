
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the AuthorizationData table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_Find]
(

	@SearchUsingOR bit   = null ,

	@AuthID int   = null ,

	@UserId int   = null ,

	@Login varchar (50)  = null ,

	@Password varchar (50)  = null ,

	@Email varchar (200)  = null ,

	@SecurityQuestion varchar (200)  = null ,

	@SecurityAnswer varchar (255)  = null ,

	@LastActivity datetime   = null ,

	@IsApproved bit   = null ,

	@IsLocked bit   = null ,

	@IsOnline bit   = null ,

	@WrongPassword int   = null ,

	@SessionKey char (32)  = null ,

	@LdapLogin varchar (250)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [authID]
	, [UserId]
	, [Login]
	, [Password]
	, [Email]
	, [SecurityQuestion]
	, [SecurityAnswer]
	, [LastActivity]
	, [IsApproved]
	, [IsLocked]
	, [IsOnline]
	, [WrongPassword]
	, [SessionKey]
	, [LdapLogin]
    FROM
	[dbo].[AuthorizationData]
    WHERE 
	 ([authID] = @AuthID OR @AuthID IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Login] = @Login OR @Login IS NULL)
	AND ([Password] = @Password OR @Password IS NULL)
	AND ([Email] = @Email OR @Email IS NULL)
	AND ([SecurityQuestion] = @SecurityQuestion OR @SecurityQuestion IS NULL)
	AND ([SecurityAnswer] = @SecurityAnswer OR @SecurityAnswer IS NULL)
	AND ([LastActivity] = @LastActivity OR @LastActivity IS NULL)
	AND ([IsApproved] = @IsApproved OR @IsApproved IS NULL)
	AND ([IsLocked] = @IsLocked OR @IsLocked IS NULL)
	AND ([IsOnline] = @IsOnline OR @IsOnline IS NULL)
	AND ([WrongPassword] = @WrongPassword OR @WrongPassword IS NULL)
	AND ([SessionKey] = @SessionKey OR @SessionKey IS NULL)
	AND ([LdapLogin] = @LdapLogin OR @LdapLogin IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [authID]
	, [UserId]
	, [Login]
	, [Password]
	, [Email]
	, [SecurityQuestion]
	, [SecurityAnswer]
	, [LastActivity]
	, [IsApproved]
	, [IsLocked]
	, [IsOnline]
	, [WrongPassword]
	, [SessionKey]
	, [LdapLogin]
    FROM
	[dbo].[AuthorizationData]
    WHERE 
	 ([authID] = @AuthID AND @AuthID is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Login] = @Login AND @Login is not null)
	OR ([Password] = @Password AND @Password is not null)
	OR ([Email] = @Email AND @Email is not null)
	OR ([SecurityQuestion] = @SecurityQuestion AND @SecurityQuestion is not null)
	OR ([SecurityAnswer] = @SecurityAnswer AND @SecurityAnswer is not null)
	OR ([LastActivity] = @LastActivity AND @LastActivity is not null)
	OR ([IsApproved] = @IsApproved AND @IsApproved is not null)
	OR ([IsLocked] = @IsLocked AND @IsLocked is not null)
	OR ([IsOnline] = @IsOnline AND @IsOnline is not null)
	OR ([WrongPassword] = @WrongPassword AND @WrongPassword is not null)
	OR ([SessionKey] = @SessionKey AND @SessionKey is not null)
	OR ([LdapLogin] = @LdapLogin AND @LdapLogin is not null)
	SELECT @@ROWCOUNT			
  END