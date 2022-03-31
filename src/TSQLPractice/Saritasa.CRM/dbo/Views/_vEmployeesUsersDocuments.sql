CREATE view _vEmployeesUsersDocuments
as
SELECT
  dbo.employees.Id as 'UserId',
  dbo.employees.PreviousEmployment,
  dbo.employees.ContractSignedAt, 
  dbo.employees.BranchId,
  dbo.employees.OnSite,
  dbo.employees.Comments,
  dbo.employees.photo,
    stuff((SELECT ',' +cast(x.superviserID as varchar(20))
    FROM     user_supervisers x
    WHERE     x.userID = dbo.employees.Id FOR XML PATH('')), 1, 1, '') as SuperviserIds,
  dbo._vUsersDocuments.FirstName,
  dbo._vUsersDocuments.LastName,
  dbo._vUsersDocuments.FullName,
  dbo._vUsersDocuments.Title, 
  dbo._vUsersDocuments.documentID,
  dbo._vUsersDocuments.generalStatusID,
  dbo._vUsersDocuments.created,
  dbo._vUsersDocuments.updated, 
  dbo._vUsersDocuments.deleted,
  dbo._vUsersDocuments.createdBy, dbo._vUsersDocuments.updatedBy, dbo.lookup_document_statuses.statusName, 
  dbo.lookup_document_statuses.colorCode,
  dbo.employees.Score,
  dbo._vUsersDocuments.Birthday,dbo._vUsersDocuments.timeZone, 
  dbo._vUsersDocuments.timeZoneCode, dbo._vUsersDocuments.notes
FROM dbo.employees INNER JOIN
  dbo._vUsersDocuments ON dbo.employees.Id = dbo._vUsersDocuments.Id INNER JOIN
  dbo.lookup_document_statuses ON dbo._vUsersDocuments.generalStatusID = dbo.lookup_document_statuses.statusID