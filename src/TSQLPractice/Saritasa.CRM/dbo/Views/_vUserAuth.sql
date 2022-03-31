

CREATE View [dbo].[_vUserAuth]
As
Select  dbo.authorizationData.authID, dbo.authorizationData.userID, dbo.authorizationData.login, dbo.authorizationData.password, dbo.authorizationData.email, 
		dbo.authorizationData.securityQuestion, dbo.authorizationData.securityAnswer, dbo.authorizationData.lastActivity, dbo.authorizationData.isApproved, 
		dbo.authorizationData.isLocked, dbo.authorizationData.isOnline, dbo.authorizationData.ldapLogin, dbo.users.title, dbo.users.typeID, dbo.users.documentID, dbo.users.firstName, dbo.users.lastName, 
		dbo.users.lastName + ' ' + dbo.users.firstName As fullName, dbo.users.birthday, dbo.users.timeZone, dbo.authorizationData.wrongPassword, 
		dbo.users.timeZoneCode
From	dbo.authorizationData Inner Join dbo.users On dbo.authorizationData.userID = dbo.users.Id
