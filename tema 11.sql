-- 1. sa se calculeze clientul cu cele mai mari cuparaturi in anul 2014 si sa stocheze numele si suma cumparaturilor in variabile


select * from person.Person 
select * from  Sales.SalesOrderHeader
select * from   Sales.customer 

declare @TopCustomerName		varchar(100) = '',
		@TotalAmount	decimal(10, 2) = 0;

select top 1 @TopCustomerName = p.FirstName + ' '  + p.LastName, @TotalAmount = sum(totaldue)  
from Person.Person p 
join sales.customer c on p.BusinessEntityID = c.PersonID 
left join Sales.SalesOrderHeader h on c.CustomerID	= h.CustomerID 
where year(h.orderdate) = 2014
group by p.FirstName + ' '  + p.LastName
order by sum(totaldue)  desc
select  @TopCustomerName as TopCustomer, @TotalAmount as Amount;



-- 2. sa se calculeze numele vazatorului cu cele mai mari vanzari din 2014 din vanzatorii din statele Washington si Michigan


select * from Person.Person;
select * from Sales.SalesPerson;
select * from Person.BusinessEntityAddress;
select * from Person.Address;
select * from Person.StateProvince;

select * from Sales.SalesPerson;
select * from  Sales.SalesOrderDetail
select * from  Sales.SalesOrderHeader

select top 1 p.FirstName + ' '  + p.LastName as Nume,
	sp.Name, 
	sum(h.totaldue) as total_vanzari
	from Person.Person p 
		inner join Sales.SalesPerson s on p.BusinessEntityID = s.BusinessEntityID
		left join Sales.SalesOrderHeader h on s.BusinessEntityID=h.SalesPersonID
		inner join Person.BusinessEntityAddress ea on ea.BusinessEntityID = p.BusinessEntityID
		inner join Person.Address a on a.AddressID = ea.AddressID
		inner join Person.StateProvince sp on sp.StateProvinceID = a.StateProvinceID
			where sp.Name in ('Washington', 'Michigan')
			and year(h.orderdate) = 2014
	group by p.FirstName + ' '  + p.LastName , sp.name
	order by total_vanzari desc;

