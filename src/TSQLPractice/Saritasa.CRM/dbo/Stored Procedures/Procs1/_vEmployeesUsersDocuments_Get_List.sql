
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vEmployeesUsersDocuments view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vEmployeesUsersDocuments_Get_List

AS


				
				SELECT
					[UserId],
					[PreviousEmployment],
					[ContractSignedAt],
					[BranchId],
					[OnSite],
					[Comments],
					[photo],
					[SuperviserIds],
					[FirstName],
					[LastName],
					[FullName],
					[Title],
					[documentID],
					[generalStatusID],
					[created],
					[updated],
					[deleted],
					[createdBy],
					[updatedBy],
					[statusName],
					[colorCode],
					[Score],
					[Birthday],
					[timeZone],
					[timeZoneCode],
					[notes]
				FROM
					[dbo].[_vEmployeesUsersDocuments]
					
				SELECT @@ROWCOUNT