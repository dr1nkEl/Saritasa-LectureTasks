/*
 * Remove outsourceClientID column from projects table.
 */
CREATE VIEW [dbo].[_vucProjectListWidget] AS
SELECT
    dbo.projects.projectID, dbo.projects.title,
    dbo.projects.durationLimit, dbo.projects.MinHoursPerMonth,
    dbo.projects.proposedFinishDate, dbo.projects.startDate,
    dbo.projects.menHours, dbo.projects.billableMenHours, dbo.projects.nonbillableMenHours,
    dbo.clients.documentID AS clientDocID, dbo.clients.clientID, dbo.clients.name AS clientName, dbo.clients.parentClientID,
    dbo.users.Id AS contactUserID, dbo.users.firstName + ' ' + dbo.users.lastName AS contactFullName, dbo.users.documentID AS contactDocID,
    dbo.documents.documentID, dbo.documents.generalStatusID, dbo.documents.created, dbo.documents.createdBy,
    dbo.lookup_document_statuses.colorCode, dbo.lookup_document_statuses.statusName,
    (SELECT TOP 1 userID FROM dbo.project_managers AS TManager1 WHERE TManager1.projectID = dbo.projects.projectID AND TManager1.roleID = 'TM') AS TManagerUserID,
    SManager.employeeUserID AS SManagerUserID,
    calcsPT.val AS tasks,
    pm.pManagersUserId as pManagersUserIdList, pm.pMmanagersDocId as pMmanagersDocIdList,
    dbo.projects.utilization,
    jobsCurMonth.TotalJobsForMonth,
    jobsPrevMonth.TotalJobsForPrevMonth,
    jobsNextMonth.TotalJobsForNextMonth,
    allocCurMonth.WorkAllocationCurrentMonth,
    allocPrevMonth.WorkAllocationPrevMonth,
    allocNextMonth.WorkAllocationNextMonth,
    getdate() as currentDate,
    projects.developmentStartDate,
    projects.developmentStarted,
    review.name as 'reviewName',
    review.rating as 'reviewRating',
    review.reviewDate as 'reviewDate',
    review.reviewerName as 'reviewerName',
    review.reviewTo as 'reviewerUserID',
    lastReview.name as 'lastReviewName',
    lastReview.rating as 'lastReviewRating',
    lastReview.reviewDate as 'lastReviewDate',
    lastReview.reviewerName as 'lastReviewerName',
    lastReview.reviewTo as 'lastReviewerUserID',
    IsNull(OtherHoursCurrentMonth.TotalJobsForMonth * 100  / (UsHoursCurrentMonth.TotalJobsForMonth + OtherHoursCurrentMonth.TotalJobsForMonth), 0) as 'CurrentMonthAmplification',
    IsNull(OtherHoursPreviousMonth.TotalJobsForMonth * 100  / (UsHoursPreviousMonth.TotalJobsForMonth + OtherHoursPreviousMonth.TotalJobsForMonth), 0)  as 'PreviousMonthAmplification'
