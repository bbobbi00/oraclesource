--scott;

-- SELECT(데이터 조회)
--e: 별칭(임의 지정 가능)/없어도 가능
--*: 전체 필드(컬럼)를 의미함
SELECT * FROM EMP e;

SELECT EMPNO, ENAME, JOB FROM EMP;

--emo: 테이블
--empno:사원번호, ename(사원명), job(직책),mgr(매니저번호), hiredate(고용일),sal(급여), comm(보너스)
--deptno(부서번호)

--emp 테이블에서 사원번호, 매니저번호, 부서번호만 조회
SELECT EMPNO, MGR, DEPTNO FROM EMP;

--emp 테이블에서 부서번호만 조회
SELECT DISTINCT deptno
FROM EMP e;

--데이터 출력 시 필드명 별칭 부여
--쌍따옴표는 별칭에 공백이 있는 경우 무조건 사용
--as 생략 가능

SELECT EMPNO AS 사원번호,MGR 매니저번호,DEPTNO "부서번호" FROM EMP;


--연봉 게산
--월급 * 12+수당
--sal * 12+comm
SELECT empno, SAL, sal * 12 + COMM AS "연봉"
FROM EMP
ORDER BY SAL DESC;
--emp 테이블에서 empno, ename, sal 조회(단,empno 내림차순)
SELECT empno, ename, sal FROM EMP ORDER BY EMPNO DESC;

--전체조회, 부서번호 오름차순, sal 내림치슨
SELECT * 
FROM EMP e
ORDER BY DEPTNO, SAL DESC;

--조건
--부서번호가 30번인 사원 조회
--sal> 1000 이상인 사원 조회
-- = (같다), 산술연산자(<,>,)
SELECT *
FROM EMP e
WHERE DEPTNO= 30;

SELECT *
FROM EMP e
WHERE SAL >= 1000
ORDER BY SAL DESC;

--empno가 7782 인 사원 조회
SELECT *
FROM EMP e
WHERE empno=7782;

--deptno 가 30이고, job 이 SALESMAN 사원 조회
--데이터는 대소문자 구별 함
SELECT *
FROM EMP e
WHERE deptno=30 AND JOB = 'SALESMAN';

-- 사원번호가 7499 이고 부서번호가 30인 사원 조회
SELECT *
FROM EMP e
WHERE empno=7499 AND deptno=30;

--이거나(혹은) :OR
--부서번호가 30번 이거나 JOB이 SALESMAN인 사원 조회
SELECT *
FROM EMP e
WHERE DEPTNO = 30 OR JOB= 'SALESMAN';

-- 연봉이 36000 인 사원 조회
-- 연봉 SAL*12+COMM

SELECT *
FROM EMP e
WHERE SAL*12+COMM = 36000;

-- 문자 비교도 가능 - 산술연산 기호 가능
-- 알파벳 순서로 F 다음에 있는
SELECT *
FROM EMP e
WHERE ENAME >= 'F';

-- SAL 이 3000 이 아닌 사원 조회
-- ~ 이 아닌 : !=, <>, ^=
SELECT *
FROM EMP e
WHERE SAL != 3000;

SELECT *
FROM EMP e
WHERE SAL <> 3000;

SELECT *
FROM EMP e
WHERE SAL ^= 3000;

-- job 이 MANAGER OR SALESMAN OR CLERK

SELECT *
FROM EMP e
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB='CLERK';

-- IN
SELECT *
FROM EMP e
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');


SELECT *
FROM EMP e
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');

-- HIREDATE 가 1981 10 31 이후에 고용된 사원 조회
-- 날짜 데이터 산술 연산 가능, 날짜 데이터 '' 로 처리
SELECT *
FROM EMP e 
WHERE HIREDATE > '1981-10-31';

-- BETWEEN A AND B
-- SAL 2000 이상 3000이하인 사원 조회
SELECT *
FROM EMP e
WHERE SAL >=2000 AND SAL <= 3000;

SELECT *
FROM EMP e
WHERE SAL BETWEEN 2000 AND 3000;


-- NOT BETWEEN A AND B
-- SAL 2000 이상 3000이하가 아닌 사원 조회
SELECT *
FROM EMP e
WHERE SAL NOT BETWEEN 2000 AND 3000;

