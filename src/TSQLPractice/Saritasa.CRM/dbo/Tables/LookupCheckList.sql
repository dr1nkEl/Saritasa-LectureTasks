CREATE TABLE [dbo].[LookupCheckList] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (240) NOT NULL,
    [IsKickOff]  BIT           CONSTRAINT [DF_lookup_checkList_isKickOff] DEFAULT ((0)) NOT NULL,
    [OrderId]    INT           NOT NULL,
    [ParentId]   INT           NULL,
    [IsRequired] BIT           CONSTRAINT [DF_lookup_checkList_isRequired] DEFAULT ((1)) NOT NULL,
    [CheckType]  INT           CONSTRAINT [DF_lookup_checkList_checkType] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_lookup_checkList] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_lookup_checkList_lookup_checkList] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[LookupCheckList] ([Id])
);

