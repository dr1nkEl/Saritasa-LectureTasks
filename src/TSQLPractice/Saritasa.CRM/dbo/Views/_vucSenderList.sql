CREATE VIEW dbo._vucSenderList
AS
SELECT dbo.documents.documentID, dbo.emails.email, dbo.documents.name, dbo.documents.typeID, dbo.lookup_document_types.typeName
FROM  dbo.documents INNER JOIN
               dbo.lookup_document_types ON dbo.documents.typeID = dbo.lookup_document_types.typeID LEFT OUTER JOIN
               dbo.emails ON dbo.documents.documentID = dbo.emails.targetID AND dbo.emails.typeID = 'P'
WHERE (dbo.documents.typeID IN ('UC', 'UE', 'C'))