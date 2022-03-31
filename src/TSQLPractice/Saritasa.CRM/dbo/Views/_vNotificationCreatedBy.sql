
CREATE VIEW dbo._vNotificationCreatedBy
AS
SELECT     dbo.notifications.notificationID, dbo.notifications.addressee, dbo.notifications.subject, dbo.notifications.notes, dbo.notifications.type, dbo.notifications.sendEmail, 
                      dbo.notifications.received, dbo.notifications.created, dbo.notifications.createdBy, dbo._vUsers.fullName, dbo._vUsers.documentID AS userDocID, 
                      dbo._vUsers.typeID AS userTypeID
FROM         dbo.notifications LEFT OUTER JOIN
                      dbo._vUsers ON dbo.notifications.createdBy = dbo._vUsers.Id
