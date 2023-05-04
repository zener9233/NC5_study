DECLARE 
    TYPE STU_REC IS RECORD(
        SNO VARCHAR2(5) NOT NULL := '11012',
        ;
        
        
        
        CREATE TABLE STUDENT_RECORD1
        AS SELECT *FROM STUDENT;
        
        SET SERVEROUTPUT ON;
        
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