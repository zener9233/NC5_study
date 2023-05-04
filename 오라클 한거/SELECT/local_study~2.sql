DECLARE
    TYPE STU_ARRAY IS TABLE OF STUDENT%ROWTYPE
    INDEX BY PLS_INTEGER;

    STUARR STU_ARRAY;
BEGIN 
    STUARR(1).SNO := 20000 +1 ;
    STUARR(1).SNAME := 'B' ;
    STUARR(1).MAJOR := '소프트웨어';
    STUARR(1).SYEAR := 1;
    
      STUARR(2).SNO := 20000 +2 ;
    STUARR(2).SNAME := 'B'; 
    STUARR(2).MAJOR := '소프트웨어';
    STUARR(2).SYEAR := 2;
    
    STUARR(3).SNO := 20000 +3 ;
    STUARR(3).SNAME := 'B';
    STUARR(3).MAJOR := '소프트웨어';
    STUARR(3).SYEAR := 3;
    
    STUARR(10).SNO := 20000 +10 ;
    STUARR(10).SNAME := 'B';
    STUARR(10).MAJOR := '소프트웨어';
    STUARR(10).SYEAR := 4;
    
    DBMS_OUTPUT.PUTLINE(STUARR.EXISTS(4));
    DBMS_OUTPUT.PUTLINE(STUARR.COUNT);
    DBMS_OUTPUT.PUTLINE(STUARR.FIRST);
    DBMS_OUTPUT.PUTLINE(STUARR.LAST);
    DBMS_OUTPUT.PUTLINE(STUARR.PROIR(10));
    DBMS_OUTPUT.PUTLINE(STUARR.NEXT(1));
    
    STUARR.DELETE(3);
    DBMS_OUTPUT.PUTLINE(STUARR.EXISTS(3));
END;
/

SELECT *
FROM STUDENT_RECORD2
WHERE SNO LIKE '2000%';





DECLARE
        CURSOR CURST IS 
        SELECT SNO,
                SNAME,
                MAJOR,
                SYEAR
                FROM STUDENT
                WHERE SNO = '915301';
                
                TYPE STREC IS RECORD(
                SNO VARCHAR2(8),
                SNAME VARCHAR2(20),
                MAJOR VARCHAR2(20),
                SYEAR NUMBER(1,0)
                );
                STUREC STREC;
                BEGIN 
                OPEN CURSET;
                