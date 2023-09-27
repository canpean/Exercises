--TEMA 15
-- 1. Se se implementeze o functie 
		--are ca param de intrare un varchar(sir de caractere) si un singur caracter
		--calculati utilizand bucla while daca acel caracter de intrare se gaseste in sirul de intrare
		--retuenaza true sau false



create or alter function Scoala.GasireCaracter
(
	@Sir      varchar(100),
	@Caracter char
)
returns bit
as
begin

declare @Contor     int = 0,
		@LungimeSir int = len(@Sir),
		@Gasit      int = 0,
		@x          bit = 0;

while (@Contor <= @LungimeSir)
begin
	if (SUBSTRING(@Sir, @Contor, 1) = @Caracter)
	   select @Gasit = @Gasit+1;
	select @Contor = @Contor + 1;
end

if (@Gasit >= 1)
	select @x = 1;
	else select @x = 0;

return @x;
end


-- 2. Sa se implementeze toate conditiile de validare a unui email intr o functie care are ca param emailul si 
-- retuneaza true sau false (0 sau 1)
		-- 1. sa contina caracterul @
		-- 2. caracterul @ sa fie singular
		-- 3. caracaterul @ sa nu fie primul/ultimul caracter
		-- 3. sa contina  caracterul .
		-- 4. caracaterul . sa nu fie primul/ultimul caracter
		-- 5. . sa nu fie primul caracter dupa @
		-- etc.

create schema UTILS;
-- pentru a limita accesul la obiecte la obiecte din baza de date
	-- utlizam drepturi pe useri
	-- datamasking

-- functia CHARINDEX returneaza pozitia caracterului cautat in cadrul sirului
-- daca nu gaseste caracterul atunci returneza 0
--select CHARINDEX('@', '1111');
--select CHARINDEX('@', '11@11');

create or alter function UTILS.ValidateEmail
(
	@Email varchar(100)
)
-- Created by: DB GR6
-- Created date: 20221214
-- Description: valideaza o adresa de email
-- Ex.: 
	-- select UTILS.ValidateEmail('test@gmail.com') as EmailIsValid;
returns bit
as
begin
	
	-- 1. sa contina caracterul @
	-- 2. caracterul @ sa fie singular
	-- 3. caracaterul @ sa nu fie primul/ultimul caracter
	-- 3. sa contina  caracterul .
	-- 4. caracaterul . sa nu fie primul/ultimul caracter
	-- 5. . sa nu fie primul caracter dupa @

	declare @EmailContains@Char		bit = 0,
			@EmailContainsDotChar	bit = 0,
			@IsValidEmail			bit = 0;

	-- 1. sa contina caracterul @
	if(CHARINDEX('@', @Email) > 0)
		select @EmailContains@Char = 1;
	else
		select @EmailContains@Char = 0;

	-- 2. sa contina  caracterul .
	if(CHARINDEX('.', @Email) > 0)
		select @EmailContainsDotChar = 1;
	else
		select @EmailContainsDotChar = 0;

	if(@EmailContains@Char = 1 and @EmailContainsDotChar = 1)
		select @IsValidEmail = 1;
	else
		select @IsValidEmail = 0;

	return @IsValidEmail;

end

select UTILS.ValidateEmail('test@gmail.com') as EmailIsValid; 
select UTILS.ValidateEmail('test@gmailcom') as EmailIsValid; 