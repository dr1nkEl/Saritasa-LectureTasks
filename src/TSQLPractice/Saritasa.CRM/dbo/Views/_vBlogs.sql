CREATE VIEW [dbo].[_vBlogs]
AS
    SELECT
        b.Id,
        b.UserId,
        b.CreatedAt,
        b.Title,
        b.Text,
        b.CommentBlogId,
        b.ParentCommentId,
        b.RemovedAt as 'RemovedAt',
        u.fullName as 'UserFullName',
        e.photo as 'UserPhoto',
        brc.pointCount as 'Rating',
        bcc.commentCount as 'CommentsCount',
        u.documentID AS UserDocumentId,
        dbo.phones.phone as 'UserSkype',
        dbo.emails.email as 'UserEmail'
    FROM
        dbo.Blogs AS b
        INNER JOIN dbo._vUsers AS u ON u.Id = b.UserId
        INNER JOIN dbo.Employees AS e ON e.Id = b.UserId
        LEFT OUTER JOIN (SELECT blogID, SUM(point) AS pointCount
                         FROM dbo.blogRatings
                         GROUP BY blogID) AS brc ON brc.blogID = b.Id
        LEFT OUTER JOIN (SELECT commentBlogID, COUNT(*) AS commentCount
                         FROM dbo.blogs
                         WHERE RemovedAt IS NULL
                         GROUP BY commentBlogID) AS bcc ON bcc.commentBlogID = b.Id
        left join dbo.phones on u.documentID = dbo.phones.targetID and dbo.phones.typeID = 'SKP'
        left join dbo.emails on u.documentID = dbo.emails.targetID and dbo.emails.typeID = 'P'
    WHERE b.RemovedAt IS NULL