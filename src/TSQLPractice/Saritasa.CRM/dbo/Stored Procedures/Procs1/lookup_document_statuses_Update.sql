
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_document_statuses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_statuses_Update
(

	@StatusID int   ,

	@ColorCode char (6)  ,

	@StatusName varchar (60)  ,

	@TrackID int   ,

	@OrderBy int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_document_statuses]
				SET
					[colorCode] = @ColorCode
					,[statusName] = @StatusName
					,[trackID] = @TrackID
					,[orderBy] = @OrderBy
				WHERE
[statusID] = @StatusID 
				
			


