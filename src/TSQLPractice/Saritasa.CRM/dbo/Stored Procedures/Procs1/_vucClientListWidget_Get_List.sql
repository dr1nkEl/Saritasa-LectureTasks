
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucClientListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucClientListWidget_Get_List

AS


				
				SELECT
					[documentID],
					[clientID],
					[name],
					[contractTill],
					[notifiedContractTill],
					[email],
					[deleted],
					[parentClientID],
					[generalStatusID],
					[projectID],
					[title],
					[ACMManagerUserID],
					[ACMManageFirstName],
					[ACMManagerLastName],
					[ACMManagerFullName],
					[ACMManagerDocID],
					[SManagerUserID],
					[SManageFirstName],
					[SManagerLastName],
					[SManagerFullName],
					[SManagerDocID],
					[PManagerUserID],
					[PManagerFirstName],
					[PManagerLastName],
					[PManagerFullName],
					[PManagerDocID],
					[projectDocID]
				FROM
					[dbo].[_vucClientListWidget]
					
				SELECT @@ROWCOUNT			
			


