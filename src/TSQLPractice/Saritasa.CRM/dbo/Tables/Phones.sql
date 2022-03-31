CREATE TABLE [dbo].[Phones] (
    [phoneID]  INT          IDENTITY (1, 1) NOT NULL,
    [Phone]    VARCHAR (50) NULL,
    [TargetId] BIGINT       NOT NULL,
    [TypeId]   CHAR (3)     NOT NULL,
    CONSTRAINT [PK_phoneID] PRIMARY KEY CLUSTERED ([phoneID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_phone_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_phone_lpt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_phone_types] ([typeID])
);


GO
CREATE NONCLUSTERED INDEX [IX_phones_targetID]
    ON [dbo].[Phones]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [_dta_index_phones_7_715149593__K3_K4]
    ON [dbo].[Phones]([TargetId] ASC, [TypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_715149593_3_1]
    ON [dbo].[Phones]([TargetId], [phoneID]);


GO
CREATE STATISTICS [_dta_stat_715149593_1_4]
    ON [dbo].[Phones]([phoneID], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_715149593_1_3_2]
    ON [dbo].[Phones]([phoneID], [TargetId], [Phone]);


GO
CREATE STATISTICS [_dta_stat_715149593_1_2_4]
    ON [dbo].[Phones]([phoneID], [Phone], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_715149593_4_1_3_2]
    ON [dbo].[Phones]([TypeId], [phoneID], [TargetId], [Phone]);

