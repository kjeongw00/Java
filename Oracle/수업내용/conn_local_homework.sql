-------------------------------------- 1 --------------------------------------

--1)student 테이블 구조를 검색해라
desc student;

--2)course 테이블 구조를 검색해라
desc course;

--3)professor 테이블 구조를 검색해라
desc professor;

--4)score 테이블 구조를 검색해라
desc score;

--5) 모든 학생의 정보를 검색해라
select * from student;

--7) 모든 과목의 정보를 검색해라
select * from course;

--8) 기말고사 시험점수를 검색해라
select result from score;

--9) 학생들의 학과와 학년을 검색해라
select sname, major, syear from student;

--10) 각 과목의 이름과 학점을 검색해라
select cname, st_num from course;

--11) 모든 교수의 직위를 검색해라
select pname, orders from professor;

-------------------------------------- 2 --------------------------------------

--1) 각 학생의 평점을 검색하라(별칭을 사용)
select sname as 학생, avr as 평점 from student;

--2) 각 과목의 학점수를 검색하라(별칭을 사용)
select cname as 과목, st_num as 학점 from course;

--3) 각 교수의 지위를 검색하라(별칭을 사용)
select pname as 교수, orders as 지위 from professor;

--4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별칭을 사용)
select ename as 직원, sal * 1.1 as 인상급여예정 from emp;

--5) 현재 학생의 평균 평점은 4.0만점이다. 이를 4.5만점으로 환산해서 검색하라(별칭을 사용)
select sname as 학생, avr * 1.125 as 평균 from student;

-------------------------------------- 3 --------------------------------------

--1) '__학과인 __학생의 현재 평점은 __입니다' 형태로 학생의 정보를 출력하라
select major||'학과 '||sname||' 학생의 현재 평점은 '||avr||'입니다.' as 설명 from student;

--2) '__과목은 __학점 과목입니다.' 형태로 과목의 정보를 출력하라
select cname||' 과목은 '||st_num||'학점 과목입니다.' as 설명 from course;

--3) '__교수는 __학과 소속입니다.' 형태로 교수의 정보를 출력하라
select pname||'교수는 '||section||'학과 소속입니다.' as 설명 from professor;

--4) 학교에는 어떤 학과가 있는지 검색한다(학생 테이블 기반으로 검색한다)
select distinct major as 학과 from student;

--5) 학교에는 어떤 학과가 있는지 검색한다(교수 테이블 기반으로 검색한다)
select distinct section as 학과 from professor;

--6) 교수의 지위는 어떤 것들이 있는지 검색한다
select distinct orders from professor;

-------------------------------------- 4 --------------------------------------

--1) 성적순으로 학생의 이름을 검색하라
select sname as 학생, avr as 성적 from student order by avr desc;

--2) 학과별 성적순으로 학생의 정보를 검색하라
select sname as 학생, major as 학과, avr as 성적 from student order by 학과, 성적 desc;

--3) 학년별 성적순으로 학생의 정보를 검색하라
select sname, syear, avr from student order by syear desc, avr desc;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
select sname as 이름, major as 학과, syear as 학년, avr as 성적 from student order by 학과, 학년, 성적 desc;

--5) 학점순으로 과목 이름을 검색하라
select * from course order by st_num desc; -------------------- null 해결

--6) 각 학과별로 교수의 정보를 검색하라
select * from professor order by section;

--7) 지위별로 교수의 정보를 검색하라
select * from professor order by orders;

--8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
select * from professor order by section, hiredate;

-------------------------------------- 5 --------------------------------------

--1) 화학과 학생을 검색하라
select * from student where major = '화학';

--2) 평점이 2.0 미만인 학생을 검색하라
select * from student where avr < 2.0 order by avr desc;

--3) 관우 학생의 평점을 검색하라
select sname , avr from student where sname = '관우';

--4) 정교수 명단을 검색하라
select * from professor where orders = '정교수';