--사원 이름이 5로 시작하는 사원 조회
SELECT *
FROM EMP e
WHERE ENAME LIKE 'S%';

--사원 이름의 두번째 글자가 L인 사원 조회
SELECT *
FROM EMP e
WHERE ENAME LIKE '%AM%';

--사원 이름에 AM 문자가 포함되지 않은 사원 조회

--
SELECT * FROM EMP e; 

--NULL : 값이 없는 상태
--'': 빈 값
--' ': 스페이스 바도 문자임

--comm 이 null인 사원 조회
--NULL 비교 :IS
SELECT * FROM EMP e WHERE COMM = NULL;..(X)
SELECT * FROM EMP e WHERE COMM IS NULL;
SELECT * FROM EMP e WHERE COMM IS NULL;

--MGR이 NULL이 아닌 사원 조회
SELECT * FROM EMP e WHERE MRG IS NOT NULL;


--집합연산자
--합집합(UNION, UNION ALL), 교집합(INTERSECT), 차SELECT DEPARTMENT_ID, FIRST_NAME, JOB_ID, SALARY * COMMISSION_PCT AS COMMISSION

--부서번호가 10 혹은 20번인 사원 조회
--OR 사용해서 추출SELECT DEPARTMENT_ID, FIRST_NAME, JOBSELECT EMPNO, ENAME, SAL, DEPTNO

--합집합으로 추출도 가능
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e

UNION 
SELECT EMPNO, ENAME, SAL 
FROM EMP e
WHERE DEPTNO = 20;

--MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;

--INTERCECT
SELECT EMPNO, ENAME, DEPTNO
FROM EMP e
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;

--오라클 함수(내장 함수)
--함수는 사용하는 DBMS에 따라 다르게 제공
--1. 문자 함수
--대소문자 변경

SELECT *
FROM EMP e
WHERE lower(ENAME) = 'clark';

--upper(문자열): 괄호 안 문자를 모두 대문자로 변환하여 반환
--lower(문자열): 괄호 안 문자를 모두 소문자로 변환하여 반환
--initcap(문자열): 괄호 안 문자 데이터 중 첫번째 문자만 대문자로 나머지는 소문자로 변환하여 반환
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP e;

--2) 문자열 길이 : LENGTH, LENGTHB
--LENGTHB: 문자열에 사용된 바이트 수 반환
SELECT ENAME, LENGTH(ENAME)
FROM EMP e;


--함수 결과를 보고 싶은 데 테이블이 없으면 임시 테이블로 DUAL 사용
--한글은 문자 하나당 3byte 할당, 영어는 1byte
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

--직책 이름이 6글자 이상인 사원 조회
SELECT *
FROM EMP e
WHERE LENGTH(job)>6; 

--3)문자열 일부 추출: substr(문자열데이터, 시작위치, 추출길이)
--                    substr(문자열데이터, 시작위치): 시SELECT job, SUBSTR(JOB,1,2), SUBSTR(job,3,2), SUBSTR(job,5)
--                    시작위치가 음수라면 오른쪽 끝부터 시작

SELECT job, SUBSTR(JOB,1,2), SUBSTR(job,3,2), SUBSTR(job,5)
FROM EMP e;

SELECT job, SUBSTR(JOB,-1,2), SUBSTR(job,-3,2), SUBSTR(job,-5)
FROM EMP e;

--4) INSTR(문자열데이터, 위치를 찾으려는 문자, 시작위치, 시작위치에서 몇번째 위치)
-- 문자열 데이터 안에서 특정 문자 위치 찾기

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3
       FROM DUAL;

--사원 이름에 s 가 들어있는 사원 조회
--LIKE
SELECT *
FROM EMP e
WHERE INSTR(ENAME,'S')> 0;

--5)REPLACE : 특정 문자를 다른 문자로 변경
--            REPLACE(문자열데이터,찾는문자,변경할문자)
SELECT '010-1234-5678' AS REPLACE_BEFORE,
REPLACE ('010-1234-5678', '-','')AS REPLACE_1,
REPLACE('010-1234-5678','-')AS REPLACE_2,
REPLACE('010-1234-5678','-',' ') AS REPLACE_3
FROM DUAL;

