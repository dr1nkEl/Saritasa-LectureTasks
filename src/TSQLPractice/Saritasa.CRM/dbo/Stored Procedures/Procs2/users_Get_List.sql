
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Users table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_Get_List]

AS


				
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
					
				SELECT @@ROWCOUNT