FROM
    dbo.projects
    LEFT OUTER JOIN dbo.documents ON dbo.projects.documentID = dbo.documents.documentID
    LEFT OUTER JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID
    LEFT OUTER JOIN dbo.clients ON dbo.projects.clientID = dbo.clients.clientID
    LEFT OUTER JOIN dbo.document_calcs AS calcsPT ON dbo.projects.documentID = calcsPT.documentID AND calcsPT.typeID = 'PT'
    LEFT outer join dbo.client_managers AS SManager ON dbo.projects.clientID = SManager.clientID AND SManager.roleID = 'SM '
    LEFT OUTER JOIN dbo.users ON dbo.projects.userID = dbo.users.Id
 
    -- jobs summary
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForMonth, j.projectID from dbo.jobs j
                    where month(j.jobDate) = month(getdate()) and year(j.jobDate) = year(getdate()) group by j.projectID) jobsCurMonth ON jobsCurMonth.projectID=dbo.projects.projectID
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForPrevMonth, j.projectID from dbo.jobs j
                    where month(j.jobDate) = month(dateadd(month, -1, getdate())) and year(j.jobDate) = year(dateadd(month, -1, getdate())) group by j.projectID) jobsPrevMonth ON jobsPrevMonth.projectID=dbo.projects.projectID
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForNextMonth, j.projectID from dbo.jobs j
                    where month(j.jobDate) = month(dateadd(month, 1, getdate())) and year(j.jobDate) = year(dateadd(month, 1, getdate())) group by j.projectID) jobsNextMonth ON jobsNextMonth.projectID=dbo.projects.projectID
                    
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForMonth, j.projectID from dbo.jobs j
                    join employees e on j.createdBy = e.Id
                    where month(j.jobDate) = month(getdate()) and year(j.jobDate) = year(getdate()) and e.branchID = 3 group by j.projectID) UsHoursCurrentMonth ON UsHoursCurrentMonth.projectID=dbo.projects.projectID
                    
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForMonth, j.projectID from dbo.jobs j
                    join employees e on j.createdBy = e.Id
                    where month(j.jobDate) = month(getdate()) and year(j.jobDate) = year(getdate()) and e.branchID <> 3 group by j.projectID) OtherHoursCurrentMonth ON OtherHoursCurrentMonth.projectID=dbo.projects.projectID
                    
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForMonth, j.projectID from dbo.jobs j
                    join employees e on j.createdBy = e.Id
                    where month(j.jobDate) = month(DATEADD(month, -1, getdate())) and year(j.jobDate) = year(DATEADD(month, -1, getdate())) and e.branchID = 3 group by j.projectID) UsHoursPreviousMonth ON UsHoursPreviousMonth.projectID=dbo.projects.projectID
                    
    LEFT OUTER JOIN (select sum(j.duration) as TotalJobsForMonth, j.projectID from dbo.jobs j
                    join employees e on j.createdBy = e.Id
                    where month(j.jobDate) = month(getdate()) and year(j.jobDate) = year(getdate()) and e.branchID <> 3 group by j.projectID) OtherHoursPreviousMonth ON OtherHoursPreviousMonth.projectID=dbo.projects.projectID
                
    -- allocation
    LEFT OUTER JOIN (select sum(pwa.hours) WorkAllocationCurrentMonth, projectID from dbo.projectWorkAllocation pwa
                    where month(pwa.startDate) = month(getdate()) and year(pwa.startDate) = year(getdate()) group by pwa.projectID) allocCurMonth ON allocCurMonth.projectID=dbo.projects.projectID
    LEFT OUTER JOIN (select sum(pwa.hours) WorkAllocationPrevMonth, projectID from dbo.projectWorkAllocation pwa
                    where month(pwa.startDate) = month(dateadd(month, -1, getdate())) and year(pwa.startDate) = year(dateadd(month, -1, getdate())) group by pwa.projectID) allocPrevMonth ON allocPrevMonth.projectID=dbo.projects.projectID
    LEFT OUTER JOIN (select sum(pwa.hours) WorkAllocationNextMonth, projectID from dbo.projectWorkAllocation pwa
                    where month(pwa.startDate) = month(dateadd(month, 1, getdate())) and year(pwa.startDate) = year(dateadd(month, 1, getdate())) group by pwa.projectID) allocNextMonth ON allocNextMonth.projectID=dbo.projects.projectID
    left outer JOIN
        (select projectID,
        stuff((SELECT ',' +cast(x.userID as varchar(20)) FROM _vProjectManagers x
                WHERE  x.projectID = s.projectID and x.roleID = 'PM' FOR XML PATH('')), 1, 1, '') as pManagersUserId,
        stuff((SELECT ',' +cast(x.documentID as varchar(20)) FROM _vProjectManagers x
                WHERE  x.projectID = s.projectID and x.roleID = 'PM' FOR XML PATH('')), 1, 1, '') as pMmanagersDocId
        from _vProjectManagers s
        group by projectID) pm on projects.projectID = pm.projectID
    outer apply
        (select top 1 projectID, name, reviewTo, rating, (users.firstName + ' ' + users.lastName) as reviewerName, reviewDate from project_reviews
        inner join users on project_reviews.reviewTo = users.Id
        where reviewDate is null and scheduledDate < getdate() and project_reviews.projectID = projects.projectID) review
    outer apply
        (select top 1 projectID, name, reviewTo, rating, (users.firstName + ' ' + users.lastName) as reviewerName, reviewDate from project_reviews
        inner join users on project_reviews.reviewTo = users.Id
        where reviewDate is not null and project_reviews.projectID = projects.projectID
        order by project_reviews.ID desc) lastReview
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vucProjectListWidget';

