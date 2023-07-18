--1) 송강 교수가 강의하는 과목을 검색한다
SELECT *
    FROM PROFESSOR A
    WHERE A.PNAME  = '송강';
    

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT *
    FROM PROFESSOR A
    JOIN COURSE B
    ON A.PNO = B.PNO
    WHERE B.CNAME LIKE '%화학%';
    

--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT 
   *
    FROM PROFESSOR A
    JOIN COURSE B
    ON A.PNO = B.PNO
     WHERE B.ST_NUM = '2';

--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT *
    FROM PROFESSOR A
    JOIN COURSE C
    ON A.PNO = C.PNO
    WHERE A.SECTION = '화학';
    

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT *
    FROM STUDENT A
    JOIN SCORE B
    ON A.SNO = B.SNO
    WHERE A.MAJOR ='화학';
    

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT *
    FROM SCORE A
    JOIN COURSE B
    ON A.CNO = B.CNO
    WHERE B.CNAME ='일반화학';
    

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT *
    FROM SCORE A
    JOIN COURSE B
    ON A.CNO=B.CNO
    JOIN STUDENT C
    ON C.SNO = A.SNO
    WHERE C.SYEAR = '1'
    AND B.CNAME = '일반화학';
    

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT *
        FROM SCORE A
    JOIN COURSE B
    ON A.CNO=B.CNO
    JOIN STUDENT C
    ON C.SNO = A.SNO
    WHERE C.SYEAR = '1'
    AND C.MAJOR = '화학';
    

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT *
        FROM SCORE A
    JOIN COURSE B
    ON A.CNO=B.CNO
    JOIN STUDENT C
    ON C.SNO = A.SNO
    INNER JOIN SCGRADE D
        ON A.RESULT BETWEEN D.LOSCORE AND D.HISCORE
        WHERE D.GRADE ='F';
        

