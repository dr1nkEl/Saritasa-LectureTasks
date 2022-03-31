
-- =============================================
-- Author:		Terletskiy
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION getNotesRelatedIDs 
(	
	@targetIds TargetList readonly
)
RETURNS @relatedIds TABLE (documentID bigint not null, noteID bigint)
AS
begin
	declare @count int
	declare @currentCount int
	
	insert @relatedIds
	select documentID,noteID from notes n
	where targetID in (select ti.documentID from @targetIds ti)
	
	select @currentCount = count(*) from @relatedIds
	set @count = 0
	while @currentCount > @count
	begin
		set @count = @currentCount
		
		insert @relatedIds
		select documentID, noteID from notes n
		where exists(select ri.documentID from @relatedIds ri where n.parentNoteID = ri.noteID) and not exists(select t.documentID from @relatedIds t where n.documentID = t.documentID)
		
		select @currentCount=count(*) from @relatedIds
	end
	
	RETURN 
end
