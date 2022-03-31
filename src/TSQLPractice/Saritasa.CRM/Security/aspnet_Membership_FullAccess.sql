CREATE ROLE [aspnet_Membership_FullAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Membership_FullAccess] ADD MEMBER [crmuser];

