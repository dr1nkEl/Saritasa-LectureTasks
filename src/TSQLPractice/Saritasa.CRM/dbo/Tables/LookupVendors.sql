CREATE TABLE [dbo].[LookupVendors] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (255) NOT NULL,
    [IsActive]        BIT           DEFAULT ((1)) NOT NULL,
    [CreatedAt]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [CreatedByUserId] INT           NULL,
    CONSTRAINT [PK_LookupVendors_Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_LookupVendors_CreatedByUserId] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[Users] ([Id])
);

