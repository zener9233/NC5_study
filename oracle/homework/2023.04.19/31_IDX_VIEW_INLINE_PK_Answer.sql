--1) 어제 만든 SCORE_STGR 테이블의 SNO 컬럼에 INDEX를 추가하세요.
CREATE INDEX STGR_SNO_IDX1
    ON SCORE_STGR1(SNO);

--2) 어제 만든 ST_COURSEPF 테이블의 SNO, CNO, PNO 다중 컬럼에 INDEX를 추가하세요.
CREATE INDEX STCOPF_SCPNO_IDX1
    ON ST_COURSEPF1(SNO, CNO, PNO);

--뷰 이름은 자유
--1) 학생의 평점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_CONVERT_AVR1(
    SNO,
    SNAME,
    MAJOR,
    SYEAR,
    CONAVR
) AS (
    SELECT SNO
         , SNAME
         , MAJOR
         , SYEAR
         , ROUND(AVR * 1.125, 2)
        FROM STUDENT
);

SELECT *   
    FROM V_CONVERT_AVR1;

--2) 각 과목별 기말고사 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_AVG_RESULT1(
    CNO
  , CNAME
  , AVGRES
) AS (
    SELECT CNO
         , C.CNAME
         , ROUND(AVG(SC.RESULT), 2)
        FROM SCORE SC
        NATURAL JOIN COURSE C
        GROUP BY CNO, C.CNAME
);

SELECT *
    FROM V_AVG_RESULT1;

--3) 각 사원과 관리자(MGR)의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_EMP_MGR1(
    ENO
  , ENAME
  , MGR
  , MGR_NAME
  , JOB
  , HDATE
) AS (
    SELECT E.ENO
         , E.ENAME
         , E.MGR
         , EM.ENAME
         , E.JOB
         , E.HDATE
        FROM EMP E
        JOIN EMP EM
        ON E.MGR = EM.ENO
);

SELECT *
    FROM V_EMP_MGR1;

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_SC_GR1(
    CNO
  , CNAME
  , SNO
  , SNAME
  , MAJOR
  , SYEAR
  , RESULT
  , GRADE
) AS (
    SELECT CNO
         , C.CNAME
         , SNO
         , ST.SNAME
         , ST.MAJOR
         , ST.SYEAR
         , SC.RESULT
         , SG.GRADE
        FROM SCORE SC
        NATURAL JOIN COURSE C
        NATURAL JOIN STUDENT ST
        JOIN SCGRADE SG
        ON SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE
);

SELECT *
    FROM V_SC_GR1;

--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_PHY_PRO1(
    PNO
  , PNAME
  , CNO
  , CNAME
  , SNO
  , SNAME
) AS (
    SELECT PNO
         , P.PNAME
         , CNO
         , C.CNAME
         , SNO
         , ST.SNAME
        FROM SCORE SC
        NATURAL JOIN COURSE C
        NATURAL JOIN PROFESSOR P
        NATURAL JOIN STUDENT ST
        WHERE P.SECTION = '물리'
);

SELECT * 
    FROM V_PHY_PRO1;
    
--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT ROWNUM
     , A.SNO
     , A.SNAME
     , A.CONAVR
    FROM (
            SELECT SNO
                 , SNAME
                 , ROUND(AVR * 1.125, 2) AS CONAVR
                FROM STUDENT
                ORDER BY ROUND(AVR * 1.125, 2) DESC
          ) A
    WHERE ROWNUM <= 3;

--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT ROWNUM
     , A.CNO
     , A.CNAME
     , A.AVGRES
    FROM (
            SELECT CNO
                 , C.CNAME
                 , ROUND(AVG(SC.RESULT), 2) AS AVGRES
                FROM COURSE C
                NATURAL JOIN SCORE SC
                GROUP BY CNO, C.CNAME
                ORDER BY ROUND(AVG(SC.RESULT), 2) DESC
         ) A
    WHERE ROWNUM <= 3;

--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT ROWNUM
     , A.MAJOR
     , A.SYEAR
     , A.AVGRES
    FROM (
            SELECT ST.MAJOR
                 , ST.SYEAR
                 , ROUND(AVG(SC.RESULT), 2) AS AVGRES
                FROM SCORE SC
                JOIN STUDENT ST
                ON SC.SNO = ST.SNO
                GROUP BY ST.MAJOR, ST.SYEAR
                ORDER BY ROUND(AVG(SC.RESULT), 2) DESC
         ) A
    WHERE ROWNUM <= 3;

--4) 기말고사 성적 평균이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM
     , A.CNO
     , A.CNAME
     , A.PNO
     , A.PNAME
     , A.AVGRES
    FROM (
            SELECT CNO
                 , C.CNAME
                 , PNO
                 , P.PNAME
                 , ROUND(AVG(SC.RESULT) , 2) AS AVGRES
                FROM SCORE SC
                NATURAL JOIN COURSE C
                NATURAL JOIN PROFESSOR P
                GROUP BY CNO, C.CNAME, PNO, P.PNAME
                ORDER BY ROUND(AVG(SC.RESULT) , 2) DESC
         ) A
    WHERE ROWNUM <= 3;

--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.
SELECT P.PNO
     , P.PNAME
     , COUNT(*)
    FROM SCORE SC
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    JOIN COURSE C
    ON C.CNO = SC.CNO
    JOIN PROFESSOR P
    ON P.PNO = C.PNO
    GROUP BY P.PNO, P.PNAME;

--1) CNO이 PK인 COURSE_PK 테이블을 생성하세요.(1번 방식으로)
CREATE TABLE COURSE_PK3(
    CNO NUMBER PRIMARY KEY,
    CNAME VARCHAR2(20),
    ST_NUM NUMBER(1),
    PNO NUMBER
);

--2) PNO이 PK인 PROFESSOR_PK 테이블을 생성하세요.(2번 방식으로)
CREATE TABLE PROFESSOR_PK(
    PNO NUMBER,
    PNAME VARCHAR2(20),
    SECTION VARCHAR2(10),
    ORDERS VARCHAR2(10),
    HIREDATE DATE,
    CONSTRAINT PK_PF_PNO1 PRIMARY KEY(PNO)
);

--3) PF_TEMP 테이블에 PNO을 PK로 추가하세요.
ALTER TABLE PF_TEMP
    DROP PRIMARY KEY;
    
ALTER TABLE PF_TEMP
    ADD CONSTRAINT PK_PT_PNO PRIMARY KEY(PNO);

--4) COURSE_PROFESSOR 테이블에 CNO, PNO을 PK로 추가하세요.
ALTER TABLE COURSE_PROFESSOR
    DROP PRIMARY KEY;
    
ALTER TABLE COURSE_PROFESSOR
    ADD CONSTRAINT PK_CP_CPNO PRIMARY KEY(CNO, PNO);

--5) BOARD_NO(NUMBER)를 PK로 갖으면서 BOARD_TITLE(VARCHAR2(200)), BOARD_CONTENT(VARCHAR2(2000)), 
--   BOARD_WRITER(VARCHAR2(20)), BOARD_FRGT_DATE(DATE), BOARD_LMDF_DATE(DATE) 컬럼을 갖는 T_BOARD 테이블을 생성하세요.
DROP TABLE T_BOARD;

CREATE TABLE T_BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200),
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_WRITER VARCHAR2(20),
    BOARD_FRGT_DATE DATE,
    BOARD_LMDF_DATE DATE
);

--6) BOARD_NO(NUMBER), BOARD_FILE_NO(NUMBER)를 PK로 갖으면서 BOARD_FILE_NM(VARCHAR2(200)), BOARD_FILE_PATH(VARCHAR2(2000)),
--   ORIGIN_FILE_NM(VARCHAR2(200)) 컬럼을 갖는 T_BOARD_FILE 테이블을 생성하세요.
DROP TABLE T_BOARD_FILE;

CREATE TABLE T_BOARD_FILE(
    BOARD_NO NUMBER,
    BOARD_FILE_NO NUMBER,
    BOARD_FILE_NM VARCHAR2(200),
    BOARD_FILE_PATH VARCHAR2(2000),
    ORIGIN_FILE_NM VARCHAR2(200),
    CONSTRAINT PK_BF_BOARD_FILE_NO PRIMARY KEY(BOARD_NO, BOARD_FILE_NO)
);