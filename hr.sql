--employees에서 전체내용 조회
SELECT * 
FROM EMPLOYEES e;

--first name, last name, job_id 조회
SELECT FIRST_name, LAST_name, job_id
FROM EMPLOYEES e;

--사원번호가 176인 사람의 LAST NAME 과 DEPARTMENT_ID 조회
SELECT LAST_NAME , DEPARTMENT_ID
FROM EMPLOYEES e
WHERE EMPLOYEE_ID = 176;
--연봉이 12000이상 되는 직원들의 LAST_NAME과 SALARY 조회
SELECT LAST_NAME , SALARY
FROM EMPLOYEES e
WHERE SALARY> = 12000;
--연봉이 5000에서 12000의 범위 이외인 사람들의 LAST_NAME과 SALARY 조회
SELECT LAST_NAME , SALARY
FROM EMPLOYEES e
WHERE SALARY< 5000 OR SALARY> 12000;

--LAST NAME에 u 가 포함되는 사원들의 사번, last_name 조회
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES e
WHERE LAST_NAME LIKE '%u%';


--LAST_NAME에 a 혹은 e 글자가 들어있는 사원들의 사번, last_name 조회 후 last_name 오름차순 조회
SELECT EMPLOYEE_ID, LAST_NAME 
FROM EMPLOYEES e
WHERE LAST_NAME LIKE '___a%';

--LAST_NAME에 a와 e 글자가 들어있는 사원들의 사번, last_name 조회 후 last_name 오름차순 조회

SELECT EMPLOYEE_ID, LAST_NAME 
FROM EMPLOYEES e
WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%'
ORDER BY LAST_NAME ASC;

--LAST NAME 에 a와 e 글자가 들어있는 사원들의 사번,last name 조히 후 last name 오름차순 조회
--davies,devias

SELECT EMPLOYEE_ID, LAST_NAME 
FROM EMPLOYEES e
WHERE LAST_NAME LIKE '%a%e%' OR LAST_NAME LIKE '%e%'
ORDER BY LAST_NAME ASC;

--
SELECT *
FROM EMPLOYEES e ;

--매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES e 
WHERE MANAGER_ID IS NULL;

--ST_CLERK 인 JOB_ID를 가진 사원이 없는 부서 ID 조회(단, 부서번호가 NULL인 사원 제외)
SELECT DISTINCT DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE JOB_ID != 'ST CLERK' AND DEPARTMENT_ID IS NOT NULL;

--COMMISSION_PCT가 NULL이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT
--를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID를 조회
SELECT DEPARTMENT_ID, FIRST_NAME, JOB_ID, SALARY * COMMISSION_PCT AS COMMISSION
FROM EMPLOYEES e
WHERE COMMISSION_PCT IS NOT NULL;

--NULL * 숫자= NULL
SELECT DEPARTMENT_ID, FIRST_NAME, JOB_ID,SALARY, SALARY * COMMISSION_PCT AS COMMISSION
FROM EMPLOYEES e

--FIRST_NAME 이 'Curtis'인 사원의 first_name, last_name,email, phon_numer, job_id 를
--조회한다. 단 job_id 결과는 소문자로 출력한다
SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, lOWER(JOB_ID)
FROM EMPLOYEES e
WHERE FIRST_NAME = 'Curtis';

--부서번호가 60,70,80,90 인 사원들의 employee_id,first_name,hire_date,job_id 조회
--단, job_id가 IT_PROG인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, REPLACE (JOB_ID, 'IT_PROG', '프로그래머')
FROM EMPLOYEES e
WHERE DEPARTMENT_ID IN (60,70,80,90);
--JOB_ID RK AD_PRES, PU_CLERK 인 사원들의 employee_id,first_name,job_id 조회
--단, 사원명은 FIRST_NAME과 LAST_NAME을 공백을 포함하여 연결
--'ABC', 'DEF' => 'ABC DEF'
SELECT EMPLOYEE_ID, FIRST_NAME||' ' ||LAST_NAME AS NAME, JOB_ID
FROM EMPLOYEES e
WHERE JOB_ID IN ('AD_PRES', 'PU_CLERK');

