
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the JiraMapping table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.JiraMapping_Update
(

	@Id bigint   ,

	@TypeId char (3)  ,

	@SourceId bigint   ,

	@DestinationId varchar (50)  ,

	@Instance varchar (20)  ,

	@LastUpdateTimestamp bigint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[JiraMapping]
				SET
					[TypeId] = @TypeId
					,[SourceId] = @SourceId
					,[DestinationId] = @DestinationId
					,[Instance] = @Instance
					,[LastUpdateTimestamp] = @LastUpdateTimestamp
				WHERE
[Id] = @Id