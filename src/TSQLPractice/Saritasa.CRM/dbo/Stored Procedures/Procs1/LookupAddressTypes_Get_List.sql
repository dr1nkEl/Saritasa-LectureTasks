
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the LookupAddressTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupAddressTypes_Get_List

AS


				
				SELECT
					[Id],
					[Name]
				FROM
					[dbo].[LookupAddressTypes]
					
				SELECT @@ROWCOUNT