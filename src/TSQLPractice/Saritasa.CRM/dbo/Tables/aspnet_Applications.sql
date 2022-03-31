CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName]        NVARCHAR (256)   NOT NULL,
    [LoweredApplicationName] NVARCHAR (256)   NOT NULL,
    [ApplicationId]          UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Description]            NVARCHAR (256)   NULL,
    CONSTRAINT [PK__aspnet_Applicati__6CE315C2] PRIMARY KEY NONCLUSTERED ([ApplicationId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UQ__aspnet_Applicati__6DD739FB] UNIQUE NONCLUSTERED ([LoweredApplicationName] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [UQ__aspnet_Applicati__6ECB5E34] UNIQUE NONCLUSTERED ([ApplicationName] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index]
    ON [dbo].[aspnet_Applications]([LoweredApplicationName] ASC) WITH (FILLFACTOR = 80);

