
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Users table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_GetByDepartmentId]
(

	@DepartmentId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[FirstName],
					[LastName],
					[Title],
					[DocumentId],
					[TypeId],
					[Birthday],
					[TimeZone],
					[TimeZoneCode],
					[Notes],
					[DepartmentId],
					[Utilization],
					[HideBirthday],
					[UtilizationPercent],
					[DepartmentUpdatedAt],
					[WorkTypeId],
					[VendorId]
				FROM
					[dbo].[Users]
				WHERE
					[DepartmentId] = @DepartmentId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON