CREATE ROLE [aspnet_WebEvent_FullAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_WebEvent_FullAccess] ADD MEMBER [crmuser];

