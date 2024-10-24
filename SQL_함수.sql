
--CASE 문
select employee_id, first_name, last_name, salary,
case
         when salary >= 9000 then '상위급여'
         when salary BETWEEN 6000 AND 8999 THEN '중위급여'
         ELSE '하위급여'
end as 급여동급
from employees
where job_id = 'IT_PROG';


-- 순위 매기기 3가지 종류
select employee_id,
            salary,
            RANK()                   OVER(ORDER BY salary DESC) RANK_급여, 
            DENSE_RANK()     OVER(ORDER BY salary DESC)DENSE_RANK_급여,
            ROW_NUMBER()  OVER(ORDER BY salary DESC) ROW_NAUMBER_급여
from employees;


--그룹함수
SELECT sum(salary) 합계, AVG(salary) 평균, sum(salary)/count(salary) 계산된_평균
from employees;


select MAX(salary) 최대값, MIN(salary) 최소값, 
           MAX(first_name) 최대문자, MIN(first_name) 최소문자 
from employees;

--그룹화
SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

--조건(having) 그룹화
SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;


--****조인
--동등 조인
select a.employee_id, a.department_id, b.department_name, c.location_id, c.city
from employees A, departments B, locations C
where a.department_id = b.department_id
and b.location_id = c.location_id;

--외부 조인
select  a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
from employees A, departments B
where a.department_id = b.department_id(+)
order by a.employee_id;

--자체 조인
SELECT a.employee_id, a.first_name, a.last_name, a.manager_id, (b.first_name || ' ' || b.last_name) manager_name
FROM employees A, employees B
WHERE a.manager_id = b.employee_id
ORDER BY a.employee_id;


--**집합 연산자**
--합집합 UNION, UNIONALL
SELECT department_id
from employees
UNION
SELECT department_id
from departments;

SELECT department_id
from employees
UNION ALL
SELECT department_id
from departments;


--교집합 MINUS
SELECT department_id
from employees
INTERSECT
SELECT department_id
from departments
order by department_id;


--차집합 INTERSET
SELECT department_id
from departments
MINUS
SELECT department_id
from employees;





