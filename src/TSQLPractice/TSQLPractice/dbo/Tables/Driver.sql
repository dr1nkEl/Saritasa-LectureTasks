CREATE TABLE [dbo].[Driver] (
    [Id]            INT             IDENTITY(1,1) NOT NULL,
    [KeyIdentifier] NVARCHAR (40)   NOT NULL,
    [FirstName]     NVARCHAR (40)   NOT NULL,
    [LastName]      NVARCHAR (40)   NOT NULL,
    [Email]         NVARCHAR (40)   NULL,
    [Phone]         NVARCHAR (20)   NOT NULL,
    [PinCode]       VARBINARY (32) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
