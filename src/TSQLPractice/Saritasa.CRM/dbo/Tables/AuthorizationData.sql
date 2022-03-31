CREATE TABLE [dbo].[AuthorizationData] (
    [authID]           INT           IDENTITY (1, 1) NOT NULL,
    [UserId]           INT           NOT NULL,
    [Login]            VARCHAR (50)  NULL,
    [Password]         VARCHAR (50)  NULL,
    [Email]            VARCHAR (200) NULL,
    [SecurityQuestion] VARCHAR (200) NULL,
    [SecurityAnswer]   VARCHAR (255) NULL,
    [LastActivity]     DATETIME      DEFAULT (getdate()) NOT NULL,
    [IsApproved]       BIT           NOT NULL,
    [IsLocked]         BIT           NULL,
    [IsOnline]         BIT           NULL,
    [WrongPassword]    INT           DEFAULT ((0)) NOT NULL,
    [SessionKey]       CHAR (32)     NULL,
    [LdapLogin]        VARCHAR (250) DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_authID] PRIMARY KEY CLUSTERED ([authID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [CK_authorizationData] CHECK ([Login]<>'')
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IQ_email]
    ON [dbo].[AuthorizationData]([Email] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IQ_userID]
    ON [dbo].[AuthorizationData]([UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IQ_login]
    ON [dbo].[AuthorizationData]([Login] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_ldapLogin]
    ON [dbo].[AuthorizationData]([LdapLogin] ASC) WITH (FILLFACTOR = 80);

