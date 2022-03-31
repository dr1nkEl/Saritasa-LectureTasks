/*
 * Updated _vucProjectStatusReportListWidget columns.
 */

CREATE VIEW dbo._vucProjectStatusReportListWidget
AS
SELECT
    dbo.projects.projectID as 'ProjectId',
    dbo.projects.title as 'ProjectName',
    dbo.projects.durationLimit as 'DurationLimit',
    dbo.projects.MinHoursPerMonth,
    dbo.projects.startDate as 'StartDate',
    dbo.projects.proposedFinishDate as 'ProposedFinishDate',
    dbo.projects.menHours as 'MenHours',
    dbo.projects.billableMenHours as 'BillableMenHours',
    dbo.projects.nonbillableMenHours as 'NonBillableMenHours',
    ISNULL(dbo.projects.billingType, '') AS BillingType,
    dbo.projects.PriorityID as 'PriorityId',
    dbo.projects.Frequency as 'Frequency',
    dbo.projects.notes as 'Notes',
    dbo.clients.documentID as 'ClientDocumentId',
    dbo.clients.clientID as 'ClientId',
    dbo.clients.name as 'ClientName',
    dbo.clients.contractTill as 'ClientContractTill',
    pm.pManagersUserId as 'ProjectManagersUserIdsList',
    allocCurMonth.WorkAllocationCurrentMonth,
    allocNextMonth.WorkAllocationNextMonth,
    CAST(calcMonthJobs.val AS INT) AS TotalMonthJobs,
    CAST(calcMonthJobs.val2 AS INT) AS BillibleMonthJobs,
    dbo.documents.generalStatusID as 'StatusId',
    ISNULL(pat.pCount, 0) AS 'NotPaidMilestonesCount',
    eac.fullName AS 'AccountManagerName',
    eac.documentID AS 'AccountManagerDocumentID',
    eac.email AS 'AccountManagerEmail',
    eac.skype AS 'AccountManagerSkype',
    eac.photo AS 'AccountManagerPhoto',
    projects.developmentStartDate as 'DevelopmentStartDate',
    projects.developmentStarted as 'DevelopmentStarted',
    review.name AS 'ReviewName',
    review.rating AS 'ReviewRating',
    review.reviewDate AS 'ReviewDate',
    review.reviewerName AS 'ReviewerName',
    review.reviewTo AS 'ReviewerUserId',
    lastReview.name AS 'LastReviewName',
    lastReview.rating AS 'LastReviewRating',
    lastReview.reviewDate AS 'LastReviewDate',
    lastReview.reviewerName AS 'LastReviewerName',
    lastReview.reviewTo AS 'LastReviewerUserId',
    projects.IsMidProjectSurvey,
    LastProjectMilestone.Id as 'LastMilestoneId',
    LastProjectMilestone.ActualReleaseDate as 'LastMilestoneActualReleaseDate',
    LastProjectMilestone.Name as 'LastMilestoneName',
    LastProjectMilestone.ReleaseVersion as 'LastMilestoneReleaseVersion',
    NextProjectMilestone.Id as 'NextMilestoneId',
    NextProjectMilestone.ActualReleaseDate as 'NextMilestoneActualReleaseDate',
    NextProjectMilestone.Name as 'NextMilestoneName',
    NextProjectMilestone.ReleaseVersion as 'NextMilestoneReleaseVersion'
FROM dbo.projects
left join (select top 1 * from ProjectMilestones where
    ProjectMilestones.Released = 1 order by ProjectMilestones.[Order] desc) as LastProjectMilestone on LastProjectMilestone.ProjectId = Projects.ProjectId
left join (select top 1 * from ProjectMilestones where
    ProjectMilestones.Released = 0 order by ProjectMilestones.[Order] desc)
    as NextProjectMilestone on NextProjectMilestone.ProjectId = Projects.ProjectId and NextProjectMilestone.[Order] = LastProjectMilestone.[Order] + 1
left join dbo.documents ON dbo.projects.documentID = dbo.documents.documentID
left join dbo.clients ON dbo.projects.clientID = dbo.clients.clientID
left join dbo.client_managers AS AManager
    ON dbo.projects.clientID = AManager.clientID
    AND AManager.roleID = 'ACM'
left join dbo._vEmployeesUsers AS eac
    ON eac.userID = AManager.employeeUserID
left join dbo.document_calcs_date AS calcMonthJobs
    ON dbo.projects.projectID = calcMonthJobs.documentID
    AND calcMonthJobs.typeID = 'projectMonthJob'
    AND calcMonthJobs.date = dbo.FirstDayMonth(GETDATE())
left join (SELECT
    SUM(pwa.hours) WorkAllocationCurrentMonth, projectID
    FROM dbo.projectWorkAllocation pwa
    WHERE MONTH(pwa.startDate) = MONTH(GETDATE()) AND YEAR(pwa.startDate) = YEAR(GETDATE())
    GROUP BY pwa.projectID) allocCurMonth ON allocCurMonth.projectID = dbo.projects.projectID
left join (SELECT
    SUM(pwa.hours) WorkAllocationNextMonth,
    projectID
    FROM dbo.projectWorkAllocation pwa
    WHERE pwa.startDate BETWEEN DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())+1, 0) AND DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())+1, -1)
    GROUP BY pwa.projectID) allocNextMonth ON allocNextMonth.projectID = dbo.projects.projectID
left join (SELECT
    projectID, STUFF((SELECT ',' + CAST(x.userID AS VARCHAR(20))
    FROM _vProjectManagers x
    WHERE x.projectID = s.projectID
    AND x.roleID = 'PM'
    FOR XML PATH ('')), 1, 1, '') AS pManagersUserId
    FROM _vProjectManagers s
    GROUP BY projectID) pm ON projects.projectID = pm.projectID
left join (SELECT
    projectID,
    COUNT(pfm.Id) AS pCount
    FROM ProjectFinancialMilestones pfm
    WHERE pfm.PaymentStatus = 0 AND pfm.PhaseDone = 1
    GROUP BY projectID) AS pat ON pat.projectID = dbo.projects.projectID
OUTER APPLY (SELECT TOP 1
      projectID,
      name,
      reviewTo,
      rating,
      (users.firstName + ' ' + users.lastName) AS reviewerName,
      reviewDate
    FROM project_reviews
    INNER JOIN users
        ON project_reviews.reviewTo = users.Id
    WHERE reviewDate IS NULL
    AND scheduledDate < GETDATE()
    AND project_reviews.projectID = projects.projectID) review
OUTER APPLY (SELECT TOP 1
      projectID,
      name,
      reviewTo,
      rating,
      (users.firstName + ' ' + users.lastName) AS reviewerName,
      reviewDate
    FROM project_reviews
    INNER JOIN users
        ON project_reviews.reviewTo = users.Id
    WHERE reviewDate IS NOT NULL
    AND project_reviews.projectID = projects.projectID
    ORDER BY project_reviews.ID DESC) lastReview