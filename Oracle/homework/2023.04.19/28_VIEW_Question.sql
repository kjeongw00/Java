--뷰 이름은 자유
--1) 학생의 학점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_AVG_AVR(
    CNO,
    CNAME,
    MAJOR,
    AVGAVR --컬럼명을 커스터마이징해서 사용할 수 있기 때문에 원천 테이블의 컬럼명을 노출하지 않을 수 있다.
) AS (
    --위에서 지정한 컬럼의 순서와 개수가 일치해야 한다.
    SELECT CNO
        ,  C.CNAME
        ,  ST.MAJOR
        ,  ROUND(AVG(ST.AVR * 1.125), 2)
        FROM COURSE C
        NATURAL JOIN SCORE SC
        JOIN STUDENT ST
        ON SC.SNO = ST.SNO
        GROUP BY CNO, C.CNAME, ST.MAJOR
);

--2) 각 과목별 평균 점수를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_AVG_RES(
    CNO,
    CNAME,
    RESULT
) AS (
    SELECT CNO
        ,  C.CNAME
        ,  ROUND(AVG(RESULT),2)
        FROM COURSE C
        NATURAL JOIN SCORE SC
        GROUP BY CNO, C.CNAME
);

--3) 각 사원과 관리자의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE VIEW V_ENA_MGR(
    ENO,
    ENAME,
    MGR
) AS (
    SELECT ENO
        ,  ENAME
        ,  MGR
        FROM EMP
        GROUP BY ENO, ENAME, MGR
);

--4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW V_GR_SC_ST(
    GRADE,
    RESULT,
    SNO,
    SNAME
) AS (
    SELECT GRADE
        ,  RESULT
        ,  SNO
        ,  SNAME
        FROM SCORE
        NATURAL JOIN STUDENT
        JOIN SCGRADE
        ON RESULT BETWEEN LOSCORE AND HISCORE
        GROUP BY GRADE, RESULT, SNO, SNAME
    );

SELECT * FROM V_GR_SC_ST;

--5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
CREATE VIEW V_PRO_SEC_SNA(
    CNO,
    PNAME,
    SECTION,
    SNO,
    SNAME
) AS (
    SELECT CNO
        ,  PNAME
        ,  SECTION
        ,  SNO
        ,  SNAME
        FROM COURSE
        NATURAL JOIN PROFESSOR
        NATURAL JOIN STUDENT
        GROUP BY CNO, PNAME, SECTION, SNO, SNAME
    );