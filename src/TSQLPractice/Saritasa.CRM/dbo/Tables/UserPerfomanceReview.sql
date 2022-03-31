CREATE TABLE [dbo].[UserPerfomanceReview] (
    [userPrID]   INT           IDENTITY (1, 1) NOT NULL,
    [UserId]     INT           NOT NULL,
    [prCode]     VARCHAR (30)  NOT NULL,
    [prDate]     DATETIME      NOT NULL,
    [Goals]      VARCHAR (MAX) NOT NULL,
    [prTeam]     VARCHAR (MAX) NOT NULL,
    [nextPrDate] DATETIME      NULL,
    CONSTRAINT [PK_userPerfomanceReview] PRIMARY KEY CLUSTERED ([userPrID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_userPerfomanceReview_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

