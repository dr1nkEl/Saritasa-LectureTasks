CREATE TABLE [dbo].[task_verify_stack] (
    [taskVerifyID] BIGINT IDENTITY (1, 1) NOT NULL,
    [TaskId]       BIGINT NOT NULL,
    [UserId]       BIGINT NOT NULL,
    [IsVerified]   BIT    DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_task_verify_stack] PRIMARY KEY CLUSTERED ([taskVerifyID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_task_verify_stack_tasks] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID])
);

