select * from buy;
select * from member
where mem_id ='APN';

select * from member
where mem_id = (select mem_id from member where mem_id = 'APN');


## 단일값과 다중값
select * from member
where mem_id = (select mem_id from member); # = 같다라는 건 두 개의 값이 하나씩 동일하게 매핑 되어야 하는데 여러 값이 생기니깐 문제가 발생 ( = 단일값)

select mem_id from member; #다중값 

## 다중값을 사용하게 된다면
select * from member
where mem_id in  (select mem_id from member); 

select * from member
where mem_id = (select mem_id from member where mem_number = 4 and height >163);



select * from buy
where price > 500;


select * from member
where mem_id = (select mem_id from buy where price >500);

select * from member
where mem_number = 4 and height >163;

## 다중행 연산자 
## in : 서브쿼리 결과에 존재하는 값에 같은 조건 검색
## any : 서브쿼리 결과에 존재하는 어느 하나의 값이라도 만족하는 조건 검색 
## exists : 서브쿼리가 결과 만족하는 값이 존재하는 여부 확인
## all : 서브쿼리 겨로가에 존재하는 모든 값 만족하는 조건 검색
## not 을 붙이면 반대의 개념이 된다.

select * from member
where mem_id in (select mem_id from member);


select * from member
where mem_id not in (select mem_id from member where height > 163);
# not을 붙이면 그 외에 값으로 출력이 된다.



select * from member
where mem_id in (select mem_id from buy where price>30); # 중복된 값이 나왔어도 결국 member는 3개의 유니크한 값으로 출력이 되었다.


select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id
    where mem_name = (select mem_name from member where height =168); # member
    

select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id
    where m.mem_id = (select mem_id from buy where mem_id = 'GRL');    
    
select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id
    where b.mem_id = (select mem_id from buy where mem_id = 'GRL');    



select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id
    where m.mem_id = (select mem_id from buy where price = 15 and amount =2);    




select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id 
    where m.mem_id = (select mem_id from buy where price = 15 and amount < 4);
    

## 조인을 한 상태로 다중값을 서브쿼리로 만들면 어떤 값이 나올까?
select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id 
    where m.mem_id in (select mem_id from buy where price = 15);


select * from member as m
	left outer join buy b
    on m.mem_id = b.mem_id 
    where b.mem_id in (select mem_id from buy where price = 15);

## left outer join 위치를 바꿔서 동일하게 서브쿼리를 진행!

select * from buy as b
	left outer join member m
    on m.mem_id = b.mem_id 
    where b.mem_id in (select mem_id from buy where price = 15);

select * from buy as b
	left outer join member m
    on m.mem_id = b.mem_id 
	where b.mem_id in (select mem_id from member where height = 167);