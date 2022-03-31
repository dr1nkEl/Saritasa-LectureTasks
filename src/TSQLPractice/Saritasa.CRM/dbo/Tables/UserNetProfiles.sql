CREATE TABLE [dbo].[UserNetProfiles] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [ProfileName]   NVARCHAR (255) NOT NULL,
    [ProfileTypeId] INT            NOT NULL,
    [UserId]        INT            NOT NULL,
    CONSTRAINT [PK_UserNetProfiles] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_UserNetProfiles_NetProfileTypes] FOREIGN KEY ([ProfileTypeId]) REFERENCES [dbo].[NetProfileTypes] ([Id]),
    CONSTRAINT [FK_UserNetProfiles_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IDX_UserNetProfiles_ProfileTypeId]
    ON [dbo].[UserNetProfiles]([ProfileTypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IDX_UserNetProfiles_UserId]
    ON [dbo].[UserNetProfiles]([UserId] ASC) WITH (FILLFACTOR = 80);

