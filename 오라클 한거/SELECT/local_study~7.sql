SELECT  A.RESULT
            ,B.PNAME
            ,C.CNAME
            ,D.SNAME
            ,D.SEX
            ,E.GRADE
    FROM SCORE A
        RIGHT JOIN COURSE C
        ON A.CNO = C.CNO
        LEFT JOIN PROFESSOR B
        ON  B.PNO = C.PNO
        JOIN STUDENT D
        ON A.SNO = D.SNO
        JOIN SCGRADE E
           ON A.RESULT BETWEEN E.LOSCORE AND E.HISCORE
           ORDER BY C.CNO;
           