USE classicmodels;

select * From orders;
select * from orderdetails;
select * From customers;

select * from orders;
select * from orderdetails;

select sum(bb.total_sales) from (select o.ordernumber
		, (od.quantityOrdered * od.priceEach) as total_sales
        from orders as o
        left outer join orderdetails as od
        on o.ordernumber = od.ordernumber) bb;
        
select o.ordernumber
	,(od.quantityOrdered * od.priceEach) as total_sales
    from orders as o
    left outer join orderdetails as od
    on o.ordernumber = od.ordernumber
where status = 'Shipped';

select o.orderdate
		, sum(od.quantityOrdered * od.priceEach) as total_sales
        from orders as o
	left outer join orderdetails as od
    on o.ordernumber = od.ordernumber
    group by o.orderdate
    order by 1;
    
select substring(o.orderdate, 1, 7)
		, sum(od.quantityOrdered * od.priceEach) as total_sales
        from orders as o
	left outer join orderdetails as od
	on o.ordernumber = od.ordernumber
    group by substring(o.orderdate, 1, 7)
    order by 1;
    
select sum(bb.total_sales) from (select substring(o.orderdate, 1, 4)
		, sum(od.quantityOrdered * od.priceEach) as total_sales
        from orders as o
	left outer join orderdetails as od
    on o.ordernumber = od.ordernumber
    group by substring(o.orderdate, 1, 4)
    order by 1) bb;
    
select * from orders;

select count(customernumber)
		, customernumber
	from orders
	group by customernumber
    having count(customerNumber) > 1;
    
select count(distinct customerNumber)
	from orders;
select count(customerNumber)
	from orders;
    
select substr(orderdate, 1, 7) mm
		, count(distinct ordernumber) as od
        , count(distinct customernumber) as cus
        from orders
        group by substr(orderdate, 1, 7)
        order by 1;

select * from orders;
select * from orderdetails;

select substring(o.orderdate, 1, 7)
		, sum(od.quantityOrdered * od.priceEach) as total_sales
        , sum(od.quantityOrdered * od.priceEach) / count(distinct o.customernumber) as amv
	from orders as o
    left outer join orderdetails as od
    on o.ordernumber = od.ordernumber
    group by substring(o.orderdate, 1, 7);
    
select substring(o.orderdate, 1, 7) as mm
		, sum(od.quantityOrdered * od.priceEach) as total_sales
		, sum(od.quantityOrdered * od.priceEach) /count(distinct o.customernumber) as amv
	from orders as o
    left outer join orderdetails as od
    on o.ordernumber = od.ordernumber
    group by substring(o.orderdate, 1, 7);
    
select * from orders;
select * from orderdetails;

select * from customers;

select o.orderdate
		, o.ordernumber
        , od.quantityOrdered * od.priceEach as total_sales
        , o.customernumber
        , c.country
	from orders as o
    left outer join orderdetails as od
    on o.ordernumber = od.ordernumber
    left outer join customers as c
    on o.customernumber = c.customerNumber;
    
select bb.coun
		, sum(bb.total_sales)
	from( select o.orderdate as od
			, o.ordernumber as onum
            , od.quantityOrdered * od.priceEach as total_sales
            , o.customernumber as cn
            , c.country as coun
		from orders as o
        left outer join orderdetails as od
        on o.ordernumber = od.ordernumber
        left outer join customers as c
        on o.customernumber = c.customerNumber) bb
        group by bb.coun
        order by 2 desc;
        
select o.orderdate as od
		, o.ordernumber as onum
        , od.quantityOrdered * od.priceEach as total_sales
        , o.customernumber as cn
        , c.country as coun
			from orders as o
            left outer join orderdetails as od
            on o.ordernumber = od.ordernumber
		left outer join customers as c
        on o.customernumber = c.customerNumber;