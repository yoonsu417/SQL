SELECT * FROM market_db.buy;

select num, mem_id from buy;

select * from buy where price >200;

-- 2개 이상의 조건
select * from buy where price > 80 and amount >2;

-- 조건 여러개 추가
select * from buy where price > 50 and amount > 2 and group_name = '디지털';
select * from buy where price > 50 or amount > 2 or group_name = '디지털';
-- and, or의 차이로 인해 행의 개수가 달라짐, join 잘못하면 중복되는 값이 발생할 수 있음

select * from buy;

-- group by 이용하여 집계함수 사용
-- sum, avg, min, max, count, count(distinct)
-- 집계함수를 group by 하게 되면 결과값은 집계함수 값으로 나옴
-- 기존 테이블과 달라짐

select mem_id, sum(price) from buy group by mem_id;

select * from buy;

select mem_id
	, sum(price)
    , count(mem_id)
    , count(distinct(mem_id))
    from buy
    group by mem_id;
    
select mem_id
	, prod_name
    , sum(price)
    , sum(amount)
	from buy
    group by mem_id, prod_name;
    
select prod_name
	, mem_id
    , sum(price)
    , sum(amount)
    from buy
    group by prod_name, mem_id;

# as를 써서 컬럼명 변경    
select mem_id as user_id, sum(price * amount) '총 구매 금액'
	from buy
    group by mem_id;
    
select sum(price) from buy;
select avg(amount) from buy;

-- count는 널값 제외
select count(*) from buy;
select count(group_name) from buy;

select mem_id
	, sum(price * amount) as '총 구매 액'
    from buy
    group by mem_id
    having sum(price*amount) > 1000;
-- 총 구매금액이 1000 초과
-- group by는 having 절을 사용해야 함
-- group by의 조건 > having

select mem_id
	, sum(price*amount) as total
    from buy
    group by mem_id
    having total > 1000
    order by total desc;
    
-- insert, delete, create table

-- 테이블 만들기
create table bda_sql(mem_id int, mem_name char(5), age int);
select * from bda_sql;

insert into bda_sql values(1, '홍길동', 20);
select * from bda_sql;

-- 불가
insert into bda_sql values(2, '박길동');

select * from bda_sql;

-- 특정 열을 추가할 때 자동으로 index 만들어서 추가
-- auto_increment

create table bda_sql2(
	mem_id int auto_increment primary key,
    mem_name char(5),
    age int);
    
select * from bda_sql2;

insert into bda_sql2 values(null, '홍길동', 20);
insert into bda_sql2 values(null, '박길동', 21);
insert into bda_sql2 values(null, '정길동', 23);

select * from bda_sql2;

alter table bda_sql2 auto_increment = 1000;
insert into bda_sql2 values(null, '이길동', 25);

select * from bda_sql2;

create table bda_sql3(
	mem_id int auto_increment primary key,
    mem_name char(5),
    age int);
    
select * from bda_sql3;

insert into bda_sql3 select mem_id, mem_name, age from bda_sql2;
select * from bda_sql3;

select mem_id, mem_name, age from bda_sql2;

select mem_name, avg(age) from bda_sql2 group by mem_name;
