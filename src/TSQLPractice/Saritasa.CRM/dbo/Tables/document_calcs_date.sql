CREATE TABLE [dbo].[document_calcs_date] (
    [calcID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [DocumentId] BIGINT        NOT NULL,
    [TypeId]     VARCHAR (20)  NOT NULL,
    [Val]        VARCHAR (200) NOT NULL,
    [Date]       DATETIME      NOT NULL,
    [Val2]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_dcd_calcID] PRIMARY KEY CLUSTERED ([calcID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_dcd_lct_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_calc_types] ([typeID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_dcd_documentID]
    ON [dbo].[document_calcs_date]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_dcd_TypeID]
    ON [dbo].[document_calcs_date]([TypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_dcd_date]
    ON [dbo].[document_calcs_date]([Date] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_417436561_3_1]
    ON [dbo].[document_calcs_date]([TypeId], [calcID]);


GO
CREATE STATISTICS [_dta_stat_417436561_5_1_3]
    ON [dbo].[document_calcs_date]([Date], [calcID], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_417436561_2_1_5]
    ON [dbo].[document_calcs_date]([DocumentId], [calcID], [Date]);


GO
CREATE STATISTICS [_dta_stat_417436561_2_5_3_1]
    ON [dbo].[document_calcs_date]([DocumentId], [Date], [TypeId], [calcID]);


GO
CREATE STATISTICS [_dta_stat_417436561_1_2_4_5_6]
    ON [dbo].[document_calcs_date]([calcID], [DocumentId], [Val], [Date], [Val2]);


GO
CREATE STATISTICS [_dta_stat_417436561_1_2_3_4_5_6]
    ON [dbo].[document_calcs_date]([calcID], [DocumentId], [TypeId], [Val], [Date], [Val2]);

