CREATE TABLE [dbo].[Emails] (
    [emailID]  INT           IDENTITY (1, 1) NOT NULL,
    [Email]    VARCHAR (MAX) NULL,
    [TargetId] BIGINT        NOT NULL,
    [TypeId]   CHAR (2)      NOT NULL,
    CONSTRAINT [PK_emailID] PRIMARY KEY CLUSTERED ([emailID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_email_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_email_let_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_email_types] ([typeID])
);


GO
CREATE NONCLUSTERED INDEX [IX_emails_targetID]
    ON [dbo].[Emails]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_emails_typeID]
    ON [dbo].[Emails]([TypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [_dta_index_emails_7_1224391431__K4_3]
    ON [dbo].[Emails]([TypeId] ASC)
    INCLUDE([TargetId]) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1224391431_3_4]
    ON [dbo].[Emails]([TargetId], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_1224391431_1_3]
    ON [dbo].[Emails]([emailID], [TargetId]);


GO
CREATE STATISTICS [_dta_stat_1224391431_4_1_3]
    ON [dbo].[Emails]([TypeId], [emailID], [TargetId]);

