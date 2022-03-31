CREATE VIEW [dbo].[_vucRCBClient]
AS
SELECT     dbo.clients.clientID, dbo.clients.parentClientID, dbo.addresses.state, dbo.addresses.city, dbo.clients.name, dbo.clients.documentID, 
                      broker.name AS brokerName
FROM         dbo.clients LEFT OUTER JOIN
                      dbo.clients AS broker ON dbo.clients.parentClientID = broker.clientID LEFT OUTER JOIN
                      dbo.addresses ON dbo.clients.documentID = dbo.addresses.targetID