CREATE TABLE [dbo].[Files] (
    [fileID]      INT              IDENTITY (1, 1) NOT NULL,
    [GroupKey]    CHAR (10)        NULL,
    [Description] VARCHAR (MAX)    NULL,
    [FileSize]    BIGINT           NULL,
    [FilePath]    VARCHAR (MAX)    NULL,
    [FileMime]    CHAR (100)       NULL,
    [UniqueKey]   UNIQUEIDENTIFIER NULL,
    [FileName]    VARCHAR (500)    NOT NULL,
    [DocumentId]  BIGINT           NOT NULL,
    [TargetId]    BIGINT           NULL,
    [TypeId]      CHAR (2)         NOT NULL,
    [FolderId]    INT              NULL,
    CONSTRAINT [PK_fileID] PRIMARY KEY CLUSTERED ([fileID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_file_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_file_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_file_lft_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_file_types] ([typeID]),
    CONSTRAINT [FK_files_fileFolders] FOREIGN KEY ([FolderId]) REFERENCES [dbo].[FileFolders] ([folderID])
);


GO
CREATE NONCLUSTERED INDEX [IX_files_targetID]
    ON [dbo].[Files]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_files_documentID]
    ON [dbo].[Files]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_files_uniqueKey]
    ON [dbo].[Files]([UniqueKey] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1194799664_1_9_13]
    ON [dbo].[Files]([fileID], [DocumentId], [FolderId]);


GO
CREATE STATISTICS [_dta_stat_1194799664_10_1_9_13]
    ON [dbo].[Files]([TargetId], [fileID], [DocumentId], [FolderId]);


GO
/*
-- old
ALTER TRIGGER [dbo].[UpdateFilesLinks] 
   ON  [dbo].[files]
   AFTER UPDATE
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @extDBID int    
    declare @projectID int  
    declare @clientID int
    declare @oldTargetID bigint        
    declare @newTargetID bigint
    declare @documentID bigint

    select @oldTargetID=targetID from deleted
    select @documentID=documentID,@newTargetID=targetID from inserted

    if(@oldTargetID<>@newTargetID)
    BEGIN
        select @extDBID=externalDBID, @clientID=clientID, @projectID=projectID from documents where documentID=@newTargetID
        
        update documents set 
        clientID = @clientID,
        externalDBID = @extDBID,
        projectID = @projectID
        where documentID=@documentID
    END

END
*/
CREATE TRIGGER [dbo].[UpdateFilesLinks] 
   ON  [dbo].[files]
   AFTER UPDATE
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON; 
    declare @projectID int  
    declare @clientID int
    declare @oldTargetID bigint        
    declare @newTargetID bigint
    declare @documentID bigint

    select @oldTargetID=targetID from deleted
    select @documentID=documentID,@newTargetID=targetID from inserted

    if(@oldTargetID<>@newTargetID)
    BEGIN
        select @clientID=clientID, @projectID=projectID from documents where documentID=@newTargetID
        
        update documents set 
        clientID = @clientID,       
        projectID = @projectID
        where documentID=@documentID
    END
END


GO

/*
--old

ALTER TRIGGER [dbo].[InsertFilesLinks] 
   ON  [dbo].[files]
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @targetID bigint
    declare @extDBID int
    declare @documentID bigint        
    declare @clientID int
    declare @projectID int
    declare @fileID int
    
    select @targetID=targetID,@documentID=documentID,@fileID=fileID from inserted

    select @extDBID=externalDBID, @clientID=clientID, @projectID=projectID from documents where documentID=@targetID
        
    update documents set 
    clientID = @clientID,
    externalDBID = @extDBID,
    projectID = @projectID,
    objectID=@fileID
    where documentID=@documentID
END
*/
CREATE TRIGGER [dbo].[InsertFilesLinks] 
   ON  [dbo].[files]
   AFTER INSERT
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @targetID bigint    
    declare @documentID bigint        
    declare @clientID int
    declare @projectID int
    declare @fileID int
    
    select @targetID=targetID,@documentID=documentID,@fileID=fileID from inserted

    select @clientID=clientID, @projectID=projectID from documents where documentID=@targetID
        
    update documents set 
    clientID = @clientID,   
    projectID = @projectID,
    objectID=@fileID
    where documentID=@documentID
END

GO
CREATE TRIGGER dbo.[files_AspNet_SqlCacheNotification_Trigger] ON [files]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'files'
                       END
                       