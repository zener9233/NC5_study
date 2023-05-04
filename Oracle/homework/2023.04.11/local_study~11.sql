--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT *
    FROM COURSE C
    INNER JOIN PROFESSOR B
    ON C.PNO = B.PNO;
    

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT *
    FROM STUDENT A
    INNER JOIN SCORE B
    ON A.SNO = B.SNO
    WHERE A.MAJOR = '화학';

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT *
    FROM STUDENT A
    JOIN SCORE B
    ON A.SNO = B.SNO
    INNER JOIN COURSE C
    ON B.CNO = C.CNO
    WHERE C.CNAME = '유기화학';

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT *
    FROM STUDENT A
    JOIN SCORE B
    ON A.SNO = B.SNO
    INNER JOIN COURSE C
    ON B.CNO = C.CNO
    JOIN PROFESSOR D
    ON D.PNO = C.PNO
    WHERE A.MAJOR = '화학';
    

--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT *
    FROM PROFESSOR A
    LEFT JOIN COURSE B
    ON B.PNO = A.PNO;
    


--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)

SELECT *
    FROM PROFESSOR A
    FULL JOIN COURSE B
    ON B.PNO = A.PNO;
   
