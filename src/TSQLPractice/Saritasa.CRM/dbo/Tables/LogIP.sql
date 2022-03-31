CREATE TABLE [dbo].[LogIP] (
    [logID]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [IP]            VARCHAR (15)  NOT NULL,
    [Date]          DATETIME      NOT NULL,
    [Login]         VARCHAR (100) NULL,
    [UserId]        INT           NULL,
    [Reason]        INT           CONSTRAINT [DF_logIP_reason] DEFAULT ((0)) NOT NULL,
    [Clear]         BIT           DEFAULT ((0)) NOT NULL,
    [ApplicationId] INT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_logIP] PRIMARY KEY CLUSTERED ([logID] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [logIP_ip]
    ON [dbo].[LogIP]([IP] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_986903033_1_7]
    ON [dbo].[LogIP]([logID], [Clear]);


GO
CREATE STATISTICS [_dta_stat_986903033_2_7_3]
    ON [dbo].[LogIP]([IP], [Clear], [Date]);


GO
CREATE STATISTICS [_dta_stat_986903033_3_7_1]
    ON [dbo].[LogIP]([Date], [Clear], [logID]);


GO
CREATE STATISTICS [_dta_stat_986903033_2_1_7_3]
    ON [dbo].[LogIP]([IP], [logID], [Clear], [Date]);

