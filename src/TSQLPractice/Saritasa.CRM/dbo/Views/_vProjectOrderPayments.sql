

CREATE view dbo._vProjectOrderPayments
as
  select
    p.projectID, p.title, co.changeOrderID, co.milestouneID, co.userID, co.hours, co.description,
    co.orderID, co.paperworkRecieved, co.created,
		pm.name, ISNULL(pc.unpaidCount, 0) as unpaidCount, u.EmployeeId, u.email, u.fullName, u.photo, u.skype
from projects p
inner join projectChangeOrders co on co.projectID=p.projectID and co.paid=0
inner join [ProjectFinancialMilestones] pm on pm.[Id]=co.milestouneID
INNER JOIN dbo._vEmployeesUsers AS u ON u.userID = co.userID
left join (select count(pmm.[Id]) as unpaidCount, pmm.projectID from [ProjectFinancialMilestones] pmm
			where pmm.paymentStatus=0 
			group by pmm.projectID
			) pc on pc.projectID=p.projectID