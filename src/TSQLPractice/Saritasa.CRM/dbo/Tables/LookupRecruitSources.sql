CREATE TABLE [dbo].[LookupRecruitSources] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (255) NOT NULL,
    [IsActive]        BIT           NOT NULL,
    [ParentId]        INT           NULL,
    [Comment]         VARCHAR (512) NOT NULL,
    [Uri]             VARCHAR (512) NOT NULL,
    [CreatedAt]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [CreatedByUserId] INT           NULL,
    CONSTRAINT [PK_LookupRecruitSources_Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_LookupRecruitSources_CreatedByUserId] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_LookupRecruitSources_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[LookupRecruitSources] ([Id])
);

