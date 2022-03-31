CREATE PROCEDURE dbo._calcUserUtilization
	@userID int,
	@curDate Datetime
AS
BEGIN
	-- TODO: need to change month(j.jobDate) = month(@curDate) AND year(j.jobDate) = year(@curDate)
	-- because in this case we cannot use indexes

	SET NOCOUNT ON;
	declare @utilCalcID int = 0, @userDocID bigint, @userUtil bit = 0, @userUtilization int = 0, @userBillableUtilization int = 0;

	select @userDocID = DocumentId, @userUtil = Utilization from users where Id = @userID;

	if (@userUtil = 1)
	BEGIN
	    -- Get user utilization for a period.
		declare @startDate datetime = dbo.FirstDayMonth(dbo.DateOnly(@curDate));
		declare @endDate datetime = dbo.SetMaxTime(@curDate);

		exec _getUserUtlization @userId, @startDate, @endDate, @userUtilization OUTPUT, @userBillableUtilization OUTPUT

		-- Get user utilization for userThirtyDaysUtil type.
		delete from document_calcs_date where typeID= 'userThirtyDaysUtil' and documentID = @userDocID

		set @endDate = GetDate();
		set @startDate = DateAdd(day, -30, @endDate);

		declare @userThirtyDaysUtil int = 0;
		declare @userThirtyDaysBillableUtil int = 0;
		exec _getUserUtlization @userId, @startDate, @endDate, @userThirtyDaysUtil OUTPUT, @userThirtyDaysBillableUtil OUTPUT

		insert into document_calcs_date (typeID, documentID, [date], val, val2)
		values('userThirtyDaysUtil', @userDocID, @endDate, @userThirtyDaysUtil, @userThirtyDaysBillableUtil)
	END

	-- Set utilization values for userMonthUtilization type.
	select @utilCalcID = d.calcID
	from document_calcs_date d
	where d.typeID = 'userMonthUtilization' AND d.documentID = @userDocID AND month(d.[date]) = month(@curDate) AND year(d.[date]) = year(@curDate);
	if (@utilCalcID > 0)
	begin
		update document_calcs_date
		SET [date] = dbo.FirstDayMonth(@curDate), val = @userUtilization,  val2 = @userBillableUtilization
		where calcID = @utilCalcID;
	end
	else
	begin
		insert into document_calcs_date (typeID, documentID, [date], val, val2)
		VALUES ('userMonthUtilization', @userDocID, dbo.FirstDayMonth(@curDate), @userUtilization, @userBillableUtilization);
	end;
END