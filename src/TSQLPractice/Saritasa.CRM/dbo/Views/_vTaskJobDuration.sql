
CREATE VIEW [dbo].[_vTaskJobDuration]
AS
SELECT     SUM(j.duration) AS duration, SUM(CASE WHEN j.billable = 1 THEN j.duration ELSE 0 END) AS billable, SUM(CASE WHEN j.billable = 0 THEN j.duration ELSE 0 END) 
                      AS notBillable, t.documentID, t.taskID
FROM         dbo.jobs AS j INNER JOIN
                      dbo.tasks AS t ON t.documentID = j.targetID
GROUP BY t.documentID, t.taskID