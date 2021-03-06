SELECT VS.SQL_ID, 
       VS.HASH_VALUE,
       VS.CHILD_NUMBER, 
       MAX(VS.LAST_ACTIVE_TIME),
       AVG(VS.CPU_TIME/VS.EXECUTIONS)/1000000 AS CPU_USED_SEC, 
	   AVG(VS.ELAPSED_TIME/VS.EXECUTIONS)/1000000 AS ELAPSED_SEC, 
       AVG(VS.BUFFER_GETS/VS.EXECUTIONS) AS BUFFER_GETS, 
       AVG(VS.DISK_READS/VS.EXECUTIONS) AS DISK_READS, 
       AVG(VS.SORTS/VS.EXECUTIONS) AS SORTS, 
       SUM(VS.EXECUTIONS) AS EXECS,
       AVG(VS.APPLICATION_WAIT_TIME/VS.EXECUTIONS)/1000000 AS APP_SEC,
       AVG(VS.USER_IO_WAIT_TIME/VS.EXECUTIONS)/1000000 AS ELAPSED_SEC,
       AVG(VS.CONCURRENCY_WAIT_TIME/VS.EXECUTIONS)/1000000 AS ELAPSED_SEC,
       VS.SQL_TEXT, 
       (SELECT LISTAGG(VALUE_STRING,', ') WITHIN GROUP(ORDER BY SQL_ID) 
        FROM V$SQL_BIND_CAPTURE VSB
        WHERE VS.SQL_ID = VSB.SQL_ID
        AND VS.HASH_VALUE = VSB.HASH_VALUE
        AND VS.CHILD_NUMBER = VSB.CHILD_NUMBER
        ) AS DATA_TYPE
FROM V$SQL VS 
WHERE PARSING_SCHEMA_NAME LIKE '%ADM'
AND EXECUTIONS > 0
AND SQL_TEXT NOT LIKE '/* SQL Analyze(1) */%'
AND LAST_ACTIVE_TIME > TRUNC(SYSDATE)-1
GROUP BY VS.SQL_ID, VS.SQL_TEXT, VS.HASH_VALUE, VS.CHILD_NUMBER
ORDER BY 1,2,3,4 DESC
--OFFSET 0 ROWS FETCH NEXT '50' ROWS ONLY;
