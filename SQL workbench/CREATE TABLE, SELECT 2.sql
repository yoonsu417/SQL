DROP DATABASE IF EXISTS market_db; -- 만약 market_db가 존재하면 우선 삭제한다.
CREATE DATABASE market_db;

USE market_db;
CREATE TABLE member -- 회원 테이블
( mem_id  		CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  mem_name    	VARCHAR(10) NOT NULL, -- 이름
  mem_number    INT NOT NULL,  -- 인원수
  addr	  		CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  phone1		CHAR(3), -- 연락처의 국번(02, 031, 055 등)
  phone2		CHAR(8), -- 연락처의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 평균 키
  debut_date	DATE  -- 데뷔 일자
);
CREATE TABLE buy -- 구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   mem_id  	CHAR(8) NOT NULL, -- 아이디(FK)
   prod_name 	CHAR(6) NOT NULL, --  제품이름
   group_name 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 가격
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (mem_id) REFERENCES member(mem_id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

SELECT * FROM member;
SELECT * FROM buy;


SELECT * FROM member;

-- 에이핑크 키 이상인 경우 멤버를 추출
select mem_id, mem_name, height from member where height > 164;

-- 에이핑크 키보다 더 큰 멤버들만 추출
select mem_id, mem_name, height from member where height > (select height from member where mem_name = '에이핑크');

-- where 조건 안에서 내가 원하는 테이블만 가져와서 비교하여 출력
-- 서브쿼리의 경우 조인과 많이 사용
-- 내가 원하는 테이블들을 결합하여서 작동, 전체 다 가져오게 되면 무거워진다.
-- 서브쿼리 형태로 내가 원하는 테이블 형태를 따로 정리해서 1차로 같이 조인, where 조건 비교 하면 더 효율적인 작동이 가능함

-- 소녀시대가 서울 addr, 소녀시대와 같은 addr인 멤버의 아이디와 네임 출력
select mem_id, mem_name from member where addr = (select addr from member where mem_name = '소녀시대');

-- 소녀시대의 phone1과 동일한 멤버 아이디와 네임 출력
select mem_id, mem_name, phone1, phone2 from member where phone1 = (select phone1 from member where mem_name ='소녀시대');

-- 서브쿼리가 두개의 테이블 구조로 되어있다면 
select mem_id, mem_name, phone1 from member where phone1 = (select phone1 from member where mem_name = '소녀시대');

-- select의 여러가지 문법
-- select
-- from
-- where
-- group by
-- having
-- order by
-- limit

-- 순서 지켜야 함 !

-- order by 정렬, 내림차순, 오름차순 개념으로 정렬, 정렬에 대한 기준이 1개인가 2개인가
select * from member;

-- 날짜순 정렬
select * from member order by debut_date;

-- 오름차순 asc, 내림차순 desc
select * from member order by debut_date DESC;

select * from member where addr = '서울' order by debut_date;

select * from member where addr = '서울' order by debut_date DESC, height ASC;
select * from member where addr = '서울' order by height ASC, debut_date DESC;

-- limit: 출력하는 개수 제한
-- limit 시작, 개수: limit 1,3 -> 1번 부터 시작해서 3개

select * from member limit 3;

select mem_id
	, mem_name
    from member
    where addr = '서울'
    order by debut_date DESC
    limit 3;
    
select * from member limit 1,3;
    
 -- 중복제거 distinct
 
 select * from member;
 select distinct addr from member;
 
 select distinct addr
				, mem_id
                from member;

select distinct addr
		, debut_date
        from member;
        
-- 중복 제거를 해도 다른 속성에서 중복 값이 있으면 같이 출력되어 중복 그대로 출력, 추가한 속성이 중복제거된 상태면 같이 중복 제거되어 출력

-- group by
-- 그룹 묶기 -> 해당 그룹의 통계치(합계, 평균, 중위값, 카운팅 등등)

select * from buy;

-- 통계치 함수 sum, avg, min, max, count, count(distinct)

-- 어떤 컬럼을 기준으로 묶을 것인가?

select mem_id, sum(amount) from buy group by mem_id;

select mem_id, sum(amount), avg(price) from buy group by mem_id;

-- 통계치로 묶지 않은 속성이 들어가면?
select mem_id, sum(amount), avg(price), prod_name from buy group by mem_id;

-- group by로 묶을 경우 수치형 데이터를 기준으로 요약 통계치를 낼 수 있는 경우가 대부분

select mem_id, sum(amount), avg(price), count(prod_name) from buy group by mem_id;

select max(debut_date) from member;

select min(debut_date) from member;

-- count(distinct)
select count(addr) from member;
select count(distinct addr) from member;

select (price * amount) from buy;
select mem_id, sum(price * amount) from buy
		group by mem_id;