--5) 화학과 소속 교수의 명단을 검색하라
select pname from professor where section = '화학';

--6) 송강 교수의 정보를 검색하라
select * from professor where pname = '송강';

--7) 학년별로 화학과 학생의 성적을 검색하라
select * from student where major = '화학' order by syear;

--8) 2000년 이전에 부임한 교수의 정보를 부임일순으로 검색하라 x
select * 
    from professor
    --앞의 문자열을 뒤 형식의 데이트 타입으로 변환
    where hiredate < To_DATE('20000101 00:00:00', 'yyyyMMdd HH24:mi:ss') ORDER BY HIREDATE;

--9) 담당 교수가 없는 과목의 정보를 검색하라
select * from course where pno is null;

-------------------------------------- 6 --------------------------------------

--1) 유공과와 생물과, 식영과 학생을 검색하라
select * from student where major = '유공' or major = '생물' or major = '식영';

--2) 화학과가 아닌 학생중에 1학년 학생을 검색하라
select * from student where major != '화학' and syear = 1;

--3) 물리학과 3학년 학생을 검색하라
select * from student where major = '물리' and syear = 3;

--4) 평점이 2.0에서 3.0사이인 학생을 검색하라
select *
    from student
    where avr >= 2.0 and avr <= 3.0;

--5) 교수가 지정되지 않은 과목중에 학점이 3학점인 과목을 검색하라
select * from course where pno is null and st_num = 3;

--6) 화학과 관련된 과목중 평점이 2학점 이하인 과목을 검색하라
select * from course where cname like '%화학%' and st_num <= 2;

--7) 화학과 정교수를 검색하라
select * from professor where section like '화학' and orders like '정교수';

--8) 물리학과 학생중에 성이 사마씨인 학생을 검색하라
select * from student where sname like '사마%' and major = '물리';

--9) 성과 이름이 각각 1글자인 교수를 검색하라
select * from professor where pname like '__';

-------------------------------------- 8 --------------------------------------

--1) 평점이 3.0에서 4.0사이의 학생을 검색하라(between and)
select * from student where avr between 3.0 and 4.0;

--2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라(between and)
select * 
    from professor 
    where hiredate 
        between to_date ('19940101') 
        and to_date ('19951231');

--3) 화학과와 물리학과, 생물학과 학생을 검색하라(in)
select * from student where major in ('화학', '물리', '생물');

--4) 정교수와 조교수를 검색하라(in)
select * from professor where orders in ('정교수', '조교수');

--5) 학점수가 1학점, 2학점인 과목을 검색하라(in)
select * from course where st_num in (1, 2);

--6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라(between and)
select *
    from student 
    where syear in (1, 2)
      and avr between 2.0 and 3.0;

--7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라(in)
select *
    from student
    where major in ('화학', '물리')
      and syear in (1, 2) 
      order by avr DESC;

--8) 부임일이 1995년 이전인 정교수를 검색하라(to_date)
select * 
    from professor 
    where hiredate < to_date ('19950101')
    AND ORDERS = '정교수';

-------------------------------------- 9 --------------------------------------

--1) 송강 교수가 강의하는 과목을 검색한다
select pf.section
    , pf.pname
    from professor pf
        where pname = '송강';
    
--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
select p.*
    ,  C.CNO
    ,  C.CNAME
    from professor p
    JOIN COURSE C
    ON P.PNO = C.PNO
    where C.CNAME like '%화학%';
--  AND C.CNAME LIKE '%화학%';
--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
select *
    from course c
    join professor p
    on c.pno = p.pno
    where st_num = 2;

--4) 화학과 교수가 강의하는 과목을 검색한다
select *
    from professor p
    join course c
    on p.pno = c.pno
    where section = '화학';

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
select st.sno
    ,  st.sname
    ,  st.sex
    ,   s.result
    from student st
    join score s
    on st.sno = s.sno
    where st.syear = 1
    AND ST.MAJOR = '화학'
    ORDER BY S.CNO, S.RESULT DESC;

--6) 일반화학 과목의 기말고사 점수를 검색한다
select *
    from course c
    join score s
    on c.cno = s.cno
    where c.cname = '일반화학'
    order by s.result desc;
--  and c.cname = '일반화학';

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
select s.major
     , s.syear
     , c.cname
     , sc.result
    from student s
    join score sc
    on s.sno = sc.sno
    join course c
    on sc.cno = c.cno
    where s.syear = 1 and s.major = '화학' and c.cname = '일반화학';
    
    

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다 ---------------------------------
select distinct c.cname
    ,  st.syear
    ,  s.result
    ,  st.major
    from student st
    join score s
    on st.sno = s.sno
    join course c
    on c.cno = s.cno
    where st.syear = 1 and st.major = '화학';
    
--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
select c.cname
    ,  s.result
    ,  st.sname
    ,  sc.grade
    from course c
    join score s
    on c.cno = s.cno
    join student st
    on s.sno = st.sno
    inner join scgrade sc
    on s.result between loscore and hiscore
    where c.cname = '유기화학' and sc.grade = 'F';
    
-------------------------------------- 10 --------------------------------------
    
--1) 학생중에 동명이인을 검색한다
select distinct st1.sno
    ,  st1.sname
    , st2.sno
    , st2.sname
    from student st1
    join student st2
    on st1.sno != st2.sno and st1.sname = st2.sname;
     

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
select p.pname
    ,  p.section
    ,  nvl(c.cno, '폐강') as 수업번호
    from professor p
    left outer join course c
    on p.pno = c.pno
    order by section desc;

--3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다
select c.cname
    ,  c.st_num
    ,  nvl(p.pname, ' ') as 담당교수
    from course c
    left outer join professor p
    on c.pno = p.pno
    order by c.st_num;
    
-------------------------------------- 11 --------------------------------------
    
--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
select c.cname as 과목명
    ,  p.pname as 담당교수
    from course c
    full outer join professor p
    on c.pno = p.pno;

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
select st.major as "전공"
    ,  st.sname as "이름"
    ,  s.result as "기말고사성적"
    from student st
    join score s
    on st.sno = s.sno
    where st.major = '화학';

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
select c.cname as 과목
    ,  st.sname as 학생이름
    ,  s.result as 기말성적
    from course c
    join score s
    on c.cno = s.cno
    join student st
    on s.sno = st.sno
    where c.cname = '유기화학';

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
select st.sname as 학생이름
    ,  st.major as 전공
    ,  c.cname as 수업명
    ,  p.pname as 교수이름
    ,  s.sno as 수업번호
    from student st
    join score s
    on st.sno = s.sno
    join course c
    on c.cno = s.cno
    join professor p
    on c.pno = p.pno
    where st.major = '화학';
    
select distinct sc.cno
    ,  c.cname
    ,  c.pno
    ,  p.pname
    from score sc
    join course c
    on sc.cno = c.cno
    join student st
    on sc.sno = st.sno
    join professor p
    on p.pno = c.pno
    and st.major = '화학';
    

--5) 모든 교수의 명단과 담당 과목을 검색한다
select p.pname
    ,  p.section
    from professor p;

--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
select nvl(p.pname, '없음') as 교수명
    ,  nvl(p.section, '없음') as "담당 과목"
    ,  nvl(c.cname, '없음') as 과목
    from professor p
    full outer join course c
    on p.pno = c.pno;
  
-------------------------------------- 13 --------------------------------------

--<단일 행 함수를 사용하세요>
--1) 이름이 두 글자인 학생의 이름을 검색하세요
SELECT *
    FROM STUDENT
        WHERE LENGTH(SNAME) = 3;

--2) '공'씨 성을 가진 학생의 이름을 검색하세요
SELECT *
    FROM STUDENT
        WHERE SUBSTR(SNAME, 1, 1) = '공';

--3) 교수의 지위를 한글자로 검색하세요(ex. 조교수 -> 조)
SELECT  *
    FROM PROFESSOR
        WHERE SUBSTR(ORDERS, 1, 1) = '조';

--4) 일반 과목을 기초 과목으로 변경해서 모든 과목을 검색하세요
--  (ex. 일반화학 -> 기초화학)
SELECT CNAME AS "일반 과목", REPLACE(CNAME,'일반','기초') AS "기초 과목"
    FROM COURSE;
   
--5) 만일 입력 실수로 student테이블의 sname컬럼에 데이터가 입력될 때
--   문자열 마지막에 공백이 추가되었다면 검색할 때 이를 제외하고
--   검색하는 SELECT 문을 작성하세요
SELECT SNAME, TRIM(TRAILING ' ' FROM SNAME)
    FROM STUDENT;
    
-------------------------------------- 14 --------------------------------------
    
--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요 --------------모름
SELECT pno
    ,  PNAME
    ,  TRUNC(LAST_DAY(HIREDATE)) - TRUNC(HIREDATE)
    FROM PROFESSOR;

--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT PNAME
    , HIREDATE
    , TRUNC((SYSDATE - HIREDATE)/7) AS "근무한 주"
    FROM PROFESSOR;

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT PNO
    ,  PNAME
    ,  HIREDATE
    FROM PROFESSOR
        WHERE HIREDATE BETWEEN TO_DATE('19910101', 'yyyy/MM/dd') AND TO_DATE('19951231', 'yyyy/MM/dd');

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT SNAME
    ,  ROUND(AVR * 4.5 / 4.0, 2)
    FROM STUDENT;

--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요 --- 고민
SELECT ENO
    ,  ENAME
    , TRUNC(MONTHS_BETWEEN(SYSDATE,HDATE) / 12) || '년'
      || MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE)), 12) || '개월'
      || TRUNC(SYSDATE-ADD_MONTHS(HDATE, MONTHS_BETWEEN(SYSDATE, HDATE))) || '일'
    FROM EMP;
-------------------------------------- 14 --------------------------------------

--1) 학생의 평균 평점을 다음 형식에 따라 소수점 이하 2자리까지 검색하세요
--'OOO 학생의 평균 평점은 O.OO입니다.'
SELECT SNAME || '학생의 평균 평점은' || ROUND(AVR, 2) || '입니다.'
    FROM STUDENT;

--2) 교수의 부임일을 다음 형식으로 표현하세요
--'OOO 교수의 부임일은 YYYY년 MM월 DD일입니다.'
SELECT PNAME || '교수의 부임일은 ' || T0_CHAR(HIREDATE, 'YYYY') || '년 ' || T0_CHAR(HIREDATE, 'MM') ||
        '월 ' || T0_CHAR(HIREDATE, 'DD') || '일입니다.'
    FROM PROFESSOR;
    
SELECT PNAME || TO_CHAR(HIREDATE, '"교수의 부임일은 "YYYY"년 "MM"월 "DD"일입니다."')
    FROM PROFESSOR;

--3) 교수중에 3월에 부임한 교수의 명단을 검색하세요\
SELECT PNO
    ,  PNAME
    ,  HIREDATE
    FROM PROFESSOR
    WHERE TO_CHAR(HIREDATE, 'MM') = '03';
    
-------------------------------------- 17 --------------------------------------

--1) 각 학과별 학생 수를 검색하세요


--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요


--3) 부임일이 25년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT ORDERS
    ,  COUNT(*)
    FROM PROFESSOR
    WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12 >= 25
    GROUP BY ORDERS;

--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT CNO
    ,  CNAME
    ,  SUM(ST_NUM)
    FROM COURSE
    GROUP BY CNO, CNAME
    HAVING CNAME LIKE '%화학%';
    
SELECT SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%';
    
--5) 학과별 기말고사 평균을 성적순(성적 내림차순)으로 검색하세요
SELECT ST.MAJOR
    ,  ROUND(AVG(SC.RESULT), 2)
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    GROUP BY ST.MAJOR
    ORDER BY AVG(SC.RESULT) DESC;

--6) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT DNO
    ,  JOB
    ,  ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY DNO, JOB
    HAVING DNO = '30';

--7) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요(학과, 학년, 평점)
SELECT MAJOR
    ,  SYEAR
    ,  MAX(AVR)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING MAJOR = '물리';

-------------------------------------- 18 --------------------------------------

--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT TRUNC(AVG(AVR),1)
    ,  MAJOR
    FROM STUDENT
    WHERE MAJOR != '화학'
    GROUP BY MAJOR;
    --HAVING MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT TRUNC(AVG(AVR),1)
    ,  MAJOR 
    FROM STUDENT
    WHERE MAJOR != '화학'
    GROUP BY MAJOR
    HAVING AVG(AVR) >= 2.0; -- 통계함수를 쓸때 WHERE절 사용 불가
    
--HAVING 과 WHERE의 차이
--HAVING 구문은 그룹화된 결과 집합에 대한 필터링을 수행하는 구문이며, WHERE 구문은 단일 레코드에 대한 필터링을 수행하는 구문입니다.
    SELECT TRUNC(AVG(AVR),1) AS 평균, MAJOR 
FROM STUDENT
WHERE MAJOR != '화학' AND AVR >= 2.0
GROUP BY MAJOR;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT SC.SNO
    ,  ST.SNAME
    ,  ROUND(AVG(SC.RESULT), 2)
    FROM SCORE SC
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    GROUP BY SC.SNO, ST.SNAME
    HAVING ROUND(AVG(SC.RESULT), 2) >= 60;
    
--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT C.CNAME
    ,  C.ST_NUM
    ,  P.PNAME
    ,  P.PNO
    FROM PROFESSOR P
    JOIN COURSE C
    ON P.PNO = C.PNO
    WHERE ST_NUM >= 3.0;
    
--강사님 풀이
SELECT C.PNO
    ,  P.PNAME
    ,  SUM(C.ST_NUM)
    FROM COURSE C
    JOIN PROFESSOR P
    ON C.PNO = P.PNO
    GROUP BY C.PNO, P.PNAME
    HAVING SUM(C.ST_NUM) >= 3;
    

--5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT A.CNAME
    ,  B.PNAME
    FROM (SELECT AVG(RESULT)
                JOIN SCORE
                ON SCORE.CNO = COURSE.CNO
                WHERE CNAME != '핵화학'
                GROUP BY CNAME
            ) AS A
    JOIN (
            SELECT AVG(RESULT)
                FROM SCORE
                JOIN COURSE
                ON SCORE.CNO = COURSE.CNO
                GROUP BY CNAME
                HAVING CNAME = '핵화학';
            ) AS B
    WHERE   

--강사님 풀이
SELECT AVGRESULT.CNO
    ,  AVGRESULT.CNAME
    ,  AVGRESULT.PNO
    ,  P.PNAME
    ,  AVGRESULT.RESAVG
    FROM (
        SELECT SC.CNO
            ,  C.CNAME
            ,  C.PNO
            ,  ROUND(AVG(SC.RESULT), 2) AS RESAVG
            FROM SCORE SC
            JOIN COURSE C
            ON SC.CNO = C.CNO
            GROUP BY SC.CNO, C.CNAME, C.PNO; --이미  CNO과 CNAME으로 묶어서 PNO 으로 묶어도 영향이 거의 없다.
        ) AVGRESULT
        JOIN PROFESSOR P
        ON AVGRESULT.PNO = P.PNO
        WHERE AVGRESULT.RESAVG > (
                                    SELECT ROUND(AVG(SCO.RESULT), 2)
                                        FROM SCORE SCO
                                        JOIN COURSE CO
                                        ON SCO.CNO = CO.CNO
                                        AND CO.CNAME = '핵화학'
                                        GROUP BY SCO.CNO
                                  );
        
