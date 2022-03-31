
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_Insert]
(

	@Id int    OUTPUT,

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


				
				INSERT INTO [dbo].[Users]
					(
					[FirstName]
					,[LastName]
					,[Title]
					,[DocumentId]
					,[TypeId]
					,[Birthday]
					,[TimeZone]
					,[TimeZoneCode]
					,[Notes]
					,[DepartmentId]
					,[Utilization]
					,[HideBirthday]
					,[UtilizationPercent]
					,[DepartmentUpdatedAt]
					,[WorkTypeId]
					,[VendorId]
					)
				VALUES
					(
					@FirstName
					,@LastName
					,@Title
					,@DocumentId
					,@TypeId
					,@Birthday
					,@TimeZone
					,@TimeZoneCode
					,@Notes
					,@DepartmentId
					,@Utilization
					,@HideBirthday
					,@UtilizationPercent
					,@DepartmentUpdatedAt
					,@WorkTypeId
					,@VendorId
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()