CREATE view dbo._vucResourceListWidget
as
SELECT
  dbo.phones.phone,
  dbo._vUsersDocuments.firstName, dbo._vUsersDocuments.lastName, dbo._vUsersDocuments.fullName, 
                      dbo._vUsersDocuments.Id As userID,
  dbo.employees.Id as 'EmployeeId',
  dbo.employees.ContractSignedAt,
    EmailP.email,
  phones_Cell.phone AS cell, 
      dbo._vUsersDocuments.documentID, dbo._vUsersDocuments.generalStatusID, 
      dbo.employees.branchID, dbo.employees.onsite, phones_Skype.phone as 'skype', dbo.employees.photo, dbo._vUsersDocuments.utilization,
      departments.[Id] As DepartmentId, departments.[Name] as 'departmentName', users.UtilizationPercent
FROM  dbo.employees LEFT OUTER JOIN
  dbo._vUsersDocuments ON dbo.employees.Id = dbo._vUsersDocuments.Id LEFT OUTER JOIN
  dbo.phones ON dbo._vUsersDocuments.documentID = dbo.phones.targetID AND dbo.phones.typeID = 'TEL' LEFT OUTER JOIN
  dbo.phones AS phones_Cell ON dbo._vUsersDocuments.documentID = phones_Cell.targetID AND phones_Cell.typeID = 'MOB' LEFT OUTER JOIN
  dbo.phones AS phones_Skype ON dbo._vUsersDocuments.documentID = phones_Skype.targetID AND phones_Skype.typeID = 'SKP' LEFT OUTER JOIN
  dbo.emails AS EmailP ON dbo._vUsersDocuments.documentID = EmailP.targetID AND EmailP.typeID = 'P' INNER JOIN
  dbo.users ON dbo.employees.Id = dbo.users.Id INNER JOIN
  dbo.[LookupDepartments] AS departments ON dbo.users.departmentID = departments.[Id]