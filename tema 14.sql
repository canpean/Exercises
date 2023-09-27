-- 1. sa se modifice SP CheckIfOrderIsNeededForProduct astfel incat valoare 0 sau 1 sa fie
-- returnata intr un param de intrare

create or alter procedure Production.CheckIfOrderIsNeededForProduct
(
	@ProductId  int = 0,
	@Date		date = null,
	@OrderIsNeeded int out
)
/*
	Date:			29.01.2023
	Created by:		DB GR6
	Description:	retuneaza toate produsele pentru care trebuie sa facem coamnda pentru refacerea stocului la o data
					luam in calcul doar vanzarile din luna de la data la care vrem sa vedem daca este necesar sa comandam

*/
as
begin
	declare @ReorderPoint		int = -1,
			@SoldQuantity		int = 0,
			@InitialQuantity	int = 0,
			@CurrentQuantity	int = 0;

	-- tabela de produse
	select @ReorderPoint = ReorderPoint from Production.Product where ProductID = @ProductId;

	select  @SoldQuantity = SUM(OrderQty) from Sales.SalesOrderDetail 
		where ProductID = @ProductId and MONTH(ModifiedDate) = MONTH(@Date) and YEAR(ModifiedDate) = YEAR(@Date);

	select @InitialQuantity = SUM(Quantity) from Production.ProductInventory where ProductID = @ProductId 
			and MONTH(ModifiedDate) = MONTH(@Date) and YEAR(ModifiedDate) = YEAR(@Date);

	if(ISNULL(@InitialQuantity, 0) = 0)
	begin
		RAISERROR('Va rugam sa introduceti inventarul pe luna curenta!', 11, 12000);
		return -1;
	end

	select @CurrentQuantity = @InitialQuantity - @SoldQuantity;

	if(@CurrentQuantity >= @ReorderPoint)
		select @OrderIsNeeded = 0; 
	else
		select @OrderIsNeeded = 1;

end;
------------------------
declare @OrderIsNeededVar int = -1;

exec Production.CheckIfOrderIsNeededForProduct @ProductId = 777, @Date = '20110528', @OrderIsNeeded = @OrderIsNeededVar out;

select @OrderIsNeededVar;

-- 2. sa se scrie o SP pe baza de date AW care are 
		-- ca param de intrare 
			--o persoana de vanzari si care retunraza o tabele(SalesPerson) - id-ul acelei persoana
			--un interval de timp: data de inceput si data de sfarsit
		-- si retuneaza o tabela cu toate produsele vandute de persoana respectiva in intervalul de timp din param de intrare
		-- sa se retuneze o eroare daca nu se gaseste ID-ul persoanei

create or alter procedure SPSoldProducts
(
	@SalesPersonID int,
	@StartDate date,
	@EndDate date
)
as
begin

declare @SalesPersonFoundOrNot varchar (20);

select @SalesPersonFoundOrNot = o.SalesPersonID 
	from Sales.SalesOrderHeader o
		where o.SalesPersonID = @SalesPersonID 
				and o.OrderDate between @StartDate and @EndDate;

if(isnull(@SalesPersonFoundOrNot, 0) = 0)
	raiserror('ID-ul persoanei de vanzari nu a fost gasit pentru intervalul specificat. -> Incearca un alt id sau alt interval de timp', 15, 0);

select s.SalesOrderID, 
		o.SalesPersonID, 
		p.ProductID, 
		p.Name, 
		o.OrderDate 
	from Sales.SalesOrderHeader o
		inner join Sales.SalesOrderDetail s on o.SalesOrderID = s.SalesOrderID
		inner join Production.Product p on s.ProductID = p.ProductID 
			where o.SalesPersonID = @SalesPersonID 
				and o.OrderDate between @StartDate and @EndDate;
			
end;
	----- 

exec SPSoldProducts @SalesPersonID = 279, @StartDate = '2011-05-30' , @EndDate = '2011-07-15'; -- returneaza rezultatul dorit

