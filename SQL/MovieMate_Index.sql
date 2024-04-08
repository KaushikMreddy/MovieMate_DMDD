use MovieMate3

CREATE NONCLUSTERED INDEX IDX_Movie_Genre ON Movie(Genre);

CREATE NONCLUSTERED INDEX IDX_Movie_ReleaseDate ON Movie(Release_Date);

CREATE NONCLUSTERED INDEX IDX_Movie_Rating ON Movie(Rating);

CREATE NONCLUSTERED INDEX IDX_City_State
ON City(State);


-- checking the nonclustered index

SELECT 
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    COL_NAME(ic.object_id, ic.column_id) AS ColumnName
FROM 
    sys.tables AS t
INNER JOIN 
    sys.indexes AS i ON t.object_id = i.object_id
INNER JOIN 
    sys.index_columns AS ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
WHERE 
    i.type = 2  -- 2 = Non-clustered index
    AND (t.name = 'Movie' OR t.name = 'City');