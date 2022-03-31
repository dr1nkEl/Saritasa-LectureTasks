
CREATE PROCEDURE [dbo].[_jobs_getAllJobsDuration]
	-- Add the parameters for the stored procedure here
	 @taskID bigint = -1
AS
BEGIN
	SET NOCOUNT ON;

	WITH TaskAndSubTasks (targetID, documentID, title, Level)
	AS
	(
	-- Anchor member definition
		SELECT e.targetID, e.documentID, e.title, 0 AS Level
		FROM tasks AS e
		WHERE taskID = @taskID
		UNION ALL
	-- Recursive member definition
		SELECT e.targetID, e.documentID, e.title, Level + 1
		FROM dbo.tasks AS e
		INNER JOIN TaskAndSubTasks AS d
			ON e.targetID = d.documentID
	)
	-- Statement that executes the CTE
	--SELECT r.documentID, r.targetID, title, Level, j.duration
	SELECT ISNULL( SUM(j.duration), 0) AS TotalDuration
	FROM TaskAndSubTasks t, jobs j
	WHERE j.targetID = t.documentID
END

