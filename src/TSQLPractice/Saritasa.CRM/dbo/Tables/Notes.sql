CREATE TABLE [dbo].[Notes] (
    [noteID]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [ParentNoteId] BIGINT        NULL,
    [NoteText]     VARCHAR (MAX) NULL,
    [TypeId]       CHAR (2)      NOT NULL,
    [DocumentId]   BIGINT        NOT NULL,
    [TargetId]     BIGINT        NOT NULL,
    [ShowClient]   BIT           CONSTRAINT [DF_notes_showClient] DEFAULT ((0)) NOT NULL,
    [NeedAnswer]   BIT           CONSTRAINT [DF_notes_needAnswer] DEFAULT ((0)) NOT NULL,
    [Viewed]       BIT           CONSTRAINT [DF_notes_viewed] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_noteID] PRIMARY KEY CLUSTERED ([noteID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_note_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_note_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_note_lnt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_note_types] ([typeID]),
    CONSTRAINT [FK_note_note_parentNoteID] FOREIGN KEY ([ParentNoteId]) REFERENCES [dbo].[Notes] ([noteID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_notes_documentID]
    ON [dbo].[Notes]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_notes_targetID]
    ON [dbo].[Notes]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_notes_typeID]
    ON [dbo].[Notes]([TypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_notes_parentNoteID]
    ON [dbo].[Notes]([ParentNoteId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1800393483_1_2]
    ON [dbo].[Notes]([noteID], [ParentNoteId]);


GO
CREATE STATISTICS [_dta_stat_1800393483_2_5]
    ON [dbo].[Notes]([ParentNoteId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_1800393483_5_1_2]
    ON [dbo].[Notes]([DocumentId], [noteID], [ParentNoteId]);


GO

-- =============================================
-- Author:      Terletskiy
-- Create date: 2010/10/28
-- Description: <Description,,>
-- =============================================

CREATE TRIGGER UpdateNoteLinks    ON  notes   AFTER UPDATE
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @noteID int 
    declare @projectID int  
    declare @clientID int
    declare @oldTargetID bigint        
    declare @newTargetID bigint

    select @noteID=noteID, @oldTargetID=targetID from deleted
    select @newTargetID=targetID from inserted

    if(@oldTargetID<>@newTargetID)
    BEGIN
        select @clientID=clientID, @projectID=projectID from documents where documentID=@newTargetID
        
        declare @count int
        declare @currentCount int
        declare @taskTargets as TargetList;
        
        create TABLE #temp (documentID bigint not null, noteID bigint)  
        insert into #temp  select documentID,noteID from notes n where noteID=@noteID
        
        select @currentCount = count(*) from #temp 
        set @count = 0
        while @currentCount > @count
        begin
            set @count = @currentCount
            
            insert into #temp 
            select documentID, noteID from notes n
            where	exists(select 0 from #temp t where n.parentNoteID = t.noteID) 
			and not exists(select 0 from #temp t where n.documentID = t.documentID)
            
            select @currentCount=count(*) from #temp
        end
        
        insert into @taskTargets select documentID from #temp
        
        insert into @taskTargets select nt.documentID from dbo.getFilesRelatedIDs(@taskTargets) as nt
        
        update documents set 
        clientID = @clientID,       
        projectID = @projectID
        where documentID in (select targ.documentID from @taskTargets targ)
        
        drop table #temp
    END
END

GO

/**/
CREATE TRIGGER [dbo].[InsertNotesLinks] 
   ON  [dbo].[notes]
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @targetID bigint
    declare @noteID bigint
    declare @documentID bigint        
    declare @clientID int
    declare @projectID int

    select @targetID=targetID,@documentID=documentID, @noteID=noteID from inserted

    select @clientID=clientID, @projectID=projectID from documents where documentID=@targetID
        
    update documents set 
    clientID = @clientID,   
    projectID = @projectID,
    objectID = @noteID
    where documentID=@documentID
END

GO
CREATE TRIGGER dbo.[notes_AspNet_SqlCacheNotification_Trigger] ON [notes]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'notes'
                       END
                       