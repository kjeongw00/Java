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
select * from professor where hiredate < 2000;

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
select * from student where avr >= 2.0 and avr <= 3.0;

--5) 교수가 지정되지 않은 과목중에 학점이 3학점인 과목을 검색하라
select * from course where pno is null and st_num = 3;

--6) 화학과 관련된 과목중 평점이 2학점 이하인 과목을 검색하라
select * from course where cname like '%화학%' and st_num <= 2;

--7) 화학과 정교수를 검색하라
select * from professor where section like '화학' and orders like '정교수';

--8) 물리학과 학생중에 성이 사마씨인 학생을 검색하라
select * from student where sname like '사마%' and major like '물리';

--9) 성과 이름이 각각 1글자인 교수를 검색하라
select * from professor where pname like '__';