/*
/ Add column GeneralStatusID
*/
CREATE VIEW [dbo].[_vUsersRoles]
AS
SELECT     dbo._vUserAuth.userID, dbo._vUserAuth.firstName, dbo._vUserAuth.lastName, dbo._vUserAuth.title, dbo.documents.generalStatusId, dbo._vUserAuth.typeID, dbo._vUserAuth.documentID, 
                      dbo.user_roles.userRoleID, dbo.user_roles.roleID, dbo.lookup_user_roles.roleName, dbo._vUserAuth.login, dbo._vUserAuth.password, dbo._vUserAuth.email, 
                      dbo._vUserAuth.securityAnswer, dbo._vUserAuth.securityQuestion, dbo._vUserAuth.lastActivity, dbo._vUserAuth.isApproved, dbo._vUserAuth.isLocked, 
                      dbo._vUserAuth.isOnline, dbo._vUserAuth.authID, dbo._vUserAuth.fullName, dbo._vUserAuth.birthday, dbo._vUserAuth.timeZone, 
                      dbo._vUserAuth.timeZoneCode
FROM         dbo._vUserAuth LEFT OUTER JOIN
                      dbo.user_roles ON dbo._vUserAuth.userID = dbo.user_roles.userID LEFT OUTER JOIN
                      dbo.lookup_user_roles ON dbo.user_roles.roleID = dbo.lookup_user_roles.roleID inner JOIN
                      dbo.documents on dbo._vUserAuth.documentID = dbo.documents.documentID




