--1) SCORE 테이블과 동일한 구조를 갖는 SCORE_CHK를 생성하고 RESULT 60이상 90이하만 입력 가능하도록 하세요.
CREATE TABLE SCORE_CHK(
    SNO NUMBER PRIMARY KEY,
    CNO NUMBER,
    RESULT NUMBER,
    CONSTRAINT CHK_SCORE_RESULT CHECK( RESULT BETWEEN 60 AND 90)
    );
SELECT * FROM SCORE_CHK;
--2) STUDENT 테이블과 동일한 구조를 갖는 STUDENT_COPY 테이블을 생성하면서 SNO은 PK로 SNAME은 NOT NULL로 SYEAR의 DEFAULT는 1로 
--   설정하세요.
CREATE TABLE STUDENT_COPY(
SNO NUMBER PRIMARY KEY,
SNAME VARCHAR2(20) NOT NULL,
SYEAR NUMBER DEFAULT 1
);

--3) COURSE 테이블과 동일한 구조를 갖는 COURSE_CONTSRAINT 테이블을 생성하면서 CNO, CNAME을 PK로 PNO은 PROFESSOR_PK의 PNO을 참조하여
--   FK로 설정하고 ST_NUM은 DEFAULT 2로 설정하세요.
CREATE TABLE COURSE_CONTSRAINT(
    CNO NUMBER PRIMARY KEY,
    CNAME VARCHAR2(20),
    ST_NUM NUMBER DEFAULT 2,
    PNO NUMBER,
    CONSTRAINT FK_COURSE_ST_NUM FOREIGN KEY(PNO)
        REFERENCES PROFESSOR_PK(PNO)
        );
        SELECT * FROM COURSE_CONTSRAINT;

--4) 다음 구조를 갖는 테이블을 생성하세요.
--   T                        T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트_SNS      위터                  3               30000                  2                  1
--                                                                               2                  2
CREATE TABLE T_SNS(
    SNS_NO NUMBER PRIMARY KEY,
    SNS_NM VARCHAR(20)
    );
    CREATE TABLE T_SNS_DETAIL(
    SNS_NO NUMBER PRIMARY KEY,
    SNS_BEN NUMBER,
    CONSTRAINT PK_SNS_NO PRIMARY KEY(SNS_NO)
    ,CONSTRAINT FK_SNS_NO FOREIGN KEY(SNS_NO)
    REFERENCES T_SNS(SNS_NO)
);
CREATE TABLE T_SNS_UPLOADED(
 SNS_NO NUMBER PRIMARY KEY,
 SNS_UPL_NO NUMBER,
  CONSTRAINT PK_SNS_UPL_NO PRIMARY KEY(SNS_UPL_NO)
  , CONSTRAINT FK_SNS_NO FOREIGN KEY(SNS_NO)
    REFERENCES T_SNS(SNS_NO)
    );
