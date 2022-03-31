
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_tracks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_GetByTypeID
(

	@TypeID char (3)  
)
AS


				SELECT
					[trackID],
					[trackTypeID],
					[typeID]
				FROM
					[dbo].[document_tracks]
				WHERE
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


