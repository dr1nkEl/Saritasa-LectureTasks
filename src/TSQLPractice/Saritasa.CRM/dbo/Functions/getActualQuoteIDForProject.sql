CREATE FUNCTION [dbo].[getActualQuoteIDForProject] 
(
	-- Add the parameters for the function here
	@ProjID int,
	@onlyApprove bit 
)
RETURNS bigint
AS
BEGIN		 
	-- Declare the return variable here
	DECLARE @QuoteID bigint
	select top 1 @QuoteID=quoteid 
	from  _vQuotesDocuments
	where projectid = @ProjID and statusid = dbo.getDocStatusID('Approve','Q')
	order by created desc

	if((@onlyApprove = 'false') AND (@QuoteID is null))
		select top 1 @QuoteID=quoteid 
		from  _vQuotesDocuments
		where projectid = @ProjID 
		order by created desc 

	-- Return the result of the function
	RETURN @QuoteID
END