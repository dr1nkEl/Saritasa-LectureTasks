
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the AuthorizationData table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_GetByLogin]
(

	@Login varchar (50)  
)
AS


				SELECT
					[authID],
					[UserId],
					[Login],
					[Password],
					[Email],
					[SecurityQuestion],
					[SecurityAnswer],
					[LastActivity],
					[IsApproved],
					[IsLocked],
					[IsOnline],
					[WrongPassword],
					[SessionKey],
					[LdapLogin]
				FROM
					[dbo].[AuthorizationData]
				WHERE
					[Login] = @Login
				SELECT @@ROWCOUNT