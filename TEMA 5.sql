--In baza de date Scoala introduceti minim 20 de inregistrari in tabela PERSOANE si minim 10 inregistrari
--in tabelele INCADRARI si CLASE_ELEVI.

----------------------------------------------
insert into scoala.persoane 
values ('2920200512947', 'LOTOTCHI', 'ALINA', '1992-08-08', 'BELIS', '0741051005', '2', 'F', NULL, '1')
DELETE FROM SCOALA.PERSOANE WHERE CNP = '1840200512947';

insert into scoala.persoane 
values ('2930206512947', 'BOCU', 'ANA', '1993-02-06', 'APAHIDA', '0741051006', '2', 'F', NULL, '1');

insert into scoala.persoane 
values ('1940206512947', 'MAN', 'CIPRIAN', '1994-02-06', 'HUEDIN', '0741051096', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('1920306512947', 'MANEA', 'DORU', '1992-03-06', 'TURDA', '0741051086', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('1910306512947', 'SZEP', 'LACZO', '1991-03-06', 'HETIUR', '0741051076', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('1910406512947', 'MANEA', 'DORU', '1991-04-06', 'VALENI', '0741051066', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('2920406512947', 'KOVACS', 'MAGDOLNA', '1992-04-06', 'VALENI', '0741051076', '1', 'F', NULL, '1');

insert into scoala.persoane 
values ('1910406512947', 'KOVACS', 'LASZLO', '1991-04-06', 'LIVEZENI', '0741051067', '1', 'M', NULL, '1');

insert into scoala.persoane 
values ('1900406512947', 'FEHER', 'ARPAD', '1990-04-06', 'LIVEZENI', '0741051167', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('1920406512947', 'FEIER', 'SORIN', '1992-04-06', 'CORUNCA', '0741051069', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('1900406512949', 'KIM', 'FERENC', '1990-04-06', 'NAZNA', '0741051087', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('1930406512947', 'SUCIU', 'FLORIN', '1993-04-06', 'FLORESTI', '0741051069', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('2920406512987', 'KACSO', 'GYONGY', '1992-04-06', 'TURDA', '0741051038', '1', 'F', NULL, '1');

insert into scoala.persoane 
values ('2910406512987', 'TOC', 'SARA', '1991-04-06', 'CAMPIA TURZII', '0741051039', '1', 'F', NULL, '1');

insert into scoala.persoane 
values ('2920406513987', 'LAKATOS', 'VERGINICA', '1992-04-06', 'CLUJ NAPOCA', '0741051049', '2', 'F', NULL, '1');

insert into scoala.persoane 
values ('2900406512987', 'POP', 'ANGELICA', '1990-04-06', 'BUCURESTI', '0741051088', '1', 'F', NULL, '1');

insert into scoala.persoane 
values ('2910406512987', 'POPA', 'ANA', '1991-04-06', 'PLOIESTI', '0741051058', '1', 'F', NULL, '1');

insert into scoala.persoane 
values ('2930406512987', 'HULPE', 'MARA', '1993-04-06', 'GHERLA', '0741051138', '2', 'F', NULL, '1');

insert into scoala.persoane 
values ('2910406512989', 'PATRAULEA', 'ION', '1991-04-06', 'DEJ', '0741051238', '2', 'M', NULL, '1');

insert into scoala.persoane 
values ('2940406512987', 'MIHAI', 'MARIA', '1994-04-06', 'FELEACU', '0741051139', '1', 'F', NULL, '1');

insert into scoala.persoane 
values ('2910406512947', 'MAKCSA', 'MARTA', '1991-04-06', 'DEJ', '0741051131', '2', 'F', NULL, '1');


--------------------------
select * from scoala.INCADRARE
--------------------------
insert into scoala.INCADRARE 
values ('1940206512947', '2', '2', '3', '4');

insert into scoala.INCADRARE 
values ('1920306512947', '2', '2', '3', '4');

insert into scoala.INCADRARE 
values ('1910306512947', '2', '2', '3', '4');

insert into scoala.INCADRARE 
values ('1900406512947', '6', '1', '2', '5');

insert into scoala.INCADRARE 
values ('1920406512947', '5', '1', '2', '8');

insert into scoala.INCADRARE 
values ('1900406512949', '4', '1', '2', '6');

insert into scoala.INCADRARE 
values ('1930406512947', '5', '1', '2', '7');

insert into scoala.INCADRARE 
values ('2910406512947', '4', '1', '2', '6');

insert into scoala.INCADRARE 
values ('2910406512989', '3', '1', '2', '5');

insert into scoala.INCADRARE 
values ('2930406512987', '2', '1', '2', '9');

insert into scoala.INCADRARE 
values ('2920406513987', '4', '1', '2', '10');

insert into scoala.INCADRARE 
values ('2920406512947', '3', '1', '2', '6');


--------------
select * from scoala.CLASE_ELEVI
select * from scoala.persoane WHERE ID_ROL = 1;
--------------

insert into scoala.CLASE_ELEVI 
values ('2940406512987', '4', '1');

insert into scoala.CLASE_ELEVI 
values ('2910406512987', '2', '3');

insert into scoala.CLASE_ELEVI 
values ('2920406512947', '1', '4');

insert into scoala.CLASE_ELEVI 
values ('2920406512947', '2', '3');

insert into scoala.CLASE_ELEVI 
values ('2920406512947', '3', '2');

insert into scoala.CLASE_ELEVI 
values ('2920406512987', '1', '2');

insert into scoala.CLASE_ELEVI 
values ('2910406512987', '2', '2');

insert into scoala.CLASE_ELEVI 
values ('2910406512987', '2', '1');

insert into scoala.CLASE_ELEVI 
values ('2920406512987', '1', '1');

insert into scoala.CLASE_ELEVI 
values ('2900406512987', '3', '1');

insert into scoala.CLASE_ELEVI 
values ('2910406512987', '1', '3');