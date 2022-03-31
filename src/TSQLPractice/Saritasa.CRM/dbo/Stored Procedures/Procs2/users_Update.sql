
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_Update]
(

	@Id int   ,

	@FirstName varchar (100)  ,

	@LastName varchar (150)  ,

	@Title varchar (100)  ,

	@DocumentId bigint   ,

	@TypeId char (2)  ,

	@Birthday datetime   ,

	@TimeZone smallint   ,

	@TimeZoneCode varchar (100)  ,

	@Notes varchar (MAX)  ,

	@DepartmentId int   ,

	@Utilization bit   ,

	@HideBirthday bit   ,

	@UtilizationPercent int   ,

	@DepartmentUpdatedAt datetime   ,

	@WorkTypeId int   ,

	@VendorId int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Users]
				SET
					[FirstName] = @FirstName
					,[LastName] = @LastName
					,[Title] = @Title
					,[DocumentId] = @DocumentId
					,[TypeId] = @TypeId
					,[Birthday] = @Birthday
					,[TimeZone] = @TimeZone
					,[TimeZoneCode] = @TimeZoneCode
					,[Notes] = @Notes
					,[DepartmentId] = @DepartmentId
					,[Utilization] = @Utilization
					,[HideBirthday] = @HideBirthday
					,[UtilizationPercent] = @UtilizationPercent
					,[DepartmentUpdatedAt] = @DepartmentUpdatedAt
					,[WorkTypeId] = @WorkTypeId
					,[VendorId] = @VendorId
				WHERE
[Id] = @Id