-- 1. Sa se creeze o SP care:
	-- are ca param de intrarea CNP-ul unui elev
	-- retuneaza toate disciplinele pe care le studiaza elevul sub forma de tabel
	-- sa se utilizeze atat tabele temporare cat si variabile de tip tabel

-- creare procedura
CREATE or alter PROCEDURE scoala.SPDiscipline 
@codnumericpersonal char(13)
AS
begin
select distinct cnp, ID_ROL, nume, prenume, DENUMIRE_DISCIPLINA from scoala.PERSOANE sp
join scoala.CLASE_ELEVI sce on sp.cnp = sce.CNP_ELEV
join scoala.incadrare si on sce.id_clasa = si.id_clasa
join scoala.DISCIPLINE sd on si.ID_DISCIPLINA = sd.id_disciplina
where id_rol = 1 
and CNP = @codnumericpersonal
end;

---apel procedura
create table #test (cnp char(13), ID_ROL char(1), nume varchar(50), prenume varchar(50), DENUMIRE_DISCIPLINA varchar(50))
insert into #test EXEC scoala.SPDiscipline @codnumericpersonal = '1800226512947';
select * from #test



-- 2.  Sa se creeze o SP care:
	-- are ca param de intrarea CNP-ul unui elev si un param de tip out de tip tabel
	-- retuneaza toti profesorii unui elev sub forma de tabel in var de tip out

create or alter procedure scoala.SPProfesori

 @CNP varchar(13)

as
begin   

declare @VarTabel table( 
						cnp_elev varchar(13),
						nume_elev varchar(150),
						nume_profesor varchar(150)
);

insert into @VarTabel

select p.CNP as cnp_elev, 
		p.NUME + ' ' + p.PRENUME as nume_elev, 
		p2.NUME + ' ' + p2.PRENUME as nume_profesor
from scoala.PERSOANE p
	inner join scoala.CLASE_ELEVI e on p.CNP = e.CNP_ELEV
	inner join scoala.INCADRARE i on e.ID_CLASA = i.ID_CLASA and e.ID_AN = i.ID_AN
	inner join scoala.PERSOANE p2 on i.CNP_PROFESOR = p2.CNP
		where p.CNP = @CNP;

select * from @VarTabel;

end;


exec scoala.SPProfesori @CNP = '1800226512947';  

-- 3. intr o procedura stocata sa se parcurga tabela in while de discipline si sa afiseze titularul fiecarei discipline
	-- nu are param de intrares

create or alter procedure scoala.SPTitularDisciplina
as
begin
if OBJECT_ID('tempdb..#Disciplina') is not null drop table #Disciplina;

select 
	ROW_NUMBER() over (order by ID_DISCIPLINA) as RowNumber, * 
		into #Disciplina	
			from scoala.DISCIPLINE;

declare @RowNumber int = 1,
		@MaxRows int = (select MAX(RowNumber) from #Disciplina),
		@IdDisciplina int = -1;

while (@RowNumber <= @MaxRows)
	begin 
			select @IdDisciplina = ID_DISCIPLINA from #Disciplina where RowNumber = @RowNumber;
	
			select d.DENUMIRE_DISCIPLINA,
				   p.NUME + ' ' + p.PRENUME as nume_titular
			from scoala.DISCIPLINE d
				inner join scoala.INCADRARE i on d.ID_DISCIPLINA = i.ID_DISCIPLINA
				inner join scoala.PERSOANE p on i.CNP_PROFESOR = p.CNP
					where d.ID_DISCIPLINA = @IdDisciplina;
				
			select @RowNumber = @RowNumber + 1; 

	end;

end; 
	
-----
	exec scoala.SPTitularDisciplina; 