--실습 4: 부서 80의 각 사원에 대해 적용 가능한 세율을 표시하시오

SELECT LAST_NAME,
SALARY, 
CASE trunc(salary/2000,0)
    WHEN 0 THEN '0%'
    WHEN 1 THEN '9%'
    WHEN 2 THEN '20%'
    WHEN 3 THEN '30%'
    WHEN 4 THEN '40%'
    WHEN 5 THEN '42%'
    WHEN 6 THEN '44%'
    ELSE '45%'
END AS TAX_RATE
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 80;

--최대연봉 - 최소연봉 차이 조회

--매니저로 근무하는 사원들의 총 수 조회(매니저번호 중복 제거)


SELECT MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES e;

SELECT COUNT(DISTINCT MANAGER_ID)
FROM EMPLOYEES e;

--부서별 직원 수 구하기(부서번호의 오름차순 출력)
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID; 
--부서별 평균 급여
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;
--동일한 직무(job_id)를 가진 사원들의 총 수 조회

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES e
GROUP BY DEPTNO;

--매니저가 관리하는 사원들 중에서 최소급여 조회
--매니저가 관리하는 사원들 중에서 최소급여가 6000 미만인 최소급여는 제외
--매니저가 없는 사원 제외
SELECT MANAGER_ID, MIN(SALARY)
FROM EMPLOYEES e
WHERE MANAGER_ID IS NOT NULL 
GROUP BY MANAGER_ID HAVING MIN(SALARY) >=6000
ORDER BY MANAGER_ID; 

-- 자신이 담당 매니저의 고용일보다 빠른 입사자 찾기
SELECT
	e.EMPLOYEE_ID AS 내사원번호,
	e.hire_date AS 내입사일,
	e.manager_id AS 매니저번호,
	e2.HIRE_DATE AS 매니저입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.manager_id = E2.EMPLOYEE_ID AND e.hire_date<e2.hire_date;

--도시 이름이 T로 시작하는 지역에 사는 사원들의 사번,last_name, 부서번호 조회
--(도시명은 Locations 테이블에)
SELECT
	*
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
WHERE
	l.CITY LIKE '1%';

--위치 아이디가 1700인 사원들의 last_name, 부서번호, 연봉 조회
SELECT e.LAST_NAME, e.DEPARTMENTS, e.SALARY 
FROM EMPLOYEES e JOIN DEPARTMENTS = d.DEPARTMENT_ID
WHERE d.LOCATION_ID = 1700;

--부서명, 위치ID, 각 부서별 사원 수, 각 부서별 평균 연봉 조회
--평균 연봉은 소수점 2자리까지만 표현
SELECT d.DEPARTMENT_NAME,d.LOCATION ,DISTINCT , AVG(SALARY)
FROM EMPLOYEES e 

--Excutive 부서에 근무하는 사원들의 부서번호, last_name, job_id 조회
SELECT
	d.DEPARTMENT_ID,
	e.LAST_NAME,
	e.JOB_ID
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
	AND d.DEPARTMENT_NAME = 'Excutive';

--각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 많은 연봉을 받는 사원이 존재하는
--사원들의 이름 조회(이름은 first_name과 last_name을 결합하여 하나로 나오게 하기)
--부서번호, 결합된 이름, salary, hire_date 출력
SELECT
    DISTINCT e.department_id AS 부서번호,
	e.FIRST_NAME || ' ' || e.last_name AS "내이름",
	e.SALARY AS 내급여,
	e.hire_date AS 내입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.DEPARTMENT_ID = E2.DEPARTMENT_ID
	AND e.salary <E2.SALARY AND e.hire_date<E2.HIRE_DATE;



