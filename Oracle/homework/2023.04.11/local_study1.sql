UPDATE EMP_COPY1
    SET
        COMM = COMM*3
        WHERE ENO ='3005';
        SELECT *
            FROM PROFESSOR;
        UPDATE PROFESSOR
        SET
        HIREDATE = ADD_MONTHS (HIREDATE, 20*12);
        
        CREATE TABLE DEPT_COPY
        AS SELECT * FROM DEPT;
        CREATE TABLE EMP_COPY
        AS SELECT* FROM EMP;
        UPDATE DEPT_COPY
        SET (DNO, DNAME, LOC) = (
                SELECT DNO,
                        DNAME
                        ,LOC
                        FROM DEPT
                        WHERE DNO = '50'
                        )
                        WHERE DNO IN ('20', '30');
                        
                UPDATE DEPT_COPY
                SET DIRECTOR=(
                SELECT ENO
                            FROM EMP_COPY
                            WHERE SAL =( SELECT MAX(SAL) FROM EMP)
                    )
                    WHERE DNO ='40';
                    ;
                    DELETE FROM EMP_COPY;
                    SELECT * FROM EMP_COPY;
                    
                    DELETE FROM EMP_COPY 
                    WHERE JOB = '지원';
                    
                    
    CREATE TABLE ST_COPY
    AS SELECT * FROM STUDENT;
          
          
          DELETE FROM ST_COPY
          WHERE SNO IN(
            SELECT SNO
            FROM SCORE
            GROUP BY SNO
            HAVING AVG(RESULT) >= 60
            );
            
            CREATE TABLE SCORE_COPY
            AS SELECT * FROM SCORE;
            
            DROP TABLE SCORE_COPY;
            RENAME EMP_COPY TO EMP_TMEP1;
            