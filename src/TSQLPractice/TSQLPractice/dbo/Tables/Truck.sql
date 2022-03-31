CREATE TABLE [dbo].[Truck] (
    [Id]        INT           IDENTITY(1,1) NOT NULL,
    [Number]    NVARCHAR (40) NOT NULL,
    [DriverId]  INT           NULL,
    [Model]     NVARCHAR (40) NULL,
    [Comment]   NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([DriverId]) REFERENCES [dbo].[Driver] ([Id]) ON DELETE SET NULL
);



GO

CREATE INDEX [IX_Truck_DriverId] ON [dbo].[Truck] ([DriverId])
