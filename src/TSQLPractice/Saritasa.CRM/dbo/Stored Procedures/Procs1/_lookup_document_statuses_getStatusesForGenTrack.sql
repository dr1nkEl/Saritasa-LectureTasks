CREATE PROCEDURE dbo._lookup_document_statuses_getStatusesForGenTrack
(

    @DocType char (3)  = null 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    
    -- Insert statements for procedure here
    select * from lookup_document_statuses 
    where trackID = (select top 1 trackID from document_tracks
                     where trackTypeID='GEN' and typeID = @DocType) 
    order by orderby
END