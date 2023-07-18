--1) SCORE 테이블과 동일한 구조를 갖는 SCORE_CHK를 생성하고 RESULT 60이상 90이하만 입력 가능하도록 하세요.
CREATE TABLE SCORE_CHK1(
    CNO NUMBER,
    SNO NUMBER,
    RESULT NUMBER,
    CONSTRAINT CHK_SCORE_RES1 CHECK(RESULT BETWEEN 60 AND 90)
);

INSERT INTO SCORE_CHK1
VALUES (1, 2, 91);

--2) STUDENT 테이블과 동일한 구조를 갖는 STUDENT_COPY 테이블을 생성하면서 SNO은 PK로 SNAME은 NOT NULL로 
--SYEAR의 DEFAULT는 1로 설정하세요.
CREATE TABLE STUDENT_COPY1(
    SNO NUMBER,
    SNAME VARCHAR2(20) NOT NULL,
    MAJOR VARCHAR2(10),
    SYEAR NUMBER(1) DEFAULT 1,
    CONSTRAINT PK_ST_SNO1 PRIMARY KEY(SNO)
);

INSERT INTO STUDENT_COPY1(
    SNO,
    SNAME,
    MAJOR
) VALUES (
    2,
    'B',
    NULL
);

SELECT *
    FROM STUDENT_COPY1;

--3) COURSE 테이블과 동일한 구조를 갖는 COURSE_CONTSRAINT 테이블을 생성하면서 CNO, CNAME을 PK로 
--PNO은 PROFESSOR_PK의 PNO을 참조하여 FK로 설정하고 ST_NUM은 DEFAULT 2로 설정하세요.
CREATE TABLE COURSE_CONSTRAINT1(
    CNO NUMBER,
    CNAME VARCHAR2(10),
    ST_NUMBER NUMBER(1) DEFAULT 2,
    PNO NUMBER,
    CONSTRAINT PK_COURSE_CONST_CNO_CNAME PRIMARY KEY(CNO, CNAME),
    CONSTRAINT FK_COURSE_CONST_PNO FOREIGN KEY(PNO)
        REFERENCES PROFESSOR_PK1(PNO)
);

SELECT *
    FROM PROFESSOR_PK1;
    
INSERT INTO PROFESSOR_PK1
VALUES (4, 'D', 'ENG', 'REGULAR', SYSDATE);

INSERT INTO COURSE_CONSTRAINT1(
    CNO,
    CNAME,
    PNO
) VALUES (
    4,
    'GRAMMER',
    4
);

SELECT *
    FROM COURSE_CONSTRAINT1;

--4) 다음 구조를 갖는 테이블을 생성하세요.
--   T_SNS                              T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트위터                  3               30000                  2                  1
--                                                                               2                  2
CREATE TABLE T_SNS1(
    SNS_NO NUMBER,
    SNS_NM VARCHAR2(20),
    CONSTRAINT PK_SNS_NO PRIMARY KEY(SNS_NO)
);

CREATE TABLE T_SNS_DETAIL1(
    SNS_NO NUMBER,
    SNS_BEN NUMBER(6),
    CONSTRAINT PK_SNS_DET_NO PRIMARY KEY(SNS_NO),
    CONSTRAINT FK_SNS_DET_NO FOREIGN KEY(SNS_NO)
        REFERENCES T_SNS1(SNS_NO)
);

CREATE TABLE T_SNS_UPLOADED1(
    SNS_NO NUMBER,
    SNS_UP_NO NUMBER,
    CONSTRAINT PK_SNS_UP_NO PRIMARY KEY(SNS_NO, SNS_UP_NO),
    CONSTRAINT FK_SNS_UP_NO FOREIGN KEY(SNS_NO)
        REFERENCES T_SNS1(SNS_NO)
);

INSERT INTO T_SNS1
VALUES(1, '페북');

INSERT INTO T_SNS_DETAIL1
VALUES (1, 3000);

INSERT INTO T_SNS_UPLOADED1
VALUES(1, 4);

SELECT * FROM
    T_SNS1;

SELECT * FROM
    T_SNS_DETAIL1;
    
SELECT * FROM
    T_SNS_UPLOADED1;

--1) 다음 구조를 갖는 테이블을 생성하세요.
--PRODUCT 테이블 - PNO NUMBER PK              : 제품번호
--                PNMAE VARCHAR2(50)          : 제품이름
--                PRI NUMBER                  : 제품단가
--PAYMENT 테이블 - MNO NUMBER PK              : 전표번호
--               PDATE DATE NOT NULL         : 판매일자
--                CNAME VARCHAR2(50) NOT NULL : 고객명
--                TOTAL NUMBER TOTAL > 0      : 총액
--PAYMENT_DETAIL - MNO NUMBER PK FK           : 전표번호
--                PNO NUMBER PK FK            : 제품번호
--                AMOUNT NUMBER NOT NULL      : 수량
--                PRICE NUMBER NOT NULL       : 단가
--                TOTAL_PRICE NUMBER NOT NULL TOTAL_PRICE > 0 : 금액

CREATE TABLE PRODUCT1(
    PNO NUMBER,
    PNAME VARCHAR2(50),
    PRI NUMBER,
    CONSTRAINT PK_PRO_PNO PRIMARY KEY(PNO)
);

CREATE TABLE PAYMENT1(
    MNO NUMBER,
    PDATE DATE NOT NULL,
    CNAME VARCHAR2(50) NOT NULL,
    TOTAL NUMBER,
    CONSTRAINT PK_PAY_MNO PRIMARY KEY(MNO),
    CONSTRAINT CHK_PAY_TOTAL CHECK(TOTAL > 0)
);

CREATE TABLE PAYMENT_DETAIL1(
    MNO NUMBER,
    PNO NUMBER,
    AMOUNT NUMBER NOT NULL,
    PRICE NUMBER NOT NULL,
    TOTAL_PRICE NUMBER NOT NULL,
    CONSTRAINT PK_PAY_DET_MPNO PRIMARY KEY(MNO, PNO),
    CONSTRAINT FK_PAY_DET_MNO FOREIGN KEY(MNO)
        REFERENCES PAYMENT1(MNO),
    CONSTRAINT FK_PAY_DET_PNO FOREIGN KEY(PNO)
        REFERENCES PRODUCT1(PNO),
    CONSTRAINT CHK_PAY_DET_TPRI CHECK(TOTAL_PRICE > 0)
);