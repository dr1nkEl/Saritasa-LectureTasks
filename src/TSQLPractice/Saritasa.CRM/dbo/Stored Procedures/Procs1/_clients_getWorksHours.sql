CREATE PROCEDURE _clients_getWorksHours
(
	@clientID bigint   = null ,
	@date datetime   = null 
)
AS
BEGIN
	SET NOCOUNT ON;
set @date = [dbo].[DateOnly](@date)
declare @first datetime
declare  @last datetime
set @first = dbo.FirstDayMonth(@date)
set @last = dbo.LastDayMonth(@date)


select  isnull(sum(case when billable=1 then duration else 0 end), 0) billable,
	isnull(sum(duration) , 0) duration
from jobs j
where 
	jobDate between  @first and @last 
	and clientID = @clientID
END