/*
 * Ivan Kozhin
 *
 * Added to _vProjectChangeOrdersList skype column.
 */

CREATE VIEW [dbo].[_vProjectChangeOrdersList]
AS
SELECT     co.changeOrderID, co.projectID, co.userID, co.hours, co.description, co.milestouneID, co.created, co.orderID, co.paperworkRecieved,
            p.title, u.employeeID, u.email, u.fullName, u.photo, u.skype, 
            cm.employeeID as smEmployeeID, cm.userID as cmUserID, cm.email as cmEmail, cm.fullName as cmFullName, cm.photo as cmphoto, cm.skype as cmSkype, co.paid
FROM         dbo.projectChangeOrders AS co INNER JOIN
                      dbo.projects p ON co.projectID = p.projectID INNER JOIN
                      dbo._vEmployeesUsers AS u ON u.userID = co.userID LEFT JOIN
                      dbo.client_managers c ON c.clientID = p.clientID AND c.roleID = 'SM ' LEFT JOIN
                      dbo._vEmployeesUsers cm ON cm.userID = c.employeeUserID