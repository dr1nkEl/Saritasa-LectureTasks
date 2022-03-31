
CREATE VIEW [dbo].[_vProjectJobDuration]
AS
SELECT     p.projectID, dr.duration, drm.duration AS currentMonthDuration
FROM         dbo.projects AS p LEFT OUTER JOIN
                          (SELECT     projectID, SUM(duration) AS duration
                            FROM          dbo.jobs
                            WHERE      (projectID IS NOT NULL)
                            GROUP BY projectID) AS dr ON dr.projectID = p.projectID LEFT OUTER JOIN
                          (SELECT     projectID, SUM(duration) AS duration
                            FROM          dbo.jobs AS jobs_1
                            WHERE      (projectID IS NOT NULL) AND (DATEPART(m, JobDate) = DATEPART(m, CURRENT_TIMESTAMP)) AND (DATEPART(YEAR, JobDate) = DATEPART(YEAR, 
                                                   CURRENT_TIMESTAMP))
                            GROUP BY projectID) AS drm ON drm.projectID = p.projectID;