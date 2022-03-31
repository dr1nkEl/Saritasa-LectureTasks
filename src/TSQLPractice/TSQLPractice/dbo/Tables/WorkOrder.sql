CREATE TABLE [dbo].[WorkOrder] (
    [Id]          INT          IDENTITY (1,1) NOT NULL,
    [Number]      INT          NOT NULL,
    [CheckIn]     DATETIME     NULL,
    [CheckOut]    DATETIME     NULL,
    [DriverId]    INT          NULL,
    [TruckId]     INT          NULL,
    [CreatedAt]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([DriverId]) REFERENCES [dbo].[Driver] ([Id]) ON DELETE SET NULL,
    FOREIGN KEY ([TruckId]) REFERENCES [dbo].[Truck] ([Id]) ON DELETE SET NULL
);


GO

CREATE INDEX [IX_WorkOrder_DriverId] ON [dbo].[WorkOrder] ([DriverId])

GO

CREATE INDEX [IX_WorkOrder_TruckId] ON [dbo].[WorkOrder] ([TruckId])