--6)CONCAT : 두 문자열 데이터를 합하는 함수
--           CONCAT(문자열데이터1, 문자열데이터2)
SELECT CONCAT(EMPNO,CONCAT(':'ENAME))
FROM EMP e
WHERE ENAME='SMITH';

SELECT EMPNO ||' : ' || ENAME
FROM EMP e
WHERE ENAME='SMITH';

--7)TRIM : 공백 제거
-- TRIM(삭제옵션(선택),삭제할문자) FROM 원본문자열
--'SMITH' = 'SMITH ', ' SMITH','  SMITH '
SELECT '[__Oracle__' || ']' AS 
SELECT '[' || ('__Oracle__') || ']' AS trim_before,
       '[' || TRIM('__Oracle__') || ']' AS trim,
       '[' || LTRIM('__Oracle__') || ']' AS Ltrim,
       '[' || RTRIM(' __Oracle__') || ']' AS Rtrim
       
FROM DUAL;

SELECT '[' || ' __Oracle__ ' || ']' AS trim,_before,
       '[' || TRIM(LEADING'_' FROM '__Oracle__') || ']' AS TRIM_LEADING
       '[' || TRIM(TRAILI
       



--2.함수: 숫자 데이터에 적용
-- 반올림,올림,버림,나머지 값 구하기
--ROUND, CEIL, FLOOR, TRUNC, MOD
--ROUND(숫자, 반올림위치)

SELECT ROUND(1234.5678) AS TRUNC,
       ROUND(1234.5678,0) AS TRUNC1,
       ROUND(1234.5678,1) AS TRUNC2,
       ROUND(1234.5678,2) AS TRUNC3,
       ROUND(1234.5678,-1) AS ROUND_MINNUS1,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
 FROM DUAL;

SELECT TRUNC(1234.5678) AS \TRUNC,
       TRUNC(1234.5678,0) AS TRUNC,
       TRUNC(1234.5678,1) AS TRUN1,
       TRUNC(1234.5678,2) AS TRUNC2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

--CEIL,FLOOR: 지정한 숫자와 가까운 정수를 찾기
--CEIL : 가까운 정수 중에서 지정한 숫자보다 큰 정수 중 가장 작은 정수 반환
--FLOOR: 지정한 숫자보다 작은 정수 중 가장 큰 정수 반환

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

--MOD:나머지
SELECT 11/5, MOD(11,5)
FROM DUAL;

--3.날짜 함수
--2023-01-24 OR 2023/01/24

--오늘날짜
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
FROM DUAL;

--날짜데이터+숫자  : 날짜 데이터보다 숫자만큼 이후의 날짜

SELECT SYSDATE, SYSDATE+1, SYSDATE-1
FROM DUAL;

--ADD MONTHS():몇 개월 이후의 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3)
FROM DUAL;

--입사 30주년이 되는 날짜 구하기
SELECT EMPNO, ENAME, HIREDATE, ADD MONTHS(HIREDATE,360)
FROM EMP e;

--MONTH_BETWEEN(날짜1, 날짜2) : 두 개의 날짜 데이터를 입력하고 두 날짜간의 개월 수 차이 구하기
--고용일과 오늘날짜 차이
SELECT EMPNO, ENAME, HIDERATE, 
SYSDATE,
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM
EMP e;

--NEXT,DAY,LAST DAY


--데이터 타입
--NUMBER(숫자), VARCHAR2(문자), DATE(날짜/시간)
--자료형 변환(날짜->문자, 문자->숫자)

--NUMBER + 문자숫자
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP e
WHERE ENAME= 'FORD';

--수치가 부적합합니다
--SELECT EMPNO, ENAME, EMPNO+ 'ABCD'
--FROM EMP e
--WHERE ENAME='FORD';

--TO_CHAR(날짜(숫자)), 형식): 날짜 데이터를 출력할 문자형태를 지정(주로 날짜 데이터에 사용)
--TO_NUMBER(문자열, 숫자형식): 문자열 데이터를 지정한 형태의 숫자로 인식하여 숫자 데이터로 변환
--Y: 연도, M:월, D:일, HH:시, MI:분, SS:초, HH24: 시를 24시간으로, AM(PM):오전, 오후
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD'),SYSDATE, TO_CHAR(SYSDATE, 'YY/MM/DD HH:MI:SS AM')
FROM DUAL;

--명시적 형변환
--TO_CHAR(날짜데이터, '출력되기를 원하는 문자 형태'): 숫자, 날짜 데이터를 문자로 변환
-- TO_NUMBER(): 문자 데이터를 숫자로 변환
--TO_DATE(): 문자 데이터를 날짜로 변환

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), SYSDATE
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'), SYSDATE
FROM DUAL;

SELECT 1300-'1500', '1300' + 1500
FROM DUAL;

SELECT '1300' +'1500'
FROM DUAL;

--9: 숫자의 한 자리를 의미함(빈자리를 채우지 않음)
--0: 빈 자리를 0으로 채움
SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500', '999,999')
FROM DUAL;

SELECT TO_CHAR(sal, '999,999.00') AS sal1,
       TO_CHAR(sal, '000.999,999') AS sal2
FROM EMP e;

SELECT
TO_DATE('2024-01-24') AS todate1, 
TO_DATE('20240124') AS todate2
FROM DUAL;

--수치가 부적합합니다
SELECT '2024-01-24' - '2023-12-31'
FROM DUAL;

SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31')
FROM DUAL;

--널 처리 함수
--널 * 숫자 => NULL, 널 + 숫자=>NULL
--널을 다른 값으로 변경

SELECT EMPNO, SAL, COMM, SAL + COMM
FROM EMP e;

--NVL(널인지 검사할 열이름(OR 데이터), 대체할 데이터)
SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL(COMM,0)
FROM EMP e;

--NVL2(널인지 검사할 열이름(OR 데이터), NULL이 아닌경우 반환 데이터(계산식, NULL인 경우 반환 데이터(계산식))

SELECT EMPNO, ENAME, SAL, NVL2(COMM, '0', 'X')
FROM EMP e;

--NVL2
--COMM 이 널이면 연봉=SAL * 12, 널이 아니면 연봉=SAL * 12+COMM
SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS 
FROM EMP e;

-- JOB 이 MANAGER 라면 SAL * 1.1
--JOB 이 SALESMAN 라면 SAL * 1.05
--JOB이 ANALYST 라면 SAL
-- 나머지 직무 SAL * 1.03

--DECODE 함수와 CASE 문
--DECODE(검사대상,조건1,조건1이 참일때 반환할 결과,조건2, 조건2가 참일때 반환할결과,...., 조건1~조건N 일치하지 않는 경우 반환할 결과만)

SELECT EMPNO, ENAME, JOB, SAL, CASE
	job 
	WHEN 'MANAGER' THEN SAL * 1.1
	WHEN 'SALESMAN' THEN SAL * 1.05
	WHEN 'ANALYST' THEN SAL ELSE SAL * 1.03
END AS UPSAL2,
DECODE(JOB, 'MANAGER', SAL*1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM EMP e;

--COMM 널일때 해당사항 없음
--COMM이 0일때 수당없음
-- 0< 이면 수당 : COMM
SELECT
EMPNO, ENAME, COMM, CASE

WHEN IS NULL THEN '해당사항 없음'
WHEN COMM = 0 THEN '수당 없음'
WHEN>0 THEN '수당 :' || COMM
END AS COMM_TEXT
FROM EMP e;

--SUBSTOR(TO_CHAR(mgr),1,2)
SELECT EMPNO, ENAME, MGR, DECODE(SUBSTR(TO_CHAR(MGR),1,2), NULL, '0000', '75', '5555', '76', '6666', '77', '7777', '78', '8888',
SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR
FROM EMP e

SELECT EMPNO, ENAME, MGR, CASE SUBSTR(TO_CHAR(NVL(MGR,0)),1,2)
                               WHEN '0' THEN '0000'
                               WHEN '75' THEN '5555'
                               WHEN '76' THEN '6666'
                               WHEN '78' THEN '7777'
                               WHEN '78' THEN '8888'
                               ELSE TO_CHAR(MGR)
                               END AS CHG_MGR
                               FROM EMP e;



--다중 행 함수
--단일 그룹의 그룹 함수가 아닙니다(여러 행이 나올 수 있는 컬럼을 추가한 경우)                              
SELECT SUM(sal), AVG(sal) , COUNT(sal), MAX(sal) , MIN(sal)
FROM EMP e;

--동일한 급여를 하나만 선택해서 합계
SELECT SUM(DISTINCT sal)
FROM EMP e;

SELECT COUNT(*)
FROM EMP e;

-- 부서번호가 30인 사원 수 출력
SELECT COUNT(*)
FROM EMP e
WHERE DEPTNO = 30;

--부서번호가 30인 사원 중에서 급여의 최대값
SELECT MAX(SAL)
FROM EMP e
WHERE DEPTNO = 30;

--부서번호가 20인 사원의 입사일 중에서 제일 최근 입사일 조회
SELECT MAX(HIREDATE)
FROM EMP e
WHERE DEPTNO = 20;

--부서번호가 20인 사원이 입사일 중에서 제일 오래된 입사일 조히
SELECT MIN(HIREDATE)
FROM EMP e
WHERE DEPTNO = 20;

--부서번호가 30번인 사원 중에서 SALARY의 중복값 제거한 후 평균구하기
SELECT AVG(SAL)
FROM EMP e
WHERE DEPTNO = 30;

--부서별 급여 합계 구하기
SELECT '10' AS DEPTNO, SUM(SAL)
FROM EMP e;
UNION 
SELECT '20' AS DEPTNO, SUM(SAL)
FROM EMP e;
UNION
SELECT '30' AS DEPTNO, SUM(SAL)
FROM EMP e;

--결과 값을 원하는 열로 묶기 : GROUP BY
--SELECT 보고싶은 컬럼(열이름)... ⓐ: 
--FROM 테이블명                   ⓑ
--WHERE 조건들 나열               ⓒ
--GROUP BY 그룹화할 열 이름...(HAVING)ⓓ
--ORDER BY 정렬조건 ⓔ
-- GROUP BY 표현식이 아닙니다.
-- GROUP BY 옆에 오는 컬럼만 SELECT 절에 사용 가능               

--실행 순서
--b->c->group by->having->a->e

SELECT DEPTNO, SUM(SAL)
FROM EMP e
GROUP BY DEPTNO;

--부서별 급여 평균
SELECT DEPTNO, AVG(SAL)
FROM EMP e
GROUP BY DEPTNO;

--부서번호, 직무별 급여 평균
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP e
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

--having:group by 절에 조건을 사용할 때
--부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 부서별 직책 평균 급여

SELECT AVG(SAL)
FROM EMP e
GROUP BY DEPTNO, JOB HAVING AVG(SAL)>=2000
ORDER BY DEPTNO, JOB;

SELECT AVG(SAL)
FROM EMP e
WHERE SAL<=3000
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >=2000
ORDER BY DEPTNO, JOB;

--같은 직무에 종사하는 사원이 3명 이상인 직무와 인원수 조회
SELECT JOB, COUNT(JOB)
FROM EMP e
GROUP BY JOB HAVING COUNT(JOB) >=3
ORDER BY JOB;

--사원들의 입사연도를기준으로 부서별 몇명이 입사했는지 조회
--ex)1991년 10월 3일 2명 들어옴

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS 인원수
FROM EMP e
GROUP BY TO_CHAR (HIREDATE,'YYYY'), DEPTNO
ORDER BY DEPTNO;

-- JOIN: 여러 테이블을 하나의 테이블처럼 사용
--1)내부조인(일치하는 값이 있는 경우)

--EMP 와 DEPT 조인
SELECT *
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO;

--열의 정의가 애매합니다(조인 할 경우 테이블에 동일한 컬럼명이 존재하는 경우)
SELECT ENAME, SAL,d.DEPTNO, DNAME,LOC
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO 

--조인 조건이 없을때 나올 수 있는 모든 조합이 결과로 나옴


SELECT e.ENAME, e.SAL, d.DEPTNO, d.DNAME, d.loc
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO AND e.SAL >=3000;

SELECT e.ENAME, e.SAL,d.DEPTNO, d.DNAME, d.loc
FROM EMP e
WHERE e.SAL >=3000;

--EMP, SALGRADE 조인
SELECT *
FROM EMP e, SALGRADE s 
WHERE e.SAL BETWEEN S.LOSAL AND S.HISAL;


--EMP, EMP 조인(SELF 조인)

SELECT e.EMPNO, e.ENAME, e2.MGR, e2.ENAME AS MGR_NAME
FROM EMP e, EMP e2
WHERE E.MGR = E2.EMPNO;

--2) 외부조인
--(1)왼쪽 외부조인: LEFT OUTER JOIN
--(2)오른쪽 외부조인: RIGHT OUTER JOIN

SELECT e.empno, e.ename, e.mgr, e2.ENAME AS MRG_NAME
FROM EMP e LEFT OUTER JOIN EMP e2 ON E.MGR = E2.EMPNO;

SELECT e.empno, e.ename, e.mgr, e2.ENAME AS MRG_NAME
FROM EMP e RIGHT OUTER JOIN EMP e2 ON E.MGR = E2.EMPNO;

--각 부서별 평균급여, 최대급여, 최소급여, 사원수
--부서번호, 부서명, 평균급여, 최대급여, 최소급여, 사원수

SELECT e.DEPTNO, d.DNAME, MIN(SAL), MAX(SAL), COUNT(*)
FROM EMP e JOIN  DEPT d ON e.DEPTNO = d.DEPTNO 
GROUP BY e.DEPTNO, d.DNAME;


--세 개의 테이블 조인하기
SELECT
    *
FROM
	EMP e1
JOIN EMP e2 ON
	e1.empno = e2.empno
JOIN EMP e3 ON
	e2.empno = e3.empno;

--모든 부서 정보와 사원 정보를 출력
--부서번호, 사원 이름 순으로 정렬하여 출력
--부서번호, 부서명, 사원번호, 사원명, 직무, 급여
--dept 테이블 기준으로 출력

SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.JOB, e.SAL
FROM DEPT d LEFT OUTER JOIN EMP e ON d.DEPTNO = e.DEPTNO
ORDER BY d.DEPTNO, e.ENAME;

SELECT d.DEPTNO, d.DNAME, e.EMPNO, e.ENAME, e.JOB, e.SAL
FROM EMP e RIGHT OUTER JOIN DEPT d ON d.DEPTNO = e.DEPTNO
ORDER BY d.DEPTNO, e.ENAME;

--모든 부서 정보와 사원 정보를 출력
--부서번호, 사원 이름 순으로 정렬하여 출력
--부서번호, 부서명, 사원번호, 사원명, 직무, 급여,LOSAL,HISAL,GRADE
--dept 테이블 기준으로 출력

SELECT
	d.DEPTNO,
	d.DNAME,
	e.EMPNO,
	e.ENAME,
	e.JOB,
	e.SAL,
	e.LOSAL,
	e.HISAL,
	e.GRADE
FROM
	DEPT d
LEFT OUTER JOIN EMP e ON
	d.DEPTNO = e.DEPTNO
LEFT OUTER JOIN SALGRADE s ON
	e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY
	d.DEPTNO,
	e.ENAME;

--서브쿼리
--SQL 문 안에 내부에서 SELECT 문을 사용
--괄호로 묶어서 사용
--메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정해야 한다.

--JONES 사원의 급여보다 높은 급여를 받는 사원 조회
--JONES 급여 알아내기 => 비교

SELECT SAL
FROM EMP e
WHERE ENAME = 'JONES';

SELECT *
FROM EMP e
WHERE SAL > 2975;

SELECT *
FROM EMP e
WHERE SAL > (SELECT SAL FROM EMP e 
WHERE ENAME = 'JONES');

--ALLEN 이 받는 COMM 보다 많은 추가수당을 받는 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	COMM > (
	SELECT
		COMM
	FROM
		EMP e
	WHERE
		ENAME = 'ALLEN');
	
--WARD 사원의 입사일보다 빠른 입사자 조회

SELECT
	*
FROM
	EMP e
WHERE
	HIREDATE >(
	SELECT
		HIREDATE
	FROM
		EMP e
	WHERE
		ENAME = 'WARD');
	
--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 조회
--사원번호, 사원명, 직무, 급여, 부서번호, 부서명, 지역
	
SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	D.DEPTNO,
	D.DNAME,
	D.LOC
FROM
	EMP e
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
WHERE
	E.DEPTNO = 20
	AND E.SAL > (
	SELECT
		AVG(SAL)
	FROM
		EMP);

	
--단일행 서브쿼리: 서브쿼리 실행 결과가 단 하나의 행으로 나오는 서브쿼리
-- 사용가능한 연산자 : <,>, =, !...
	
--다중행 서브쿼리: 서브쿼리 실행 결과가 여러 행으로 나오는 서브쿼리	
-- 사용가능한 연산자 : IN, ANY(SOME), ALL, EXISTS
--                     IN, ANY(SOME): 메인 쿼리의 조건식을 만족하는 서브쿼리가 하나이상
-- ALL(메인쿼리의 조건식을 서브쿼리의 결가 모두가 만족)
-- EXISTS(서브 쿼리의 결과가 존재하면)
	
--단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
--서브쿼리가 여러 개의 결과값을 리턴하는데 단일행 서브쿼리에 사용하는 연산자가 사용된 경우
--SELECT * FROM EMP WHERE SAL >= (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
	
SELECT
	*
FROM
	EMP
WHERE
	SAL IN (
	SELECT
		MAX(SAL)
	FROM
		EMP
	GROUP BY
		DEPTNO);
	
--	IN 사용과 동일한 결과
SELECT
	*
FROM
	EMP
WHERE
	SAL = ANY (
	SELECT
		MAX(SAL)
	FROM
		EMP
	GROUP BY
		DEPTNO);
	
--30번인 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 조회
SELECT
	*
FROM
	EMP
WHERE
	SAL < ANY (
	SELECT
		SAL
	FROM
		EMP
	WHERE DEPTNO = 30);


SELECT
	*
FROM
	EMP
WHERE
	SAL < ALL (
	SELECT
		SAL
	FROM
		EMP
	WHERE DEPTNO = 30);


SELECT
	*
FROM
	EMP
WHERE
	 EXISTS (
	SELECT
		DNAME
	FROM
		DEPT
	WHERE DEPTNO = 20);


--실습1) 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하시오

SELECT e.EMPNO, e.DEPTNO 
FROM EMP e 
WHERE JOB 


--실습2) 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 급여 등급 정보를 출력하는 SQL문을 작성하시오
--(단, 출력할 때 급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원 번호를 기준으로 오름차순으로 정렬하기)
 	
 	
 SELECT e.JOB, e.EMPNO, e.ENAME, e.SAL, d.DEPTNO, d.DNAME
 FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO
 WHERE e.JOB IN
( SELECT JOB FROM EMP e
 FROM EMP e 
 
 
 SELECT e.EMPNO, e.ENAME, e.DNAME, e.HIREDATE , d.LOC, e.SAL, s.GRADE
 FROM EMP e
 JOIN DEPT d ON e.DEPTNO = d.DEPTNO 
 JOIN SALGRADE s ON e.SAL BETWEEN s.LOSAL AND s.HISAL
 WHERE e.SAL > (SELECT AVG(e.SAL)
 FROM EMP e)
 ORDER BY e.SAL DESC, e.EMPNO ASC;


--다중 열 서브쿼리
--부서별 급여 최대값
SELECT *
FROM EMP e 
WHERE 
WHERE (SELECT DEPTNO, MAX(SAL) FROM EMP e
GROUP BY DEPTNO); 


(SELECT DEPTNO, MAX(SAL))
FROM EMP e
GROUP BY DEPTNO;
 
--FROM 절에 사용하는 서브쿼리(인라인 뷰)

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10,
     (SELECT * FROM DEPT) D
WHERE E10.DEPTNO= D.DEPTNO;

--SELECT 절에 사용하는 서브쿼리(스칼라 서브쿼리)
SELECT
	EMPNO,
	ENAME,
	JOB,
	SAL,
	(
	SELECT
		GRADE
	FROM
		SALGRADE s
	WHERE
		E.SAL BETWEEN S.LOSAL AND S.HISAL) AS SALGRADE
FROM
	EMP e;
 	
 

--DML(Data Manipulation Language-데이터 조작 언어)
--SELECT(조회), INSERT(삽입), UPDATE(수정), DELETE(삭제)

--기존 테이블 복제해서 새로운 테이블 생성
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

--새로운 부서 추가
--INSERT INTO 테이블명(열이름1, 열이름2...)
--VALUES(데이터, 데이터...)

INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC)
VALUES(60,'DATABASE', 'BUSAN');

