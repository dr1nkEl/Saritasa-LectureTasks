
-- =============================================
-- Author:		Terletskiy
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION getFilesRelatedIDs 
(	
	@targetIds TargetList readonly
)
RETURNS @relatedIds TABLE (documentID bigint not null)
AS
begin
		
	insert @relatedIds
	select documentID from files
	where targetID in (select ti.documentID from @targetIds ti)
	
	RETURN 
end
