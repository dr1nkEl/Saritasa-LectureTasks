
CREATE PROCEDURE [dbo].[_document_calcs_date_getDaysJobsUtilization]
(
	@from datetime   = null ,
	@to datetime   = null 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select val as 'billable', val2 as 'nobillable', 
	case when cast(val2 as  float)=0 then val else cast((cast(val as  float)+cast(val2 as  float)) as varchar)+ '/' + val end  as 'summ',	
	cast(day(date) as varchar)+'.'+cast(month(date) as varchar) as date
    from document_calcs_date
	where date between [dbo].[DateOnly](@from) and [dbo].[DateOnly](@to)  	
	and typeid='daysJobUtilization'
	order by document_calcs_date.date
END

