

CREATE VIEW [dbo].[_vucClientListWidget]
AS
SELECT     dbo.documents.documentID, dbo.clients.clientID, dbo.clients.name, dbo.clients.contractTill, dbo.clients.notifiedContractTill, dbo.emails.email, dbo.documents.deleted, dbo.clients.parentClientID, 
                      dbo.documents.generalStatusID, dbo.projects.projectID, dbo.projects.title,
                      usersACM.Id AS ACMManagerUserID, usersACM.firstName AS ACMManageFirstName,usersACM.lastName AS ACMManagerLastName,
                      usersACM.fullName AS ACMManagerFullName,usersACM.documentID AS ACMManagerDocID, 
                      usersSM.Id AS SManagerUserID, usersSM.firstName AS SManageFirstName,usersSM.lastName AS SManagerLastName,
                      usersSM.fullName AS SManagerFullName,usersSM.documentID AS SManagerDocID, 
                      usersPM.Id AS PManagerUserID, usersPM.firstName AS PManagerFirstName, usersPM.lastName AS PManagerLastName, 
                      usersPM.fullName AS PManagerFullName,usersPM.documentID AS PManagerDocID, 
                      dbo.projects.documentID AS projectDocID
FROM      dbo.clients LEFT OUTER JOIN
                      dbo.client_managers ON dbo.clients.clientID = dbo.client_managers.clientID AND dbo.client_managers.roleID = 'SM' LEFT OUTER JOIN
                      dbo._vUsers AS usersSM ON dbo.client_managers.employeeUserID = usersSM.Id LEFT OUTER JOIN
                      dbo.client_managers AS clManagerACM ON dbo.clients.clientID = clManagerACM.clientID AND clManagerACM.roleID = 'ACM' LEFT OUTER JOIN
                      dbo._vUsers AS usersACM ON clManagerACM.employeeUserID = usersACM.Id LEFT OUTER JOIN
                      dbo.client_managers AS clManagerPM ON dbo.clients.clientID = clManagerPM.clientID AND clManagerPM.roleID = 'PM' LEFT OUTER JOIN
                      dbo._vUsers AS usersPM ON clManagerPM.employeeUserID = usersPM.Id LEFT OUTER JOIN
                      dbo.documents ON dbo.documents.documentID = dbo.clients.documentID LEFT OUTER JOIN
                      dbo.emails ON dbo.emails.targetID = dbo.documents.documentID AND dbo.emails.typeID = 'P' LEFT OUTER JOIN
                      dbo.document_calcs ON dbo.clients.documentID = dbo.document_calcs.documentID AND dbo.document_calcs.typeID = 'CP' LEFT OUTER JOIN
                      dbo.projects ON dbo.projects.projectID = dbo.document_calcs.val