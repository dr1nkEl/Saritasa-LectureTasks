
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_document_statuses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_statuses_Insert
(

	@StatusID int    OUTPUT,

	@ColorCode char (6)  ,

	@StatusName varchar (60)  ,

	@TrackID int   ,

	@OrderBy int   
)
AS


				
				INSERT INTO [dbo].[lookup_document_statuses]
					(
					[colorCode]
					,[statusName]
					,[trackID]
					,[orderBy]
					)
				VALUES
					(
					@ColorCode
					,@StatusName
					,@TrackID
					,@OrderBy
					)
				
				-- Get the identity value
				SET @StatusID = SCOPE_IDENTITY()
									
							
			


