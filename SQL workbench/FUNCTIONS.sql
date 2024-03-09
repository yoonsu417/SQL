select * from member;

-- 자료형 변환
select phone1, phone2 from member;

-- 두개를 합치는 경우
select phone1 + phone2 from member;

-- 문자열 + 문자열 더해야하는 경우
select cast(phone1 as char(5)) + cast(phone2 as char(10)) from member;

-- concat 함수 사용
select concat(cast(phone1 as char(5)), cast(phone2 as char(20))) from member;

-- null이 존재할 경우
select ifnull(phone1, '02') from member;
select * from member;

-- 문자열 다루는 함수 중 lower, upper
select lower(mem_id), mem_id from member;

-- 문자열 오른쪽 왼쪽 공백제거
-- trim, rtrim, ltrim
select ltrim('    abc');
select rtrim('abc     ');

-- 문자열 함수 중 substring(시작, 끝) 지정된 범위의 문자열을 반환
select * from member;
select substring(mem_name, 3, 6) from member;

-- replace 특정문자를 다른 문자로 대체
select replace(addr, '서울', '서울특별시') from member;

-- 문자열 데이터 중 시계열 데이터
select debut_date from member;

select debut_date
		, year(dedut_date)
        , month(debut_date)
        , day(debut_date)
        from member;

-- %Y와 %y는 다름
select date_format(debut_date, '%Y%m%d') from member;
select date_format(debut_date, '%y%m%d') from member;

-- count
select count(*), count(phone1) from member; -- null 제외

select * from buy;

select mem_id, count(*) from buy
group by(mem_id);

select count(mem_id) from buy;
select count(distinct(mem_id)) from buy;

USE classicmodels;

select * from classicmodels.payments;

select count(customerNumber) from classicmodels.payments;
select count(distinct customerNumber) from classicmodels.payments;

select count(customerNumber) from classicmodels.payments
	group by customerNumber
    having count(customerNumber)>1;
    
select * from payments;
select * from customers;

select customerNumber, count(orderNumber) from orders
	group by customerNumber;
    
select count(*) from classicmodels.orders
where customerNumber = '124';

select * from customers as c
		left outer join classicmodels.orders as o
	on c.customerNumber = o.customerNumber;
    
select count(productCode) from orderdetails;

select count(distinct productCode) from orderdetails;

select * from orderdetails;
select count(distinct productCode) from orderdetails;

select * from orders;

select * from customers as c
		left outer join orders as o
	on c.customerNumber = o.customerNumber
    left outer join orderdetails as ot
    on ot.orderNumber = o.orderNumber;