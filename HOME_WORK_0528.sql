 --EMPLOYEES 테이블에서 CEO에게 보고하는 직원의 모든 정보를 출력하는 SELECT문을 작성하시오.
 SELECT * FROM EMPLOYEES
 WHERE MANAGER_ID IS NOT NULL;
 
 
-- EMPLOYEES 테이블에서 Accounting 부서에서 근무하는 직원과 같은 업무를 하는 직원의 이름, 
--업무명를 출력하는 SELECT문을 작성하시오.
SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Accounting');


--직급이 'ST_MAN'인 직원이 받는 급여들의 최소 급여보다 많이 받는 직원들의 이름과 급여를 
--출력하되 부서번호가 20번인 직원은 제외한다. 

--EMPLOYEES 테이블에서 Valli라는 이름을 가진 직원과 업무명 및 월급이 같은 사원의 모든 정보 
--를 출력하는 SELECT문을 작성하시오. (결과에서 Valli는 제외)

--EMPLOYEES 테이블에서 월급이 자신이(‘Valli’) 속한 부서의 평균 월급보다 높은 사원의 부서번호, 
--이름, 급여를 출력하는 SELECT문을 작성하시오.