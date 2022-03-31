
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LookupAddressTypes table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupAddressTypes_GetById
(

	@Id char (2)  
)
AS


				SELECT
					[Id],
					[Name]
				FROM
					[dbo].[LookupAddressTypes]
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT