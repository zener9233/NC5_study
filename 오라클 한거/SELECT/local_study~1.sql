--1.PL/SQL
SET SERVEROUTPUT ON;

--1-6. 레코드
--레코드는 다양한 데이터타입의 변수를 갖는 데이터들의 집합(자바의 클래스에서 메소드만 빠진 형태랑 비슷)
DECLARE
    --레코드 선언부
    TYPE STU_REC IS RECORD(
        --사용할 다양한 데이터타입의 변수들 선언
        SNO VARCHAR2(8) NOT NULL := '11012',
        SNAME STUDENT.SNAME%TYPE,
        SEX STUDENT.SEX%TYPE,
        SYEAR NUMBER(1, 0) DEFAULT 1,
        MAJOR STUDENT.MAJOR%TYPE,
        AVR STUDENT.AVR%TYPE
    );
    
    --레코드 변수 선언
    STUDENTREC STU_REC;
BEGIN
    STUDENTREC.SNO := '11010';
    STUDENTREC.SNAME := '고기천';
    STUDENTREC.SEX := '남';
    STUDENTREC.MAJOR := '화학';
    STUDENTREC.AVR := 2.5;
    
    DBMS_OUTPUT.PUT_LINE(STUDENTREC.SNO);
    DBMS_OUTPUT.PUT_LINE(STUDENTREC.SNAME);
    DBMS_OUTPUT.PUT_LINE(STUDENTREC.SEX);
    DBMS_OUTPUT.PUT_LINE(STUDENTREC.MAJOR);
    DBMS_OUTPUT.PUT_LINE(STUDENTREC.SYEAR);
    DBMS_OUTPUT.PUT_LINE(STUDENTREC.AVR);
END;
/
    
--레코드를 이용해서 데이터 저장할 테이블 생성
CREATE TABLE STUDENT_RECORD2
AS SELECT * FROM STUDENT;
    
--레코드를 이용해서 데이터 저장
DECLARE
    TYPE STU_REC IS RECORD(
        --데이터가 저장될 테이블의 컬럼의 순서와 타입을 모두 동일하게 맞춰야 한다.
        SNO VARCHAR2(8) NOT NULL := '11012',
        SNAME STUDENT.SNAME%TYPE,
        SEX STUDENT.SEX%TYPE,
        SYEAR NUMBER(1, 0) DEFAULT 1,
        MAJOR STUDENT.MAJOR%TYPE,
        AVR STUDENT.AVR%TYPE
    );
    
    STUDENTREC STU_REC;
BEGIN
    STUDENTREC.SNO := '11011';
    STUDENTREC.SNAME := '문동주';
    STUDENTREC.SEX := '여';
    STUDENTREC.MAJOR := '컴공';
    STUDENTREC.AVR := 4.0;
    
    --인서트
    INSERT INTO STUDENT_RECORD2
    VALUES STUDENTREC;
END;
/

--저장된 데이터 확인
SELECT *
    FROM STUDENT_RECORD2
    WHERE SNO = '11011';

--레코드를 이용한 데이터 수정(UPDATE)
DECLARE
    TYPE STU_REC IS RECORD(
        --데이터가 저장될 테이블의 컬럼의 순서와 타입을 모두 동일하게 맞춰야 한다.
        SNO VARCHAR2(8) NOT NULL := '11012',
        SNAME STUDENT.SNAME%TYPE,
        SEX STUDENT.SEX%TYPE,
        SYEAR NUMBER(1, 0) DEFAULT 1,
        MAJOR STUDENT.MAJOR%TYPE,
        AVR STUDENT.AVR%TYPE
    );
    
    STUDENTREC STU_REC;
BEGIN
    STUDENTREC.SNO := '11011';
    STUDENTREC.SNAME := '문동주';
    STUDENTREC.SEX := '여';
    STUDENTREC.MAJOR := '생물';
    STUDENTREC.AVR := 3.7;
    STUDENTREC.SYEAR := 3;
    
    --데이터 수정
    UPDATE STUDENT_RECORD2
        SET
            --MAJOR = STUDENTREC.MAJOR,
            --AVR = STUDENTREC.AVR,
            --SYEAR = STUDENTREC.SYEAR
            ROW = STUDENTREC
        WHERE SNO = '11011';
END;
/ 
    
SELECT *
    FROM STUDENT_RECORD2
    WHERE SNO = '11011';
    
