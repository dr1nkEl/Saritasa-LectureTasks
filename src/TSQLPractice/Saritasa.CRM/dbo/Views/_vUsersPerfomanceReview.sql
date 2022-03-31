CREATE view _vUsersPerfomanceReview
as
SELECT  dbo.users.Id As userID, dbo.users.firstName + ' ' + dbo.users.lastName AS fullName, dbo.userPerfomanceReview.prCode, dbo.userPerfomanceReview.prDate, dbo.userPerfomanceReview.goals, 
        dbo.userPerfomanceReview.prTeam, dbo.userPerfomanceReview.nextPrDate, dbo.phones.phone AS 'skype', dbo.employees.photo, ISNULL(dbo.emails.email, 'none') AS email, 
        ISNULL(dbo.userPerfomanceReview.prDate, ISNULL(dbo.employees.ContractSignedAt, dbo.documents.created)) as lastReviewDate, dbo.Employees.branchID,
        dbo.[LookupBranch].[Name] as branchName, dbo.[LookupBranch].[ShortName] as branchShortName
FROM    dbo.users INNER JOIN
        dbo.employees ON dbo.users.Id = dbo.employees.Id INNER JOIN
        dbo.documents ON dbo.documents.documentID = dbo.users.documentID INNER JOIN
        dbo.[LookupBranch] ON dbo.employees.branchID = dbo.[LookupBranch].[Id] LEFT OUTER JOIN
        (select userID, MAX(prDate) as prDate  from dbo.userPerfomanceReview group by userID) as prd on prd.userID = dbo.users.Id LEFT OUTER JOIN
        (select userID, prDate, MAX(userPrID) as prID  from dbo.userPerfomanceReview group by userID, prDate) as prID on prID.userID = dbo.users.Id  and prID.prDate = prd.prDate LEFT OUTER JOIN
        dbo.userPerfomanceReview ON dbo.userPerfomanceReview.userPrID = prID.prID LEFT OUTER JOIN
        dbo.phones ON dbo.users.documentID = dbo.phones.targetID AND dbo.phones.typeID = 'SKP' LEFT OUTER JOIN
        dbo.emails ON dbo.users.documentID = dbo.emails.targetID AND dbo.emails.typeID = 'P'        
WHERE   dbo.documents.generalStatusID = 13