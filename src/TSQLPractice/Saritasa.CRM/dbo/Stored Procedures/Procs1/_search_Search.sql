
CREATE PROCEDURE [dbo].[_search_Search]
(
	@phrase varchar (255) = null,
	@type varchar (100) = null,
	@cacheTime int = null,
	@userid int = null
)
AS
BEGIN
    DECLARE @typeid char(3)
    SELECT @typeid = typeid FROM lookup_document_types WHERE typename = @type 
    
    -- Cannot determine document type
    IF @typeid IS NULL OR @phrase = '' RETURN

    -- If there is already result for the query
    DECLARE @searchID int
    DECLARE @cache int
    DECLARE @created DateTime
    SELECT @searchID = searchID, @created = created, @cache = cacheTime FROM search 
    WHERE searchPhrase = @phrase AND typeid = @typeid

    IF @searchID IS NOT NULL
    BEGIN

      -- ?????????, ??????? ?? ????? ????
      IF DATEDIFF(SECOND, @created, GETDATE()) <= @cache
      BEGIN

        -- ???? ???, ?? ?????????? ????????????? ????????? ??????
        SELECT @searchID
        RETURN
      END
      ELSE
      BEGIN

         -- ??????? ??????????? ?????? (? ??? ??????????), 
         -- ? ???????? ??????? ????? ???? 
         DELETE FROM search_results WHERE searchID = @searchID
         DELETE FROM search WHERE searchID = @searchID
      END
    END

    -- ???????? ?????????? ??? 
    -- ????????? ????? ??????
    INSERT INTO search (cacheTime, created, searchPhrase, userid, typeid)
    VALUES (@cacheTime, GETDATE(), @phrase, @userid, @typeid)

  SELECT @searchID = @@IDENTITY

   -- ???? ???? ??? ??????? ???? ??????????

    IF @type = 'Project' -- ???????
    BEGIN

      INSERT INTO search_results (title, description, searchID, documentid)      
      SELECT p.title, p.description, @searchID, p.documentid
      FROM projects AS p      
      WHERE p.title LIKE '%' + @phrase + '%' 		
		OR p.notes LIKE '%' + @phrase + '%'
		OR p.description LIKE '%' + @phrase + '%'

  END
   
    IF @type = 'Task' -- ??????
    BEGIN
      INSERT INTO search_results ( title, description, searchID, documentid)    
      SELECT t.title, t.tasktext, @searchID, t.documentid
      FROM tasks AS t      
	  WHERE t.tasktext LIKE '%' + @phrase + '%' 
		or t.title LIKE '%' + @phrase + '%'

    END

   IF @type = 'Contact' -- ????????
    BEGIN
     INSERT INTO search_results (title, description, searchID, documentid)  
     SELECT  u.FirstName +' '+u.LastName, u.Title, @searchID, u.DocumentId
     FROM users AS u       
      WHERE TypeId = 'C'
	  AND( u.Title LIKE '%' + @phrase + '%' 
		OR u.Firstname LIKE '%' + @phrase + '%' 
		OR u.Lastname LIKE '%' + @phrase + '%')		
    END
    
    IF @type = 'Resource' -- ???????
    BEGIN    
      INSERT INTO search_results (title, description, searchID, documentid)      
      SELECT u.FirstName +' '+u.LastName, u.Title, @searchID, u.DocumentId
      FROM  users AS u
      WHERE TypeID = 'E'
	  AND( u.Title LIKE '%' + @phrase + '%' 
		OR u.Firstname LIKE '%' + @phrase + '%' 
		OR u.Lastname LIKE '%' + @phrase + '%')		
    END    

    IF @type = 'Client' -- ???????
    BEGIN
      INSERT INTO search_results (title, description, searchID, documentid)      
      SELECT c.name, c.notes, @searchID, c.documentid
	  FROM clients AS c      
	  WHERE c.name LIKE '%' + @phrase + '%' 
    END

    IF @type = 'File' -- ?????
    BEGIN
      INSERT INTO search_results (title, description, searchID, documentid)      
      SELECT f.fileName, f.description, @searchID, f.documentid
     FROM files AS f      
      WHERE f.filename LIKE '%' + @phrase + '%'

    END

    IF @type = 'Note' -- ??????????
    BEGIN

      INSERT INTO search_results ( title, description, searchID, documentid)      
      SELECT 'Note #'+cast(n.noteID as varchar(6)), n.notetext, @searchID, n.documentid
      FROM notes AS n      
      WHERE n.notetext LIKE '%' + @phrase + '%'

    END
   SELECT @searchID
  RETURN
END
