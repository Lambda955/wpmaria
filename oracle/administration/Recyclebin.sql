
SELECT OWNER, OBJECT_NAME, ORIGINAL_NAME, DROPTIME, DROPSCN 
FROM DBA_RECYCLEBIN
WHERE ORIGINAL_NAME LIKE 'TIM%'
AND DROPSCN > 32834808
ORDER BY 5 DESC
 
 
SELECT * FROM DMSADM."BIN$bVO1nGrldxjgU3UBRAqXJg==$0"

SELECT 'TRUNCATE table ' || OWNER || '.' || OBJECT_NAME ||';'
FROM DBA_OBJECTS
WHERE OWNER = 'DMSADM'
AND OBJECT_TYPE = 'TABLE'
AND OBJECT_NAME LIKE 'TIM_%'

INSERT INTO DMSADM.TIM_TN_MENU (SELECT * FROM DMSADM."BIN$bVO1nGqCdxjgU3UBRAqXJg==$0");

SELECT 'INSERT INTO ' ||OWNER|| '.' ||ORIGINAL_NAME|| 
       ' (SELECT * FROM ' ||OWNER||'."'||OBJECT_NAME|| '");'
FROM DBA_RECYCLEBIN
WHERE ORIGINAL_NAME LIKE 'TIM%'
AND DROPSCN > 32834808
AND ORIGINAL_NAME NOT LIKE '%PK'
AND ORIGINAL_NAME NOT LIKE '%UK%'
AND ORIGINAL_NAME NOT LIKE '%IDX%'
AND ORIGINAL_NAME NOT LIKE '%U0%'
ORDER BY DROPSCN DESC;
 

--------------------------------------------------------------------
--Restoring Tables from the Recycle Bin Use the FLASHBACK TABLE

FLASHBACK TABLE int_admin_emp TO BEFORE DROP 
RENAME TO int2_admin_emp;

SELECT object_name, original_name, createtime FROM recyclebin;    

OBJECT_NAME                    ORIGINAL_NAME   CREATETIME
------------------------------ --------------- -------------------
BIN$yrMKlZaLMhfgNAgAIMenRA==$0 INT2_ADMIN_EMP  2006-02-05:21:05:52
BIN$yrMKlZaVMhfgNAgAIMenRA==$0 INT2_ADMIN_EMP  2006-02-05:21:25:13
BIN$yrMKlZaQMhfgNAgAIMenRA==$0 INT2_ADMIN_EMP  2006-02-05:22:05:53

FLASHBACK TABLE BIN$yrMKlZaVMhfgNAgAIMenRA==$0 TO BEFORE DROP;


