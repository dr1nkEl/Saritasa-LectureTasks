
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_track_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_track_types_Get_List

AS


				
				SELECT
					[trackTypeID],
					[trackType]
				FROM
					[dbo].[lookup_track_types]
					
				SELECT @@ROWCOUNT
			


