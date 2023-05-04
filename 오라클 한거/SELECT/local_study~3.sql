--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.
SELECT * FROM(
SELECT ROWNUM
        , A.SNO
        , A.SNAME
        , A. AR
        FROM 
        (
        SELECT
        SNO
        ,SNAME
        ,(AVR/4*4.5) AS AR
        FROM STUDENT
        ) A
        ORDER BY AR DESC
        )
        WHERE ROWNUM<=3;
        

--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT * FROM(
SELECT ROWNUM
            ,A.CNO
            , A.CNAME
            , A. AR
            FROM(
SELECT 
        CNO
        ,CNAME
        ,AVG(RESULT) AS AR
        FROM SCORE
        NATURAL JOIN COURSE
        GROUP BY CNO, CNAME
        ORDER BY AR DESC
        ) A
        )
        WHERE ROWNUM <= 3;
        


--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT * FROM(
SELECT ROWNUM
        ,A.MAJOR
        ,A.SYEAR
        , A.AR
        FROM
( 
SELECT MAJOR
        , SYEAR
        , AVG(RESULT) AS AR
        FROM STUDENT
        NATURAL JOIN SCORE
        GROUP BY MAJOR, SYEAR
        ORDER BY AR DESC
        
        ) A
)
WHERE ROWNUM <= 3;
--4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT*
    FROM (
    SELECT ROWNUM 
    ,A.PNAME
    ,A.AR
    FROM(
    SELECT 
    PNAME
    ,CNO
    ,AVG(RESULT) AS AR
    FROM SCORE
    NATURAL JOIN COURSE
    NATURAL JOIN PROFESSOR
    GROUP BY PNAME , CNO
    ORDER BY AR DESC
    ) A
    )
    WHERE ROWNUM <= 3;
    
    

--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.
 SELECT 
    PNAME
    ,COUNT(SNO) AS CO
    FROM PROFESSOR
    NATURAL JOIN COURSE
    NATURAL JOIN STUDENT
    GROUP BY PNAME;

SELECT PNAME, SNAME FROM PROFESSOR NATURAL JOIN STUDENT WHERE PNAME = '송강';