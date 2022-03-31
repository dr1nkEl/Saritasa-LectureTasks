CREATE view dbo._vEmployeesUsersRoles
as
  SELECT
    dbo.employees.Id as 'UserId',
    dbo._vUsers.firstName,
    dbo._vUsers.lastName,
    dbo._vUsers.title,
    dbo._vUsers.email,
    dbo._vUsers.typeID, 
    dbo._vUsers.documentID, dbo.user_roles.userRoleID, dbo.user_roles.roleID, dbo.user_roles.created AS roleCreated,
    dbo.lookup_user_roles.roleName, 
      dbo._vUsers.fullName
  FROM
    dbo.employees
    LEFT OUTER JOIN dbo._vUsers ON dbo.employees.Id = dbo._vUsers.Id
    LEFT OUTER JOIN dbo.user_roles ON dbo._vUsers.Id = dbo.user_roles.userID
    LEFT OUTER JOIN dbo.lookup_user_roles ON dbo.user_roles.roleID = dbo.lookup_user_roles.roleID