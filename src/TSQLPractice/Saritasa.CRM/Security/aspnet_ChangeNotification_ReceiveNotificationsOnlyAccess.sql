CREATE ROLE [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess] ADD MEMBER [crmuser];

