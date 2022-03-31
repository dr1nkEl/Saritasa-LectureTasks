CREATE TABLE [dbo].[_patch_history] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [name]       VARCHAR (100) NOT NULL,
    [applied_at] DATETIME      NOT NULL,
    CONSTRAINT [_patch_history_PK] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);

