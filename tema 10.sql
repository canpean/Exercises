-- 1. se se utilizeze baza de date AW si sa se ordoneze la elegere 5 tabele dupa:
		-- 1 coloana
		select * from person.Person
		order by FirstName;
		select * from person.PersonPhone
		order by PhoneNumberTypeID desc;
		select * from production.Culture
		order by name;
		select * from production.ProductModel
		order by ModifiedDate;
		select * from sales.SalesPerson
		order by Bonus;
		
		-- mai multe coloane 
		select * from person.Person
		order by FirstName, LastName;
		select * from person.PersonPhone
		order by PhoneNumberTypeID, BusinessEntityID desc;
		select * from production.Culture
		order by name, CultureID;
		select * from production.ProductModel
		order by ModifiedDate, name;
		select * from sales.SalesPerson
		order by Bonus asc, CommissionPct desc;

		-- o expresie matematica 
		select ModifiedDate, sum(bonus) as bonus from sales.SalesPerson 
		 group by ModifiedDate order by sum(bonus) desc;

		-- collation
		select upper(firstname +' '+ LastName) nume_prenume from person.Person
		order by upper(firstname +' '+ LastName);

		-- o expresie de tip case
		select case when title is null
		then 'not available' 
		else title end as new_title, firstname, lastname from person.Person order by new_title;

		-- dupa alias
		select upper(firstname +' '+ LastName) nume_prenume from person.Person
		order by nume_prenume;

-- 2. sa se scrie un query  care modifica collation-ul(case sensitive si unul case insensitive) unei coloane dintr o tabela, 
-- la alegere, din AW
	-- dupa modificarea collation-ului sa se ilustreze rezultatele diferite pe care le returneaza query-uri care contin order by 
	-- si where(litere mari si litere mici)

	select firstname, lastname, upper(persontype) as person_type from person.person
	where upper(persontype) = 'SC' order by FirstName;