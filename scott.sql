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








