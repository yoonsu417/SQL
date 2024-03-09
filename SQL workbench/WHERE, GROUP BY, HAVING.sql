SELECT * FROM store;

-- 1번
INSERT INTO store VALUES(1, '가나다', '메모지', 2, 4000, 8000);
INSERT INTO store VALUES(2, '라마바', '포카', 4, 6000, 24000);
INSERT INTO store VALUES(3, '가나다', '키링', 2, 5000, 10000);
INSERT INTO store VALUES(4, '사아자', '볼펜', 1, 1500, 1500);
INSERT INTO store VALUES(5, '라마바', '케이스', 1, 8000, 8000);

-- 2번
SELECT (amount * price) as total_count from store;

-- 3번
SELECT cus_name, sort, price, total from store where total >= 10000;
SELECT cus_name, price from store where sort ='메모지';

-- 4번
SELECT cus_name, count(*) from store group by cus_name;
SELECT sort, count(*) from store group by sort;

-- 5번
SELECT cus_name, sum(price) from store group by cus_name having sum(price) > 5000;
SELECT cus_name, avg(total) from store group by cus_name having avg(total)>1000;

