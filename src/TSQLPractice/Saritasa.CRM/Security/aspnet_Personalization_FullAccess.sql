CREATE ROLE [aspnet_Personalization_FullAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Personalization_FullAccess] ADD MEMBER [crmuser];

