SELECT * FROM bda_sql3;
select * from bda_sql;

-- delete
delete from bda_sql2;

-- 조건을 걸어 지울 수 있음
delete from bda_sql3 where mem_name = '홍길동';

select * from bda_sql3;

select * from bda_sql3
	where mem_name like '%길동'
    and age = '23';
    
delete from bda_sql3
	where mem_name like '%길동'
    and age = '23';

select * from bda_sql3;

-- tinyint: -3자리수 ~ 3자리수
-- smallint: -5자리수 ~ 5자리수
-- int: -억 ~ +억
-- bigint: +- 조, 경

create table bda_sql6(
	tinyint_col tinyint,
    small_col smallint,
    int_col int,
    bigint_col bigint);
    
select * from bda_sql6;

insert into bda_sql6 values(123, 12345, 12345678, 123456789011);

-- 범위 넘어가게 되는 경우
insert into bda_sql6 values(123,12345,12345678,1234567891011231231231231);

-- 0부터 시작하게 지정: unsigned
create table bda_sql8(
	tinyint_col tinyint unsigned);
    
select * from bda_sql8;

insert into bda_sql8 values(123);

select * from bda_sql8;

-- 문자형
-- char: 바이트 수 1~ 255
-- varchar: 바이트 수 1 ~ 16383

create table bda_sql10(
	mem_id varchar(10));
    
select * from bda_sql10;

insert into bda_sql10 values('안녕하세요');

-- 대량의 리뷰 데이터 타입
-- Text Text, longText

-- Blob형식
-- Blob, LongBlob

-- 실수형
-- Float: 4 바이트 소수점 아래 7자리
-- Double: 8 바이트 소수점 아래 15자리

-- 날짜형
-- Date: YYYY-MM-DD 형식
-- Time: HH:MM:SS
-- Datetime: YYYY-MM-DD HH:MM:SS

-- 변수 만들기
-- set @변수이름 = 변수 값;
-- select @변수이름

set @limit_amount = 3;
select @limit_amount;
select * from buy;
select * from buy where amount > limit_amount;

select b.mem_id
	,m.mem_number
    ,m.addr
    ,b.price
    from buy as b
		inner join member as m
        on b.mem_id = m.mem_id
	where b.mem_id ='BLK';

