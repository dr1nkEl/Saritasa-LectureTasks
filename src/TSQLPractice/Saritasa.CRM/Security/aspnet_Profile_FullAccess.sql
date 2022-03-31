CREATE ROLE [aspnet_Profile_FullAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Profile_FullAccess] ADD MEMBER [crmuser];

