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




