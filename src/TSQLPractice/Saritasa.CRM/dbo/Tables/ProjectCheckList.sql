CREATE TABLE [dbo].[ProjectCheckList] (
    [ProjectCheckId] INT      IDENTITY (1, 1) NOT NULL,
    [CheckId]        INT      NOT NULL,
    [ProjectId]      INT      NOT NULL,
    [PmCheck]        BIT      CONSTRAINT [DF_projectCheckList_pmCheck] DEFAULT ((0)) NOT NULL,
    [AmCheck]        BIT      CONSTRAINT [DF_projectCheckList_amCheck] DEFAULT ((0)) NOT NULL,
    [ActualDate]     DATETIME NULL,
    CONSTRAINT [PK_projectCheckList] PRIMARY KEY CLUSTERED ([ProjectCheckId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_projectCheckList_lookup_checkList] FOREIGN KEY ([CheckId]) REFERENCES [dbo].[LookupCheckList] ([Id]),
    CONSTRAINT [FK_projectCheckList_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);


GO
CREATE STATISTICS [_dta_stat_774046289_2_3]
    ON [dbo].[ProjectCheckList]([CheckId], [ProjectId]);

