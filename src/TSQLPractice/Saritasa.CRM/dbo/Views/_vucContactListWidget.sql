
CREATE VIEW dbo._vucContactListWidget
AS
SELECT     dbo.contacts.contactID, dbo.contacts.userID, dbo.contacts.clientID, dbo._vUsersDocuments.firstName, dbo._vUsersDocuments.lastName, 
                      dbo._vUsersDocuments.title, dbo._vUsersDocuments.documentID, dbo.phones.phone, dbo._vUsersDocuments.fullName, dbo.clients.parentClientID, 
                      dbo.clients.name AS clientName, dbo.emails.email
FROM         dbo.contacts LEFT OUTER JOIN
                      dbo._vUsersDocuments ON dbo.contacts.userID = dbo._vUsersDocuments.Id LEFT OUTER JOIN
                      dbo.phones ON dbo._vUsersDocuments.documentID = dbo.phones.targetID AND dbo.phones.typeID = 'TEL' LEFT OUTER JOIN
                      dbo.clients ON dbo.contacts.clientID = dbo.clients.clientID LEFT OUTER JOIN
                      dbo.emails ON dbo.emails.targetID = dbo._vUsersDocuments.documentID AND dbo.emails.typeID = 'P'
