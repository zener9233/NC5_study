SELECT ROWNUM
                ,A.MAJOR
                ,A.AR
                FROM 
                (
                SELECT
                SNO
                ,MAJOR
                ,AVG(RESULT) AS AR
                FROM STUDENT
                NATURAL JOIN SCORE
                GROUP BY SNO, MAJOR
                ORDER BY AR ASC
                        ) A
                WHERE ROWNUM <= 3;
SELECT
                SNO
                MAJOR
                ,AVG(RESULT) AS AR
                FROM STUDENT
                NATURAL JOIN SCORE
                GROUP BY SNO, MAJOR
SELECT * FROM STUDENT;

DROP SEQUENCE DEPT_CO_DNO_SEQ1;

CREATE SYNONYM DC
FOR DEPT_COPY1;

SELECT *
    FROM DC;

INSERT INTO EMP_PK1
VALUES(NULL, NULL, NULL, NULL, NULL, NULL, NULL);


ALTER TABLE DEPT
    ADD CONSTRAINT PK_DEP_DNO PRIMAY KET(DNO);

SELECT * FROM EMP;
