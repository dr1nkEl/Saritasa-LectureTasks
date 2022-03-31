CREATE TABLE [dbo].[ProjectChangeOrders] (
    [changeOrderID]     INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]         INT           NOT NULL,
    [UserId]            INT           NOT NULL,
    [Hours]             INT           NOT NULL,
    [Description]       VARCHAR (MAX) NOT NULL,
    [MilestouneId]      INT           NOT NULL,
    [Created]           DATETIME      CONSTRAINT [DF_projectChangeOrders_created] DEFAULT (getdate()) NOT NULL,
    [OrderId]           INT           CONSTRAINT [DF_projectChangeOrders_orderID] DEFAULT ((0)) NOT NULL,
    [PaperworkRecieved] BIT           CONSTRAINT [DF_projectChangeOrders_paperworkRecieved] DEFAULT ((0)) NOT NULL,
    [Paid]              BIT           CONSTRAINT [DF_projectChangeOrders_paid] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_projectChangeOrders] PRIMARY KEY CLUSTERED ([changeOrderID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_projectChangeOrders_projectMilestones] FOREIGN KEY ([MilestouneId]) REFERENCES [dbo].[ProjectFinancialMilestones] ([Id]),
    CONSTRAINT [FK_projectChangeOrders_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_projectChangeOrders_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

