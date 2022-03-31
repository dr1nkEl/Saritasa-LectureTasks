CREATE ROLE [aspnet_Roles_FullAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Roles_FullAccess] ADD MEMBER [crmuser];

