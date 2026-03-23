/*
[Entities / 개체]
- Professor

[Properties / 속성]
- id                 (SERIAL) -- 자동으로 증가하는 숫자
- name               (VARCHAR(30))
- salary			 (VARCHAR(50))
- salary_level		 (NUMERIC)
- hire_date		     (DATE)
*/

CREATE TABLE professor (
id serial,
name varchar(30),
salary varchar(50),
salary_level numeric,
hire_date date
);

-- 데이터 삽입하기
insert into professor (name, salary, salary_level, hire_date)
values
('홍길동', 10000, 1, '2020-01-01'),
('김철수', 30000, 2, '2020-02-02'),
('박기영', 50000, 3, '2020-03-03'),
('최이슬', 70000, 4, '2020-04-04'),
('김말숙', 90000, 5, '2020-05-05');

-- 데이터 검색하기
select * from professor;

select name, salary from professor order by salary desc;
select name, salary_level from professor where salary_level between 2 and 4 order by hire_date asc;