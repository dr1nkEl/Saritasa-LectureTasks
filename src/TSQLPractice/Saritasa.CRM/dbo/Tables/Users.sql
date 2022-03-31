CREATE TABLE [dbo].[Users] (
    [Id]                  INT           IDENTITY (100, 1) NOT NULL,
    [FirstName]           VARCHAR (100) DEFAULT ('') NULL,
    [LastName]            VARCHAR (150) DEFAULT ('') NULL,
    [Title]               VARCHAR (100) DEFAULT ('') NULL,
    [DocumentId]          BIGINT        NOT NULL,
    [TypeId]              CHAR (2)      NOT NULL,
    [Birthday]            DATETIME      NULL,
    [TimeZone]            SMALLINT      NULL,
    [TimeZoneCode]        VARCHAR (100) NULL,
    [Notes]               VARCHAR (MAX) NULL,
    [DepartmentId]        INT           CONSTRAINT [DF_users_departmentID] DEFAULT ((1)) NOT NULL,
    [Utilization]         BIT           CONSTRAINT [DF_users_utilization] DEFAULT ((0)) NOT NULL,
    [HideBirthday]        BIT           CONSTRAINT [DF_users_hideBirthday] DEFAULT ((0)) NOT NULL,
    [UtilizationPercent]  INT           CONSTRAINT [DF_users_percentUtilization] DEFAULT ((100)) NOT NULL,
    [DepartmentUpdatedAt] DATETIME      NULL,
    [WorkTypeId]          INT           DEFAULT ((41)) NOT NULL,
    [VendorId]            INT           NULL,
    CONSTRAINT [PK_userID] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_user_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_user_lut_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_user_types] ([typeID]),
    CONSTRAINT [FK_users_lookup_departments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[LookupDepartments] ([Id]),
    CONSTRAINT [FK_users_vendor] FOREIGN KEY ([VendorId]) REFERENCES [dbo].[LookupVendors] ([Id]),
    CONSTRAINT [FK_users_workType] FOREIGN KEY ([WorkTypeId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_users_documentID]
    ON [dbo].[Users]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_users_firstName]
    ON [dbo].[Users]([FirstName] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_users_lastName]
    ON [dbo].[Users]([LastName] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_users_typeID]
    ON [dbo].[Users]([TypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_users_WorkType]
    ON [dbo].[Users]([WorkTypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_267864021_22_1]
    ON [dbo].[Users]([HideBirthday], [Id]);


GO
CREATE STATISTICS [_dta_stat_267864021_11_1]
    ON [dbo].[Users]([FirstName], [Id]);


GO
CREATE STATISTICS [_dta_stat_267864021_15_14]
    ON [dbo].[Users]([TypeId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_267864021_14_1_11]
    ON [dbo].[Users]([DocumentId], [Id], [FirstName]);


GO
CREATE STATISTICS [_dta_stat_267864021_12_11_15]
    ON [dbo].[Users]([LastName], [FirstName], [TypeId]);


GO
CREATE STATISTICS [_dta_stat_267864021_1_15_14]
    ON [dbo].[Users]([Id], [TypeId], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_267864021_15_1_12_11]
    ON [dbo].[Users]([TypeId], [Id], [LastName], [FirstName]);


GO
CREATE STATISTICS [_dta_stat_267864021_14_1_15_12_11]
    ON [dbo].[Users]([DocumentId], [Id], [TypeId], [LastName], [FirstName]);

