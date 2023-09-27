

--1. Incadrarile profesorilor in anul 2021-2022. Ordonare crescatoare dupa nume, prenume, clasa, disciplina.

select * from scoala.PERSOANE
select * from scoala.INCADRARE
select * from scoala.CLASE
select * from scoala.DISCIPLINE
select * from scoala.ANI_SCOLARI

select sp.NUME, sp.prenume, sc.denumire_clasa, sd.DENUMIRE_DISCIPLINA
from scoala.persoane sp 
join scoala.INCADRARE si on sp.cnp = si.CNP_PROFESOR
join scoala.clase sc on si.ID_CLASA = sc.ID_CLASA
join scoala.discipline sd on si.ID_DISCIPLINA = sd.ID_DISCIPLINA
join scoala.ANI_SCOLARI asi on si.ID_AN = asi.ID_AN
where asi.AN  = '2021-2022'
order by sp.NUME, sp.prenume, sc.denumire_clasa, sd.DENUMIRE_DISCIPLINA asc

--2. Disciplinele studiate la toate clasele in anul scolar 2021-2022. Afisare alfabetica dupa denumire_clasa si denumire_disciplina.

select * from scoala.INCADRARE
select * from scoala.CLASE
select * from scoala.DISCIPLINE
select * from scoala.ANI_SCOLARI

select denumire_clasa, denumire_disciplina
from scoala.INCADRARE si 
join scoala.clase sc on si.id_clasa = sc.ID_CLASA
join scoala.DISCIPLINE sd on si.ID_DISCIPLINA = sd.ID_DISCIPLINA
join scoala.ANI_SCOLARI asi on si.id_an = asi.ID_AN
where asi.AN  = '2021-2022'
order by sc.DENUMIRE_CLASA, sd.DENUMIRE_DISCIPLINA asc


--3. Ce incadrare are profesorul Gheorghe Iosif? Afisare crescatoare dupa clasa si disciplina.

select * from scoala.PERSOANE
select * from scoala.INCADRARE
select * from scoala.CLASE
select * from scoala.DISCIPLINE

select nume, prenume, denumire_clasa, denumire_disciplina 
from scoala.persoane sp
join scoala.incadrare si on sp.cnp = si.CNP_PROFESOR
join scoala.discipline sd on si.ID_DISCIPLINA = sd.ID_DISCIPLINA
join scoala.clase sc on si.ID_CLASA = sc.ID_CLASA
where lower(nume) = 'gheorghe' and lower(prenume) = 'iosif'
order by denumire_clasa, denumire_disciplina 

--4. Clasele din scoala crescator dupa numarul clasei si dupa litera.

select denumire_clasa
from scoala.clase 
order by 
case when len(denumire_clasa) = 3 then cast(substring(denumire_clasa, 1, 2) as int) else cast(substring(denumire_clasa, 1, 1) as int) end asc,
case when len(denumire_clasa) = 3 then substring(denumire_clasa, 3, 1) else substring(denumire_clasa, 2, 1) end asc


--5. Personalul din scoala descrescator dupa varsta. Se afiseaza nume, prenume, data_nasterii, varsta.

select nume, prenume, data_nasterii, DATEDIFF(year, DATA_NASTERII, getdate()) AS varsta from scoala.PERSOANE
where id_rol <> 1
order by varsta desc
