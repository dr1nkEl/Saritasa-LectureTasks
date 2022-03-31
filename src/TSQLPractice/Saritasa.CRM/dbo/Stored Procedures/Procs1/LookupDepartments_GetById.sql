
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LookupDepartments table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupDepartments_GetById
(

	@Id int   
)
AS


				SELECT
					[Id],
					[name],
					[utilization],
					[deleted]
				FROM
					[dbo].[LookupDepartments]
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT