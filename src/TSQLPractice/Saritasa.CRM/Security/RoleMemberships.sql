ALTER ROLE [db_owner] ADD MEMBER [version];


GO
ALTER ROLE [db_owner] ADD MEMBER [crmuser];


GO
ALTER ROLE [db_owner] ADD MEMBER [WINCRM\Administrator];


GO
ALTER ROLE [db_backupoperator] ADD MEMBER [backup];


GO
ALTER ROLE [db_datareader] ADD MEMBER [crmuserro];

