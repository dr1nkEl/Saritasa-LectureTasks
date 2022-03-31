
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the document_tracks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_Get_List

AS


				
				SELECT
					[trackID],
					[trackTypeID],
					[typeID]
				FROM
					[dbo].[document_tracks]
					
				SELECT @@ROWCOUNT
			


