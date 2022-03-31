CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature]                 NVARCHAR (128) NOT NULL,
    [CompatibleSchemaVersion] NVARCHAR (128) NOT NULL,
    [IsCurrentVersion]        BIT            NOT NULL,
    CONSTRAINT [PK__aspnet_SchemaVer__7760A435] PRIMARY KEY CLUSTERED ([Feature] ASC, [CompatibleSchemaVersion] ASC) WITH (FILLFACTOR = 80)
);

