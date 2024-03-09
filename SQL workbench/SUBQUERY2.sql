SELECT * FROM member;
SELECT * FROM buy;

SELECT * FROM member as m
		left outer join buy b
    on m.mem_id = b.mem_id
    where m.mem_id not in (select mem_id from buy where price = 15);
    
-- any
-- 다중행 서브쿼리
-- 서브쿼리 결과값이 여러개여도 일치하는 모든 행을 메인 주 쿼리에서 실행하여 검색한 것을 반환

select * from member as m
		where mem_id = any(
    select mem_id from buy where price = 15);
    
select * from member as m
	where mem_id in('GRL','APN');
    
-- < any 서브쿼리 결과의 최솟값
select * From member as m
		where mem_id < any(
	select mem_id from buy where price = 15);
    
-- > any 서브쿼리 결과의 최댓값
select * from member as m
		where mem_id > any(
	select mem_id from buy where price = 15);
    
-- exist문
-- 조건의 결과값이 있는지 없는지 확인해 있으면 true, 없으면 false 반환

select * from member as m
		where exists (
	select mem_id from buy where price = 15);
    
select * from member as m
		where not exists (
	select mem_id from buy where prie = 15);
    
-- 서브쿼리가 where 절이 아니라 from 문 안에 들어가는 경우
-- inline view 사용

-- inner join 비교
select m.mem_name, m.mem_id, b.price, b.prod_name from member m
inner join buy b
on m.mem_id = b.mem_id
where price > 50;

-- from 절에 서브쿼리
select m.mem_name, m.mem_id, b.price, b.prod_name from member m
inner join (select price, prod_name, mem_id from buy where price > 50)
as b on b.mem_id = m.mem_id;

-- scalar subquery
-- 반드시 1개의 행을 반환

select mem_name
	, (select mem_id from buy b where b.mem_id = m.mem_id and b.price > 500) as over_price_mem_id
    , (select prod_name from buy where prod_name = '에어팟')
    , '에어팟2' -- 에어팟 문자열 데이터
    , (select prod_name from buy b where b.mem_id = m.mem_id and prod_name = '에어팟') as '에어팟'
    from member m;
    
-- group by를 이용한 inline view

select * from member;

select b.mem_id
	, sum(b.price)
    , sum(b.amount)
    from buy b
		group by b.mem_id;
        
select m.addr, m.mem_name, c.price_sum, c.amount_sum, c.mem_id
from member m
inner join (select b.mem_id
					, sum(b.price) as price_sum
                    , sum(b.amount) as amount_sum
                    from buy b
                    group by mem_id) as c on m.mem_id = c.mem_id;
