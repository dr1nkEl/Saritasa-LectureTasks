CREATE TABLE [dbo].[LookupBranch] (
    [Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [Name]                   VARCHAR (50)  NOT NULL,
    [WorkDayStartTime]       TINYINT       NULL,
    [DayLightSaving]         BIT           NULL,
    [TimeZone]               SMALLINT      NULL,
    [TimeZoneCode]           VARCHAR (100) NULL,
    [ShortName]              VARCHAR (8)   NULL,
    [CeoUserId]              INT           NULL,
    [HumanResourceEmail]     VARCHAR (255) DEFAULT ('') NOT NULL,
    [IsVacationFileRequired] BIT           DEFAULT ((1)) NOT NULL,
    [IsOversea]              BIT           DEFAULT ((0)) NOT NULL,
    [VacationPeriod]         INT           DEFAULT ((1)) NOT NULL,
    [VacationDaysCount]      INT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_lookup_branch] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_lookup_branch_users] FOREIGN KEY ([CeoUserId]) REFERENCES [dbo].[Users] ([Id])
);

