--Get active employees by a branch with detailed info. Order by the user identifier.

CREATE PROCEDURE [dbo].[__EmployeesByBranch]
	@branchId int
AS
BEGIN
	SELECT Employees.Id AS Id,
    Users.FirstName AS FirstName,
    Users.LastName AS LastName,
    Users.Birthday AS BirthDay,
    Users.Utilization AS Utilization,
    LookupDepartments.Name AS Department,
    primaryPhone.Phone as PrimaryPhone,
    cellPhone.Phone as CellPhone,
    skype.Phone AS Skype,
    email.Email AS Email,
    altEmails.emails AS AltEmail,
    jobs.LastJobDate AS LastJobDate

    FROM Employees

    JOIN Users
    ON Employees.Id = Users.Id

    JOIN Documents
    ON Documents.documentID = Users.DocumentId

    JOIN LookupDepartments
    ON LookupDepartments.Id = Users.DepartmentId

    JOIN Phones primaryPhone
    ON primaryPhone.TargetID = Documents.documentID AND primaryPhone.TypeId = 'TEL'

    JOIN Phones cellPhone
    ON cellPhone.TargetID = Documents.documentID AND cellPhone.TypeId = 'MOB'

    JOIN Phones skype
    ON skype.TargetID = Documents.documentID AND skype.TypeId = 'SKP'

    JOIN Emails email
    ON email.TargetId = Documents.documentID AND email.TypeId= 'P'

    JOIN
    (SELECT allEmails.TargetId as TargetId,
        (
            SELECT altEmails.Email
            FROM Emails as altEmails
            WHERE allEmails.TargetId = altEmails.TargetId AND altEmails.TypeId = 'A'
            FOR XML PATH('')
        ) AS emails 
    FROM Emails allEmails
    GROUP BY TargetId) altEmails on altEmails.TargetId = Documents.documentID

    JOIN (SELECT MAX(JobDate) as LastJobDate,
    CreatedBy
    FROM Jobs
    GROUP BY CreatedBy) jobs on jobs.CreatedBy = Employees.Id

    JOIN lookup_document_statuses
    ON lookup_document_statuses.statusID = Documents.GeneralStatusId

    WHERE lookup_document_statuses.StatusName = 'Active' AND Employees.BranchId = @branchId
    ORDER BY Employees.Id;
END
