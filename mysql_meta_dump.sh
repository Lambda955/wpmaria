# Index meta dump

mysql> tee indexmeata_dump.sql

SELECT
CONCAT(
'ALTER TABLE ' ,
TABLE_NAME,
' ',
'ADD ',
IF(NON_UNIQUE = 1,
CASE UPPER(INDEX_TYPE)
WHEN 'FULLTEXT' THEN 'FULLTEXT INDEX'
WHEN 'SPATIAL' THEN 'SPATIAL INDEX'
ELSE CONCAT('INDEX ',
INDEX_NAME,
' USING ',
INDEX_TYPE
)
END,
IF(UPPER(INDEX_NAME) = 'PRIMARY',
CONCAT('PRIMARY KEY USING ',
INDEX_TYPE
),
CONCAT('UNIQUE INDEX ',
INDEX_NAME,
' USING ',
INDEX_TYPE
)
)
),
'(',
GROUP_CONCAT(
DISTINCT
CONCAT('', COLUMN_NAME, '')
ORDER BY SEQ_IN_INDEX ASC
SEPARATOR ', '
),
');'
) AS 'Show_Add_Indexes'
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'sakila'
GROUP BY TABLE_NAME, INDEX_NAME
ORDER BY TABLE_NAME ASC, INDEX_NAME ASC;

mysql> notee

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Table meta dump : option -d (nodata)
=======
# Table meta dump
>>>>>>> origin/master
=======
# Table meta dump
>>>>>>> origin/master
=======
# Table meta dump
>>>>>>> origin/master
$ mysqldump -d -f -u<username> -p<password> -h <hostname> <dbname> > metadump.sql
