


CREATE PROCEDURE dbo._notifications_getNewForUser
(
	@UserID int = null
)
AS
BEGIN
	declare @docID bigint;
	declare @count int;

	select @docID = DocumentId from users where Id = @UserID;
	select @count = type from userNoteSettings where userId=@userId and contentType = 'NC';
	if (@docID is not null and @count is not null)
	begin
		select top (@count) notifications.*, fullname, _vUsers.documentid as userDocID, _vUsers.TypeId as userTypeID
		from notifications
		left join _vUsers on _vUsers.Id = notifications.createdby
		where received is null and addressee = @docID and (type = 0 or type = 2)
		order by created desc
		
		select count(*) from notifications
		where received is null and addressee = @docID and (type = 0 or type = 2)
	end
END
