/*
 * Update [_vJobsType].
 */
CREATE VIEW [dbo].[_vJobsType]
AS
	select
		jobs.jobID,
		(case
			when
				projects.utilization = 1 and jobs.billable = 1 and jobs.clientID not in (2, 9, 119)
			then 'B'
			when
				projects.utilization = 1 and jobs.billable = 0 and jobs.clientID not in (2, 9, 119)
			then 'O'
			when
				projects.utilization = 1 and jobs.clientID in (2, 9, 119)
			then 'I'
			when
				projects.utilization = 0 and users.utilization = 1 and jobs.clientID in (2, 9, 119)
			then 'U'
			else 'A'
		end
		) as jobType
	from
		jobs
		inner join projects on jobs.projectID = projects.projectID
		inner join users on jobs.createdBy = users.Id
	where
		jobs.duration is not null;