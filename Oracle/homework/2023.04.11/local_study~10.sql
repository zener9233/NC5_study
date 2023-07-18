--1) 학생중에 동명이인을 검색한다
SELECT *
    FROM STUDENT A
    JOIN  STUDENT B
   ON A.SNAME = B.SNAME
   WHERE A.SNO != B.SNO;
    

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT*
    FROM PROFESSOR A
    INNER JOIN COURSE C
    ON A.PNO = C.PNO
    JOIN SCORE D
    ON D.CNO = C.CNO
    JOIN STUDENT B
    ON B.SNO = D.SNO
    ORDER BY B.MAJOR;
    
    
    

--3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다
SELECT *
    FROM COURSE C
    LEFT JOIN PROFESSOR A
    ON A.PNO = C.PNO
    ORDER BY C.ST_NUM;
