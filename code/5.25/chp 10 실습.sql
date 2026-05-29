Create Table customer_grade_code(
	code varchar(10) primary key,
	grade varchar(10) not null,
	criteria varchar(30)
);

Create Table customers(
	id int primary key,
	name varchar(30) not null,
	phone varchar(13),
	address varchar(60),
	grade_code varchar(10),
	foreign key (grade_code) references customer_grade_code(code)
);

Create Table job_code(
	code varchar(10) primary key,
	job_name varchar(60) not null
);

Create Table employees(
	emp_id int primary key,
	name varchar(30) not null,
	birth_date date,
	phone varchar(13),
	salary int,
	job_code varchar(10),
	hire_date date,
	foreign key (job_code) references job_code(code)
);

Create Table tour_products(
	tour_id int primary key,
	departure_location varchar(60),
	destination_location varchar(60),
	program text,
	start_datetime timestamp,
	end_datetime timestamp,
	min_people int,
	max_people int,
	tour_fee int,
	deposit int,
	departure_confirmed boolean,
	manager_emp_id int,
	foreign key (manager_emp_id) references employees(emp_id)
);

insert into customer_grade_code values
('G01', 'Bronze', '누적 이용금액 0원 이상'),
('G02', 'Silver', '누적 이용금액 100만원 이상'),
('G03', 'Gold', '누적 이용금액 300만원 이상'),
('G04', 'VIP', '누적 이용금액 500만원 이상');

insert into customers values
(1001, '김철수', '010-1111-1111', '서울시 강남구', 'G03'),
(1002, '이영희', '010-2222-2222', '부산시 해운대구', 'G02'),
(1003, '박민수', '010-3333-3333', '대구시 수성구', 'G01'),
(1004, '최지은', '010-4444-4444', '인천시 연수구', 'G04'),
(1005, '정수빈', '010-5555-5555', '광주시 북구', 'G02'),
(1006, '한소희', '010-6666-6666', '제주시 애월읍', 'G01');

insert into job_code values
('J01', '여행상품관리'),
('J02', '예약관리'),
('J03', '고객상담'),
('J04', '해외협력'),
('J05', '마케팅');

insert into employees values
(2001, '김대리', '1988-03-12', '010-9001-0001', 3800000, 'J01', '2020-03-01'),
(2002, '박과장', '1983-07-21', '010-9002-0002', 4500000, 'J02', '2018-06-15'),
(2003, '이주임', '1992-11-05', '010-9003-0003', 3200000, 'J03', '2022-01-10'),
(2004, '최부장', '1979-09-30', '010-9004-0004', 5800000, 'J04', '2015-09-01'),
(2005, '정사원', '1998-05-18', '010-9005-0005', 2800000, 'J05', '2024-02-01');

insert into tour_products values
(3001, '서울', '부산', '부산 해운대 2박3일 여행', '2026-07-01 08:00:00', '2026-07-03 20:00:00',
10, 40, 450000, 100000, true, 2001),
(3002, '서울', '제주', '제주도 힐링 패키지', '2026-07-10 09:00:00', '2026-07-13 18:00:00',
8, 30, 780000, 200000, true, 2002),
(3003, '대전', '강릉', '강릉 바다 여행', '2026-08-05 07:30:00', '2026-08-07 19:00:00',
12, 35, 390000, 80000, false, 2004),
(3004, '부산', '경주', '경주 문화유산 투어', '2026-08-15 08:30:00', '2026-08-16 21:00:00',
15, 45, 320000, 700000, true, 2003),
(3005, '서울', '전주', '전주 한옥마을 먹거리 여행', '2026-09-01 09:00:00', '2026-09-02 20:00:00',
6, 25, 250000, 50000, false, 2005);

-- ---------
-- 전체 확인 
-- ---------
table job_code;

-- join
select
	e.emp_id,
	e.name,
	j.job_name,
	e.salary
from employees as e
join job_code as j
	on e.job_code = j.code;

table customer_grade_code;
table customers;

-- join
select
	c.id,
	c.name,
	c.phone,
	g.grade,
	g.criteria
from customers c
join customer_grade_code g
	on c.grade_code = g.code;

-- Tour + Manager JOIN
select
	t.tour_id,
	t.destination_location,
	t.program,
	e.name as manager_name
from tour_products t
join employees e
	on t.manager_emp_id = e.emp_id;

-- where join
select
	t.program,
	t.tour_fee,
	e.name
from tour_products t
join employees e
	on t.manager_emp_id = e.emp_id
where t.tour_fee >= 400000;

-- order by
select
	name, salary
from employees
order by salary desc;

-- Multiple JOINS
select
	t.program,
	t.destination_location,
	e.name as manage,
	j.job_name
from tour_products t
join employees e
	on t.manager_emp_id = e.emp_id
join job_code j
	on e.job_code = j.code;