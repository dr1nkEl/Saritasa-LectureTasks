/*
 * Alexander Farashutdinov
 *
 * add SP _jobs_setNewManHours
 * ALTER TRIGGER [dbo].[InsertJobs]  ON  [dbo].[jobs]  AFTER INSERT
 * ALTER TRIGGER [dbo].[UpdateJobs]  ON  [dbo].[jobs]  AFTER UPDATE
 */
CREATE PROCEDURE [dbo].[_jobs_setNewManHours]
(
    @projectID bigint   = null,
    @targetID bigint   = null
)
AS
BEGIN
  SET NOCOUNT ON;
  
  update projects set 
	billableMenHours = 
		(select isnull(SUM(duration),0) from jobs where projectID=@projectID and billable =1),
	nonbillableMenHours = 
		(select isnull(SUM(duration),0) from jobs where projectID=@projectID and billable =0)
  where projectID=@projectID;
  if(@targetID is not null and exists(select 1 from tasks where documentID = @targetID))	
	update tasks set 
		billableMenHours = 
			(select isnull(SUM(duration),0) from jobs where targetID = @targetID and billable =1),
		nonbillableMenHours = 
			(select isnull(SUM(duration),0) from jobs where targetID = @targetID and billable =0)
	where documentID = @targetID;  
END