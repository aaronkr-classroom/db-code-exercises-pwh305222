/*
[Entities / 개체]
- Users
- Orders

[Users Properties / 속성]
- user_id            (SERIAL) -- 자동으로 증가하는 숫자
- username			 (VARCHAR(50))
- email			     (VARCHAR(100))
- join_date		     (DATE)

[Orders Properties / 속성]
- order_id           (SERIAL) -- 자동으로 증가하는 숫자
- user_id			 (INT)
- product_name		 (VARCHAR(100))
- order_date		 (TIMESTAMP)
- price              (INT)
*/

CREATE TABLE users (
user_id serial,
username varchar(50),
email varchar(100),
join_date date
);

CREATE TABLE orders (
order_id serial,
user_id int,
product_name varchar(100),
order_date timestamp,
price int
);

-- 데이터 삽입하기
insert into users (username, email, join_date)
values
('홍길동', 'abc@naver.com', '2020-01-01'),
('김철수', 'def@naver.com', '2020-02-02'),
('박기영', 'ghi@naver.com', '2020-03-03'),
('최이슬', 'jkl@naver.com', '2020-04-04'),
('김말숙', 'mno@naver.com', '2020-05-05');

insert into orders (user_id, product_name, order_date, price)
values
(1, '컴퓨터', '2020-01-01', 10000),
(2, '노트북', '2020-02-02', 20000),
(3, '마우스', '2020-03-03', 30000),
(4, '키보드', '2020-04-04', 40000),
(5, '모니터', '2020-05-05', 50000);
-- 데이터 검색하기
select * from users;
select * from orders;

select username, email from users order by email desc;
select product_name, price from orders where price between 20000 and 40000;