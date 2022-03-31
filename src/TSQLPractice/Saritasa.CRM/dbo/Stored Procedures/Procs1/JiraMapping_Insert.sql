
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the JiraMapping table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.JiraMapping_Insert
(

	@Id bigint    OUTPUT,

	@TypeId char (3)  ,

	@SourceId bigint   ,

	@DestinationId varchar (50)  ,

	@Instance varchar (20)  ,

	@LastUpdateTimestamp bigint   
)
AS


				
				INSERT INTO [dbo].[JiraMapping]
					(
					[TypeId]
					,[SourceId]
					,[DestinationId]
					,[Instance]
					,[LastUpdateTimestamp]
					)
				VALUES
					(
					@TypeId
					,@SourceId
					,@DestinationId
					,@Instance
					,@LastUpdateTimestamp
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()