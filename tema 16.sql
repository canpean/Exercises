-- 1. sa se defineaca urmatorele tipuri de indecsi:
	-- clustered - pe una sau mai multe coloane
	-- nonclustered - pe una sau mai multe coloane
	-- unique - pe una sau mai multe coloane

		
CREATE TABLE Person.test (
    PersonID int not null,
    LastName varchar(55),
    FirstName varchar(55),
    Address varchar(55),
    City varchar(55)
);
CREATE clustered INDEX Clustered_test   
    ON person.test (PersonID);   

CREATE INDEX non_clustered_test
	ON person.test (LastName, FirstName);

CREATE UNIQUE INDEX unique_test
ON person.test (PersonID);


		-- pe doua tabele la alegere din AW - chiar daca exista indecsi, definiti altii
		-- sa se exemplifice cu prin screen din planurile de executie utilizare indecsilor
CREATE INDEX test
	ON production.Location (ModifiedDate);
select * from production.Location where ModifiedDate like '%2008%'


-- 2. se utilizeze scriptul care genereaza 1.000.000 de randuri si apoi:
		-- sa se faca select fara index pe o coloana(cu where)
		-- sa se defineasca index si apoi sa se faca select
		-- se se urmaresca planurile de executie si sa se compare cele doua planuri de executie



		with a(k) as
(
	select 1 as k
	union all
	select k + 1 from a where k < 99 + 1
) , 

t2 as (
	select row_number() over(order by x.k) as k
	from a x, a y, a z
) 
select k as id , 'a_' + cast (k as varchar) as a, 'b_' + cast (k/2 as varchar) as b into t1
from t2

--drop table t1
select * from t1 t