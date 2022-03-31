
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Chat table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_Find]
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@LastCommentBy int   = null ,

	@Text varchar (MAX)  = null ,

	@Top int   = null ,

	@Left int   = null ,

	@Minimize bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [LastCommentBy]
	, [Text]
	, [Top]
	, [Left]
	, [Minimize]
    FROM
	[dbo].[Chat]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([LastCommentBy] = @LastCommentBy OR @LastCommentBy IS NULL)
	AND ([Text] = @Text OR @Text IS NULL)
	AND ([Top] = @Top OR @Top IS NULL)
	AND ([Left] = @Left OR @Left IS NULL)
	AND ([Minimize] = @Minimize OR @Minimize IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [LastCommentBy]
	, [Text]
	, [Top]
	, [Left]
	, [Minimize]
    FROM
	[dbo].[Chat]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([LastCommentBy] = @LastCommentBy AND @LastCommentBy is not null)
	OR ([Text] = @Text AND @Text is not null)
	OR ([Top] = @Top AND @Top is not null)
	OR ([Left] = @Left AND @Left is not null)
	OR ([Minimize] = @Minimize AND @Minimize is not null)
	SELECT @@ROWCOUNT			
  END