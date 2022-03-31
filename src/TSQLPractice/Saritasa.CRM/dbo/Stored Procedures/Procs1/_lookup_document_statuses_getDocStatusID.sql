CREATE PROCEDURE dbo._lookup_document_statuses_getDocStatusID
(
    @StatusName varchar (60) = null,
    @DocType char (3) = null
)
AS
BEGIN
    -- Add the T-SQL statements to compute the return value here
    select top 1 statusid from lookup_document_statuses
    where lower(statusname) = lower(@StatusName) 
    and trackID = (select top 1 trackID from document_tracks 
                    where upper(typeID) = upper(@DocType) and trackTypeID='GEN')
END