--레코드안에 레코드변수 선언
DECLARE
    TYPE SCORE_REC IS RECORD(
        CNO SCORE.CNO%TYPE,
        SNO SCORE.SNO%TYPE,
        RESULT SCORE.RESULT%TYPE
    );
    
    TYPE STU_REC IS RECORD(
        SNO VARCHAR2(8) NOT NULL := '11012',
        SNAME STUDENT.SNAME%TYPE,
        SEX STUDENT.SEX%TYPE,
        SYEAR NUMBER(1, 0) DEFAULT 1,
        MAJOR STUDENT.MAJOR%TYPE,
        AVR STUDENT.AVR%TYPE,
        SCOREREC SCORE_REC
    );
    
    STUDENTREC STU_REC;
BEGIN
    SELECT ST.SNO
         , ST.SNAME
         , ST.SEX
         , ST.SYEAR
         , ST.MAJOR
         , ST.AVR
         , SC.CNO
         , SC.SNO
         , SC.RESULT
        INTO STUDENTREC.SNO
           , STUDENTREC.SNAME
           , STUDENTREC.SEX
           , STUDENTREC.SYEAR
           , STUDENTREC.MAJOR
           , STUDENTREC.AVR
           , STUDENTREC.SCOREREC.CNO
           , STUDENTREC.SCOREREC.SNO
           , STUDENTREC.SCOREREC.RESULT
        FROM STUDENT ST
        JOIN SCORE SC
        ON ST.SNO = SC.SNO
        WHERE ST.SNO = '915601'
          AND SC.CNO = '2368';
        
        DBMS_OUTPUT.PUT_LINE(STUDENTREC.SNO);
        DBMS_OUTPUT.PUT_LINE(STUDENTREC.SNAME);
        DBMS_OUTPUT.PUT_LINE(STUDENTREC.SYEAR);
        DBMS_OUTPUT.PUT_LINE(STUDENTREC.MAJOR);
        DBMS_OUTPUT.PUT_LINE(STUDENTREC.AVR);
        DBMS_OUTPUT.PUT_LINE(STUDENTREC.SCOREREC.RESULT);
END;
/


DECLARE
        TYPE NUMBER_ARRAY IS TABLE OF NUMBER
        INDEX BY PLS_INTEGER;        
        NUM_NUMBER := 0;
    
    NUMARR NUMBER_ARRAY;
    BEGIN 
        LOOP
            NUM :=NUM+1;
            NUMARR(NUM) := NUM;
            EXIT WHEN NUM >5;
            END LOOP;
            DBMS_OUTPUT.PUT_LINE(NUMARR(1));
            DBMS_OUTPUT.PUT_LINE(NUMARR(2));
            DBMS_OUTPUT.PUT_LINE(NUMARR(3));
            DBMS_OUTPUT.PUT_LINE(NUMARR(4));
            DBMS_OUTPUT.PUT_LINE(NUMARR(5));
            END;
            /
            
            
    DECLARE
        TYPE STU_REC IS RECORD(
        SNO VARCHAR2(8) NOT NULL := '11012',
        SNAME STUDENT.SNAME%TYPE,
        SEX STUDENT.SEX%TYPE,
        SYEAR NUMBER(1, 0) DEFAULT 1,
        MAJOR STUDENT.MAJOR%TYPE,
        AVR STUDENT.AVR%TYPE
        );
        TYPE STUDENT_ARRAY IS TABLE OF STU_REC
        INDEX BY PLS_INTEGER;
        
        STUARR STUDENT_ARRAY;
        IDX NUMBER := 1;
        BEGIN
        LOOP
            STUARR(IDX).SNO := 10000 + IDX;
             STUARR(IDX).SNAME := 'A';
              STUARR(IDX).SYAER := MOD(IDX, 4)+1;
               STUARR(IDX).MAJOR := '컴공';
               
               INSERT INTO STUDENT_RECORD2
               VALUES STUARR(IDX);
               IDX := IDX +1 ;
               
               EXIT WHEN 
               
              END LOOP;
              END
              /
               
               DECLARE
                    TYPE STU_ARRAY IS TABLE OF STUDENT%ROWTYPE
                    INDEX BY PLS_INTEGER;
                    
                    IDX NUMBER := 1;
                    STUARR STU_ARRAY;
                    
                    BEGIN 
                        LOOP
                            STUARR(IDX).SNO := 20000 +IDX ;
                             STUARR(IDX).SNAME := 'B' || IDX;
                              STUARR(IDX).MAJOR := '소프트웨어';
                               STUARR(IDX).SYEAR := MOD(IDX, 4) +1;
                               
                               INSERT INTO STUDENT_RECORD2
                               VALUES STUARR(IDX);
                               
                               IDX := IDX+1;
                               EXIT WHEN IDX>10;
                               END LOOP
                               END;
                               /