INSERT INTO DEPT_TEMP
VALUES(70,'DATABASE', 'BUSAN');

--값의 수가 충분하지 않습니다
INSERT INTO DEPT_TEMP
VALUES(80,'DATABASE');

INSERT INTO DEPT_TEMP(DEPTNO,DNAME)
VALUES(80,'DATABASE');



--이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
INSERT INTO DEPT_TEMP(DEPTNO,DNAME)
VALUES(800,'DATABASE');


INSERT INTO DEPT_TEMP(DEPTNO,DNAME)
VALUES(90,'DATABASE',NULL);

CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, HIREDATE,SAL,COMM,DEPTNO)
VALUES(8000,'HONG','MANAGER',7982,'2015-03-15,',1000,NULL,50);

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9000,'SUNG','MANAGER',7782,SYSDATE,1200,800,50);

--테이블의 구조만 복사(데이터는 복사하지 않을 때)
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP WHERE 1<>1;

--수정
--UPDATE 테이블명 SET 수정할 내용, ..., ...;
--UPDATE 테이블명 SET 수정할 내용,...,...,WHERE 조건;

UPDATE DEPT_TEMP 
SET LOC = 'BUSAN';

UPDATE DEPT_TEMP 
SET LOC = 'SEOUL'
WHERE DEPTNO = 50;

UPDATE DEPT_TEMP 
SET LOC = 'SEOUL',DNAME='NETWORK'
WHERE DEPTNO = 40;




--삭제(행단위)
--DELETE 테이블명 WHERE 조건
--DELETE FROM 테이블명 WHERE 조건

DELETE DEPT_TEMP
WHERE DEPTNO=20;

DELETE FROM DEPT_TEMP
WHERE DEPTNO=30;


--서브쿼리 + DELETE
--급여등급이 3등급이고 30번 부서의 사원 삭제

DELETE
FROM
	EMP_TEMP
WHERE
	EMPNO IN (
	SELECT
		EMPNO
	FROM
		EMP_TEMP et
	JOIN SALGRADE s ON
		et.sal BETWEEN s.losal AND s.hisal AND s.grade = 3 AND et.deptno=30);
	
--	서브쿼리 + UPDATE
	UPDATE DEPT_TEMP 
	SET (DNAME,LOC)=(SELECT DNAME,LOC FROM DEPT WHERE DEPTNO=40)
	WHERE DEPTNO=40;


--서브쿼리 + INSERT

INSERT
	INTO
	EMP_TEMP (EMPTNO,
	ENAME,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
SELECT
	E1.EMPNO,
	E1.ENAME,
	E1.JOB,
	E1.MGR,
	E1.HIREDATE,
	E1.SAL,
	E1.SAL,
	E1.COMM,
	E1.DEPTNO
FROM
	EMP E1
JOIN SALGRADE s ON
	E1.SAL BETWEEN S.LOSAL AND S.HISAL
	AND S.GRADE = 1;

--실습 1) 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
--(1) EMP테이블의 내용을 이용하여 EXAM_EMP 생성
--(2) DEPT테이블의 내용을 이용하여 EXAM_DEPT 생성
--(3)SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성

CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;

CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;

CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

--실습2) 다음의 정보를 EXAM_EMP 테이블에 입력하시오.


INSERT
	INTO
	EXAM_EMP 
	(EMPNO,
	ENAME,
	MGR,
	HIREDATE,
	SAL,
	COMM,
	DEPTNO)
	VALUES (7201,TEST_USER1,'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);

















                              
                              























