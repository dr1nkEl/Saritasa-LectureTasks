
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the AuthorizationData table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[authorizationData_Get_List]

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
					
				SELECT @@ROWCOUNT