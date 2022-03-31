
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Users table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_Find]
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@FirstName varchar (100)  = null ,

	@LastName varchar (150)  = null ,

	@Title varchar (100)  = null ,

	@DocumentId bigint   = null ,

	@TypeId char (2)  = null ,

	@Birthday datetime   = null ,

	@TimeZone smallint   = null ,

	@TimeZoneCode varchar (100)  = null ,

	@Notes varchar (MAX)  = null ,

	@DepartmentId int   = null ,

	@Utilization bit   = null ,

	@HideBirthday bit   = null ,

	@UtilizationPercent int   = null ,

	@DepartmentUpdatedAt datetime   = null ,

	@WorkTypeId int   = null ,

	@VendorId int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [FirstName]
	, [LastName]
	, [Title]
	, [DocumentId]
	, [TypeId]
	, [Birthday]
	, [TimeZone]
	, [TimeZoneCode]
	, [Notes]
	, [DepartmentId]
	, [Utilization]
	, [HideBirthday]
	, [UtilizationPercent]
	, [DepartmentUpdatedAt]
	, [WorkTypeId]
	, [VendorId]
    FROM
	[dbo].[Users]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([FirstName] = @FirstName OR @FirstName IS NULL)
	AND ([LastName] = @LastName OR @LastName IS NULL)
	AND ([Title] = @Title OR @Title IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([Birthday] = @Birthday OR @Birthday IS NULL)
	AND ([TimeZone] = @TimeZone OR @TimeZone IS NULL)
	AND ([TimeZoneCode] = @TimeZoneCode OR @TimeZoneCode IS NULL)
	AND ([Notes] = @Notes OR @Notes IS NULL)
	AND ([DepartmentId] = @DepartmentId OR @DepartmentId IS NULL)
	AND ([Utilization] = @Utilization OR @Utilization IS NULL)
	AND ([HideBirthday] = @HideBirthday OR @HideBirthday IS NULL)
	AND ([UtilizationPercent] = @UtilizationPercent OR @UtilizationPercent IS NULL)
	AND ([DepartmentUpdatedAt] = @DepartmentUpdatedAt OR @DepartmentUpdatedAt IS NULL)
	AND ([WorkTypeId] = @WorkTypeId OR @WorkTypeId IS NULL)
	AND ([VendorId] = @VendorId OR @VendorId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [FirstName]
	, [LastName]
	, [Title]
	, [DocumentId]
	, [TypeId]
	, [Birthday]
	, [TimeZone]
	, [TimeZoneCode]
	, [Notes]
	, [DepartmentId]
	, [Utilization]
	, [HideBirthday]
	, [UtilizationPercent]
	, [DepartmentUpdatedAt]
	, [WorkTypeId]
	, [VendorId]
    FROM
	[dbo].[Users]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([FirstName] = @FirstName AND @FirstName is not null)
	OR ([LastName] = @LastName AND @LastName is not null)
	OR ([Title] = @Title AND @Title is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([Birthday] = @Birthday AND @Birthday is not null)
	OR ([TimeZone] = @TimeZone AND @TimeZone is not null)
	OR ([TimeZoneCode] = @TimeZoneCode AND @TimeZoneCode is not null)
	OR ([Notes] = @Notes AND @Notes is not null)
	OR ([DepartmentId] = @DepartmentId AND @DepartmentId is not null)
	OR ([Utilization] = @Utilization AND @Utilization is not null)
	OR ([HideBirthday] = @HideBirthday AND @HideBirthday is not null)
	OR ([UtilizationPercent] = @UtilizationPercent AND @UtilizationPercent is not null)
	OR ([DepartmentUpdatedAt] = @DepartmentUpdatedAt AND @DepartmentUpdatedAt is not null)
	OR ([WorkTypeId] = @WorkTypeId AND @WorkTypeId is not null)
	OR ([VendorId] = @VendorId AND @VendorId is not null)
	SELECT @@ROWCOUNT			
  END