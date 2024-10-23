SELECT * FROM employees;

--where
SELECT *
FROM  employees
WHERE employee_id = 100;




--SQL 연산자



-- David인 직원의 정보
SELECT *
FROM employees
WHERE first_name = 'David';


--id가 105 이상인 직원
SELECT *
FROM  employees
WHERE employee_id >= 105;

--salary가 10,000 이상이고 20,000 이하인 직원의 정보
SELECT *
FROM  employees
WHERE salary BETWEEN 10000 AND 20000;

--salary가 10,000  17,000  24,000 인 직원 정보
SELECT *
FROM  employees
WHERE salary IN(10000,17000,24000);

--job_id 값이 AD로 시작하는 모든(%) 데이터를 출력
SELECT *
FROM  employees
WHERE job_id LIKE 'AD%';

-- AD로 시작하면서 뒤에 따라오는 문자열이 3자리인 데이터 출력
SELECT *
FROM  employees
WHERE job_id like 'AD___';

-- manager_id 가 null 값인 직원 정보
SELECT *
FROM  employees
WHERE manager_id = null;


-- salary가 4000을 초과하면서 job_id가 IT_PROG인 값을 조회
SELECT*
FROM  employees
WHERE salary >4000 AND job_id = 'IT_PROG';

--salary가 4000을 초과하면서 job_id가 IT_PROG 이거나 FI_ACCOUNT인 경우
SELECT *
FROM  employees
WHERE salary >4000
AND job_id = 'IT_PROG'
OR  job_id = 'FI_ACCOUNT';

--employee_id가 105가 아닌 직원만 출력
SELECT *
FROM  employees
WHERE employee_id <> 105;



-------------------------------------------------------------
--SQL 함수


--문자
--last_name 을 소문자와 대문자로 각각 출력하고, email 의 첫 번째 문자는 대문자로 출력
SELECT last_name,
lower(last_name) Lower적용,
upper(last_name) Upper적용,
email,
initcap(email) Intcap적용
from employees;

--job_id 데이터 값의 첫째 자리부터 시작해서 두개의 문자를 출력
SELECT job_id, substr(job_id, 1,2)
FROM  employees;

--글자 바꾸기(표시로만)
--job_id 문자열 값이 AXXOUNT 이면 ACCNT로 출력
SELECT job_id, replace(job_id, 'ACCOUNT', 'ACCNT')적용결과
FROM  employees;

--first_name에 대해 12자리의 문자열 자리를 만들되 first_name의 데이터 값이 12 보다 작으면 왼쪽에서 부터 *를 채워 출력
SELECT first_name, lpad(first_name, 12, '*')lpad적용결과
FROM  employees;


--자르기 (LTRIM, RTRIM, TRIM)
--
SELECT 'start' || '    - space -   ' || 'end'
from dual;

--좌우 공백제거
SELECT 'start' || trim( '    - space -   ') || 'end'
from dual;
--dual 테이블은 더미이다 /공백 제거



--           자리 올림           --
--salary를 30일로 나눈 후 나눈 값의 소수점 첫째 자리, 소수점 둘째 자리, 정수 첫째 자리에서 반올림한 값을 출력
SELECT salary,
               salary/30  일급,
               round(salary/30, 0 ) 적용결과_0,
               round(salary/30, 1 ) 적용결과_1,
               round(salary/30, -1 ) 적용결과_마이너스1
from employees;


--위의 내용을 절삭하여 출력
SELECT salary,
               salary/30  일급,
               trunc(salary/30, 0 ) 적용결과_0,
               trunc(salary/30, 1 ) 적용결과_1,
               trunc(salary/30, -1 ) 적용결과_마이너스1
from employees;


---           날짜 계산           ---
--오늘 날짜, 더하기1, 빼기1, 특정날짜 빼기, 시간더하기
SELECT to_char (sysdate, 'YY/MM/DD/HH24:MI') 오늘날짜,
             sysdate + 1 더하기_1,
             sysdate - 1 빼기_1,
             to_date('20241205') - to_date('20021201') 날짜빼기,
             sysdate + 13/24 시간더하기
from dual;

--두 날짜 사이에 개월 수 계산
SELECT sysdate, hire_date, months_between(sysdate, hire_date) 적용결과
from employees
where department_id= 100;


-- 월 날짜 더하기
SELECT hire_date,
            add_months(hire_date, 3) 더하기_적용결과,
            add_months(hire_date, -3) 빼기_적용결과
from employees
where department_id = 100;

--Null값 출력
SELECT salary * commission_pct
from employees
ORDER by commission_pct;

--Null 값 처리 NVL
SELECT salary * NVL (commission_pct, 1)
from employees
order by commission_pct;

-- DECODE 사용
SELECT first_name,
               last_name,
               department_id,
               salary 원래_급여,
               decode ( department_id, 60, salary*1.1 , salary) 조정된_급여,
               decode ( department_id, 60, '10%인상', '미인상') 인상여부
from employees;


-- DECODE를 case 로 변환
SELECT first_name,
               last_name,
               department_id,
               salary 원래_급여,
               case  department_id  when 60 then  salary*1.1  else salary end 조정된_급여,
               case  department_id  when 60 then  '10%인상'  else '미인상' end 인상여부
from employees;