--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요
SELECT E.DNO
    ,  D.DNAME
    ,  COUNT(*)
    FROM EMP E
    JOIN DEPT D
    ON E.DNO = D.DNO
    GROUP BY E.DNO, D.DNAME
    HAVING COUNT(*) >= 4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB
    ,  ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY JOB
    HAVING ROUND(AVG(SAL), 2) >= 3000;

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT MAJOR
    ,  SYEAR
    ,  COUNT(*)
    FROM STUDENT
    GROUP BY MAJOR, SYEAR
    HAVING COUNT(*) >= 5;
    
-------------------------------------- 20 --------------------------------------

--1) 각 학과별 학년별 학생 수를 ROLLUP함수로 검색하세요


--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하는 데 화학과 생물이 열로 만들어지도록 하세요.(PIVOT 사용)


--3) 학과별 학생이름을 ,로 구분하여 성적순으로(내림차순) 조회하세요.(LISTAGG 사용)


--4) 부서별 업무별 연봉의 평균을 검색하세요(부서와 업무 컬럼의 그룹화 여부도 같이 검색, GROUPING 사용)

-------------------------------------- 21 --------------------------------------

--1) 각 과목의 과목번호, 과목명, 담당 교수의 교수번호, 교수명을 검색하라(NATURAL JOIN 사용)


--2) 화학과 학생의 기말고사 성적을 모두 검색하라(JOIN USING 사용)


--3) 화학 관련 과목을 강의하는 교수의 명단을 검색한다(NATURAL JOIN 사용)


--4) 화학과 1학년 학생의 기말고사 성적을 검색한다(NATURAL JOIN 사용)


--5) 일반화학 과목의 기말고사 점수를 검색한다(JOIN USING 사용)


--6) 화학과 1학년 학생이 수강하는 과목을 검색한다(NATURAL JOIN 사용)

-------------------------------------- 22 --------------------------------------

--1) 다중 컬럼 IN절을 이용해서 기말고사 성적이 80점 이상인 과목번호, 학생번호, 기말고사 성적을 모두 조회하세요.


--2) 다중 컬럼 IN절을 이용해서 화학과나 물리학과면서 학년이 1, 2, 3학년인 학생의 정보를 모두 조회하세요.


--3) 다중 컬럼 IN절을 사용해서 부서가 10, 20, 30이면서 보너스가 1000이상인 사원의 사원번호, 사원이름, 부서번호, 부서이름, 업무, 급여, 보너스를 
--   조회하세요.(서브쿼리 사용)


--4) 다중 컬럼 IN절을 사용하여 기말고사 성적의 최고점이 100점인 과목의 과목번호, 과목이름, 학생번호, 학생이름, 기말고사 성적을 조회하세요.(서브쿼리 사용)

-------------------------------------- 23 --------------------------------------

--1) WITH 절을 이용하여 정교수만 모여있는 가상테이블 하나와 일반과목(과목명에 일반이 포함되는)들이 모여있는 가상테이블 하나를 생성하여 
--   일반과목들을 강의하는 교수의 정보 조회하세요.(과목번호, 과목명, 교수번호, 교수이름)


--2) WITH 절을 이용하여 급여가 3000이상인 사원정보를 갖는 가상테이블 하나와 보너스가 500이상인 사원정보를 갖는 가상테이블 하나를 생성하여
--   두 테이블에 모두 속해있는 사원의 정보를 모두 조회하세요.


--3) WITH 절을 이용하여 평점이 3.3이상인 학생의 목록을 갖는 가상테이블 하나와 학생별 기말고사 평균점수를 갖는 가상테이블 하나를 생성하여
--   평점이 3.3이상인 학생의 기말고사 평균 점수를 조회하세요.


--4) WITH 절을 이용하여 부임일자가 25년이상된 교수정보를 갖는 가상테이블 하나와 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 기말고사성적을
--   갖는 가상테이블 하나를 생성하여 기말고사 성적이 90이상인 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 교수이름, 기말고사성적을 조회하세요.
