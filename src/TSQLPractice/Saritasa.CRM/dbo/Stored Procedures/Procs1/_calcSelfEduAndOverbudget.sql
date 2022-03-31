CREATE PROCEDURE [dbo].[_calcSelfEduAndOverbudget]
	@userID int,
	@curDate Datetime
AS
BEGIN
	SET NOCOUNT ON;
	declare @overbudget int=0, @selfEdu int=0, @userDocID bigint, @overCalcID bigint=0, @selfCalcID bigint=0
	
	select @userDocID=documentID from users where Id=@userID

	SET @curDate=dbo.FirstDayMonth(@curDate)
	select @overbudget =SUM(j.duration) from _vJobsReport j
	where j.creatorID=@userID AND j.jobType='O' AND month(j.jobDate)=month(@curDate) AND year(j.jobDate)=year(@curDate)
	
	select @overCalcID=d.calcID from document_calcs_date d where d.typeID='userMonthOverBudget' AND d.documentID=@userDocID AND d.[date]=@curDate
	if(@overCalcID > 0)
		update document_calcs_date 
		SET val=isnull(CAST(@overbudget as varchar(10)), '0')
		where calcID=@overCalcID
	else
		insert into document_calcs_date (typeID, documentID, [date], val)
		VALUES ('userMonthOverBudget', @userDocID, @curDate, isnull(CAST(@overbudget as varchar(10)), '0'))

	select @selfEdu =SUM(j.duration) from _vJobsReport j
	where j.creatorID=@userID AND j.projectID in (578,242,239,126) AND month(j.jobDate)=month(@curDate) AND year(j.jobDate)=year(@curDate)

	select @selfCalcID=d.calcID from document_calcs_date d where d.typeID='userMonthSelfEdu' AND d.documentID=@userDocID AND d.[date]=@curDate		
	if(@selfCalcID > 0)
		update document_calcs_date 
		SET val=isnull(CAST(@selfEdu as varchar(10)), '0')
		where calcID=@selfCalcID
	else
		insert into document_calcs_date (typeID, documentID, [date], val)
		VALUES ('userMonthSelfEdu', @userDocID, @curDate, isnull(CAST(@selfEdu as varchar(10)), '0'))
	
END