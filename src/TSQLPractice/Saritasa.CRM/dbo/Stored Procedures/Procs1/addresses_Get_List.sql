
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Addresses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[addresses_Get_List]

AS


				
				SELECT
					[addressID],
					[City],
					[State],
					[Country],
					[Zip],
					[TargetId],
					[TypeId],
					[Address],
					[Address2]
				FROM
					[dbo].[Addresses]
					
				SELECT @@ROWCOUNT