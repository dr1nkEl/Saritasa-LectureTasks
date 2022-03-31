

CREATE VIEW _vEmploymentScores
AS
SELECT     dbo.users.firstName, dbo.users.lastName, dbo.users.documentID, users_1.firstName AS crFirstName, users_1.lastName AS crLastName, 
                      users_1.documentID AS crDocID, dbo.users.firstName + ' ' + dbo.users.lastName AS fullName, users_1.firstName + ' ' + users_1.lastName AS crFullName, 
                      dbo.employmentScores.scoreID, dbo.employmentScores.userID, dbo.employmentScores.points, dbo.employmentScores.createdBy, dbo.employmentScores.created, 
                      dbo.employmentScores.description, dbo.employmentScores.useForRotation
FROM         dbo.employmentScores INNER JOIN
                      dbo.users ON dbo.employmentScores.userID = dbo.users.Id INNER JOIN
                      dbo.users AS users_1 ON dbo.employmentScores.createdBy = users_1.Id
