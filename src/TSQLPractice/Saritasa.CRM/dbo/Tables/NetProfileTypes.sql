CREATE TABLE [dbo].[NetProfileTypes] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [TypeName] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_NetProfileTypes] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);

