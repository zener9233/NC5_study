-- 10. 사이값을 찾아주는 BETWEEN AND절
--급여가 3500에서 5000사이에 있는 직원목록 조회
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 3500 AND 5000;
--급여가 3500에서 5000사이에 있고 부서번호가 1~10인 직원목록 조회
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 3500 AND 5000
        AND DNO BETWEEN '01'AND'10';
--TO_DATE사용해서 임용일자가 1994년 1월 1일 이후1998년 2월 3일 이전인 교수목록
SELECT *
    FROM PROFESSOR
    WHERE HIREDATE BETWEEN 
            TO_DATE ('19940101 00:0:00', 'YYYYMMDD HH24:MI:SS')
            AND TO_DATE ('19980202 23:59:59', 'YYYYMMDD HH24:MI:SS');
--DNO = 10, 20,30 직원목록 조회
SELECT *
    FROM EMP
    WHERE DNO = '10'
        OR DNO = '20'
        OR DNO = '30';
--IN절로 변환
SELECT *
    FROM EMP
    WHERE DNO IN('10','20','30');
--DATE 표시 형식 지정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY,MM/DD HH24:MI:SS';
--11. 여러개의 데이터를 비교해주는 in절
SELECT *
    FROM STUDENT
    WHERE SYEAR IN('1','2','3')
    AND MAJOR IN('화학','물리');
    
-- 업무가 개발, 경영이면서 보너스가 700만원 이상인 직원 목록 조회
SELECT *
    FROM EMP
    WHERE JOB IN('경영', '개발')
    AND 700<=COMM;
    
--과목의 PNO을 사용해서 PROFESSOR의 PNAME을 조회
SELECT *
    FROM COURSE A
    LEFT OUTER JOIN PROFESSOR B
    ON A.PNO = B.PNO;
    
    
    