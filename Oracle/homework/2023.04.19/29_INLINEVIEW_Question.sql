--1) 4.5 환산 평점이 가장 높은 3인의 학생을 검색하세요.

SELECT ROWNUM
    ,  A.SNO
    ,  A.SNAME
    ,  A.AVGG
    FROM (
            SELECT SNO
                ,  SNAME
                ,  ROUND(AVG(AVR * 1.125),2) AS AVGG
                FROM STUDENT
                GROUP BY SNO, SNAME
                ORDER BY AVGG DESC
        ) A
    WHERE ROWNUM <= 3;
    
--2) 기말고사 과목별 평균이 높은 3과목을 검색하세요.
SELECT ROWNUM
    ,  A.CNO
    ,  A.CNAME
    ,  RESULT
    FROM (
            SELECT CNO
                ,  CNAME
                ,  AVG(RESULT) as result
                FROM COURSE C
                NATURAL JOIN SCORE
                group by CNO, CNAME
                ORDER BY RESULT DESC
         ) A
    WHERE ROWNUM <= 3;

--3) 학과별, 학년별, 기말고사 평균이 순위 3까지를 검색하세요.(학과, 학년, 평균점수 검색)
SELECT ROWNUM
    ,  A.MAJOR  
    ,  A.SYEAR
    ,  RESULT
    FROM (
            SELECT ST.MAJOR
                ,  ST.SYEAR
                ,  ROUND(AVG(RESULT), 2) AS RESULT
                FROM STUDENT ST
                NATURAL JOIN SCORE
                group by MAJOR, SYEAR
                ORDER BY RESULT DESC
         ) A
    WHERE ROWNUM <= 3;

--4) 기말고사 성적이 높은 과목을 담당하는 교수 3인을 검색하세요.(교수이름, 과목명, 평균점수 검색)
SELECT ROWNUM
    ,  A.PNO
    ,  A.CNO
    ,  A.PNAME
    ,  A.CNAME
    ,  A.RESULT
    FROM (
            SELECT PNO
                ,  CNO
                ,  P.PNAME
                ,  C.CNAME
                ,  SC.RESULT
                FROM PROFESSOR P
                NATURAL JOIN COURSE C
                NATURAL JOIN SCORE SC
                GROUP BY PNO, CNO, PNAME, CNAME, RESULT
                ORDER BY RESULT DESC
         ) A
    WHERE ROWNUM <= 3;

--5) 교수별로 현재 수강중인 학생의 수를 검색하세요.

            SELECT COUNT(*), PNAME
            FROM STUDENT
            NATURAL JOIN PROFESSOR
            NATURAL JOIN COURSE
            NATURAL JOIN SCORE
            GROUP BY PNAME;