

select employee_id, first_name, last_name
from employees;

--employee_id 를 기준으로 내림차순 정렬

select employees_id, first_name, last_name
from employees
order by employees_id desc;


-- job_id 출력
select DISTINCT job_id
from employees;


--필드명 변경
select employee_id  사원번호, first_name  이름, last_name  성
from employees;


--first_name, last_name 같이 불여서 출력 (||)
select employee_id  사원번호  , first_name|| ' ' || last_name 사원이름
from employees;


--email 포함 출력
select employee_id  사원번호  , first_name|| ' ' || last_name 사원이름,  email || '@company' 이메일
from employees;





