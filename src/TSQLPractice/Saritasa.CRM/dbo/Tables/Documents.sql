CREATE TABLE [dbo].[Documents] (
    [documentID]      BIGINT         IDENTITY (100, 1) NOT NULL,
    [Priority]        INT            NULL,
    [Name]            NVARCHAR (500) NULL,
    [Created]         DATETIME       NOT NULL,
    [Updated]         DATETIME       NULL,
    [Deleted]         DATETIME       NULL,
    [CreatedBy]       INT            NOT NULL,
    [UpdatedBy]       INT            NULL,
    [TypeId]          CHAR (3)       NOT NULL,
    [GeneralStatusId] INT            NOT NULL,
    [ObjectId]        BIGINT         NULL,
    [ClientId]        INT            NULL,
    [ProjectId]       INT            NULL,
    CONSTRAINT [PK_documentID] PRIMARY KEY CLUSTERED ([documentID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_document_lds_generalStatusID] FOREIGN KEY ([GeneralStatusId]) REFERENCES [dbo].[lookup_document_statuses] ([statusID]),
    CONSTRAINT [FK_document_ldt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_document_types] ([typeID]),
    CONSTRAINT [FK_document_user_createdBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_document_user_updatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_documents_clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_documents_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);


GO
CREATE NONCLUSTERED INDEX [IX_documents_created]
    ON [dbo].[Documents]([Created] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_documents_createdBy]
    ON [dbo].[Documents]([CreatedBy] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_documents_typeID]
    ON [dbo].[Documents]([TypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_Documents_GeneralStatusId_documentId]
    ON [dbo].[Documents]([GeneralStatusId] ASC)
    INCLUDE([documentID]) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_2072810892_3_1_11_9]
    ON [dbo].[Documents]([Name], [documentID], [GeneralStatusId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_11_4]
    ON [dbo].[Documents]([documentID], [GeneralStatusId], [Created]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_9]
    ON [dbo].[Documents]([documentID], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_17_11]
    ON [dbo].[Documents]([ProjectId], [GeneralStatusId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_6]
    ON [dbo].[Documents]([documentID], [Deleted]);


GO
CREATE STATISTICS [_dta_stat_2072810892_12_11]
    ON [dbo].[Documents]([ObjectId], [GeneralStatusId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_9_1_12]
    ON [dbo].[Documents]([TypeId], [documentID], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_7_1_6]
    ON [dbo].[Documents]([CreatedBy], [documentID], [Deleted]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_17_7]
    ON [dbo].[Documents]([documentID], [ProjectId], [CreatedBy]);


GO
CREATE STATISTICS [_dta_stat_2072810892_9_1_11]
    ON [dbo].[Documents]([TypeId], [documentID], [GeneralStatusId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_17_12]
    ON [dbo].[Documents]([documentID], [ProjectId], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_17_12]
    ON [dbo].[Documents]([GeneralStatusId], [ProjectId], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_4_1]
    ON [dbo].[Documents]([GeneralStatusId], [Created], [documentID]);


GO
CREATE STATISTICS [_dta_stat_2072810892_9_17_11]
    ON [dbo].[Documents]([TypeId], [ProjectId], [GeneralStatusId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_4_11_9]
    ON [dbo].[Documents]([Created], [GeneralStatusId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_17_9]
    ON [dbo].[Documents]([documentID], [ProjectId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_17_16]
    ON [dbo].[Documents]([documentID], [ProjectId], [ClientId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_6_11_1]
    ON [dbo].[Documents]([Deleted], [GeneralStatusId], [documentID]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_1_12]
    ON [dbo].[Documents]([GeneralStatusId], [documentID], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_9_7]
    ON [dbo].[Documents]([documentID], [TypeId], [CreatedBy]);


GO
CREATE STATISTICS [_dta_stat_2072810892_9_17_12]
    ON [dbo].[Documents]([TypeId], [ProjectId], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_7_1_11]
    ON [dbo].[Documents]([CreatedBy], [documentID], [GeneralStatusId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_17_1_6_7]
    ON [dbo].[Documents]([ProjectId], [documentID], [Deleted], [CreatedBy]);


GO
CREATE STATISTICS [_dta_stat_2072810892_9_1_17_12]
    ON [dbo].[Documents]([TypeId], [documentID], [ProjectId], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_12_9_11_1]
    ON [dbo].[Documents]([ObjectId], [TypeId], [GeneralStatusId], [documentID]);


GO
CREATE STATISTICS [_dta_stat_2072810892_12_9_11_17]
    ON [dbo].[Documents]([ObjectId], [TypeId], [GeneralStatusId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_9_1_17_7]
    ON [dbo].[Documents]([TypeId], [documentID], [ProjectId], [CreatedBy]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_1_7_9]
    ON [dbo].[Documents]([GeneralStatusId], [documentID], [CreatedBy], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_7_11_1_4]
    ON [dbo].[Documents]([CreatedBy], [GeneralStatusId], [documentID], [Created]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_7_11_17]
    ON [dbo].[Documents]([documentID], [CreatedBy], [GeneralStatusId], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_17_9_7_11]
    ON [dbo].[Documents]([ProjectId], [TypeId], [CreatedBy], [GeneralStatusId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_11_7_9_4]
    ON [dbo].[Documents]([documentID], [GeneralStatusId], [CreatedBy], [TypeId], [Created]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_7_17_12_9]
    ON [dbo].[Documents]([GeneralStatusId], [CreatedBy], [ProjectId], [ObjectId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_9_7_1_17]
    ON [dbo].[Documents]([GeneralStatusId], [TypeId], [CreatedBy], [documentID], [ProjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_1_11_9_17_12]
    ON [dbo].[Documents]([documentID], [GeneralStatusId], [TypeId], [ProjectId], [ObjectId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_1_17_16_9]
    ON [dbo].[Documents]([GeneralStatusId], [documentID], [ProjectId], [ClientId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_2072810892_12_9_7_11_1]
    ON [dbo].[Documents]([ObjectId], [TypeId], [CreatedBy], [GeneralStatusId], [documentID]);


GO
CREATE STATISTICS [_dta_stat_2072810892_11_1_17_12_7_9]
    ON [dbo].[Documents]([GeneralStatusId], [documentID], [ProjectId], [ObjectId], [CreatedBy], [TypeId]);


GO


CREATE TRIGGER [dbo].[iu_DocumentsHistory] ON [dbo].[documents] after insert, update
AS
DECLARE @rcnt INT
DECLARE @statusid INT
DECLARE @oldstatusid INT
DECLARE @documentid BIGINT
DECLARE @createdby INT
DECLARE @updatedby INT
DECLARE @docType char(3)
DECLARE @comment varchar(MAX)

-- check if we have at least on row
SET @rcnt=@@ROWCOUNT
IF (@rcnt=0) RETURN

-- getting 
SELECT @statusid=generalStatusID, @documentid=documentid, @createdby=createdby, @updatedby=updatedby,@docType=typeID FROM inserted
SELECT @oldstatusid=generalStatusID FROM deleted

IF (@documentid>0) BEGIN
	IF UPDATE(generalStatusID) 
	BEGIN
			--IF NOT EXISTS(SELECT statusid FROM document_status_history WHERE documentid=@documentid AND statusid=@statusid) BEGIN
			-- check if we update the status, not insert it
		IF (@statusid<>@oldstatusid)
		  BEGIN
			declare @trackID int
			set @trackID = 0
			select @trackID=trackID from document_tracks where typeid = @docType and trackTypeID = 'GEN'
			if(@trackID != 0)			
				IF (@updatedby>0)	
					INSERT INTO document_status_history(documentid, statusid, trackID, created, createdby) 
					values(@documentid, @statusid,@trackID, getdate(), @updatedby)
				ELSE 
				BEGIN
					-- so if no info found consider that a MAINTENANCE USER doing changes
					IF (@createdby=0) set @createdby=2
						INSERT INTO document_status_history(documentid, statusid, trackID, created, createdby) 
						values(@documentid, @statusid,@trackID, getdate(), @createdby)			
			    END
	      END
	END
END

GO

CREATE TRIGGER [dbo].[iu_DocumentsStatusChanges] ON [dbo].[documents] after update
AS
DECLARE @rcnt INT
DECLARE @statusid INT
DECLARE @oldstatusid INT
DECLARE @objectID BIGINT
DECLARE @docType char(3)


-- check if we have at least on row
SET @rcnt=@@ROWCOUNT
IF (@rcnt=0) RETURN

-- getting 
SELECT @statusid=generalStatusID, @objectID=objectID, @docType=typeID FROM inserted
SELECT @oldstatusid=generalStatusID FROM deleted

IF (@objectID>0 AND (@docType = 'UC' or @docType = 'UE') ) BEGIN
	IF UPDATE(generalStatusID) OR UPDATE(deleted)
	BEGIN
		update authorizationData set sessionKey = null
		where userID = @objectID;
	END
END
