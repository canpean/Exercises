--1. sa se ilusteze nivelul de izolare read uncommited pe o tabela la update

set transaction isolation level read uncommitted; 
select Name 
	from Sales.Currency 
		where CurrencyCode = 'TRL';

begin tran
	update Sales.Currency set Name = 'Lire Turcesti' where CurrencyCode = 'TRL';
	-- rollback
commit; 

--2. sa se ilusteze nivelul de izolare read commited pe o tabela la update

set transaction isolation level read committed; 

select Name 
	from Sales.Currency 
		where CurrencyCode = 'TRL';

begin tran
	update Sales.Currency set Name = 'Lire Turcesti' where CurrencyCode = 'TRL';
	-- rollback
commit; 

--3. sa se faca diferenta intre cele doua nivele de izolare 
     -- Nivelul de izolare uncommitted iti permite sa citesti datele care nu sunt comise si la care se poate face rollback daca tranzactia nu a fost realizata cu succes.  
	 -- Nivelul Uncommitted este cel mai slab nivel de izolare si nu ne protejeaza de dirty reads si de phantom reads.
	 -- Nivelul uncommitted ne poate arata informatii eronate
	 -- Nivelul de izolare Commited iti arata date care sunt comise odata ce tranzactia a fost realizata cu succes.


set transaction isolation level read uncommitted; 

select Name 
	from Sales.Currency 
		where CurrencyCode = 'TRL';
		
---------------------------------------------------

set transaction isolation level read committed; 

select Name 
	from Sales.Currency 
		where CurrencyCode = 'TRL';
