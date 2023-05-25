CREATE TABLE BOARD
(
BOARD_NO NUMBER,
BOARD_TITLE VARCHAR(50)
);

CREATE TABLE BOARD_FILE
(
    BOARD_NO NUMBER,
    FILE_NM VARCHAR(50)
);

INSERT INTO BOARD_FILE VALUES(4, 'a');

SELECT *
    FROM BOARD_FILE;
    

SELECT A.*
    , NVL(B.FILE_NM, 'no file exist')
    FROM BOARD A
    INNER JOIN BOARD_FILE B
    ON A.BOARD_NO = B.BOARD_NO;
    
--2. INNER
SELECT SC.*
    ,ST.SNAME
    FROM SCORE SC
    INNER JOIN STUDENT ST
    ON SC.SNO = ST.SNO;
    
-- 모든 사원정보와 부서명 동시에 조회
 SELECT *
    FROM EMP SL
        INNER JOIN DEPT EN
        ON SL.DNO= EN.DNO;
    
    SELECT SC.*
        ,GR.GRADE
        FROM SCORE SC
        INNER JOIN SCGRADE GR
        ON SC.RESULT BETWEEN GR.LOSCORE AND GR.HISCORE;
        
        
    