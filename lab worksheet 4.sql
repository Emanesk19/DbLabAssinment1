create table Person(
	personName varchar(30),
	state varchar(20),
	height decimal,
	age tinyInt,
	weight decimal,
	IQ tinyint,
	birth_date date 
	)

insert into Person values ('Jhon','Arizona' ,1.73 ,25,200,95,'1/12/1990')
insert into Person values ('Peter','California' ,1.75 ,29,185,75,'7/17/2001')
insert into Person values ('Gerg','Arizona' ,1.95 ,33,191,5,'3/9/1983')
insert into Person values ('James','H0uston' ,1.63 ,30,160,150,'2/10/1986')
insert into Person values ('Matthew','New Mexico' ,1.52 ,15,140,135,'6/12/2001')
insert into Person values ('Petter','Houston' ,1.45 ,15,130,100,'4/6/2001')

--1
select left(Person.personName ,1) from Person

--2
go
create proc [Find Domain] 
@email varchar(40)
as
Begin
select SUBSTRING(@email ,charIndex('@' ,@email) +1 ,len(charIndex('.',@email)))
end

go
exec [Find Domain] 'EmanEsk@gmail.com'
--3

select Person.personName , Person.age , DATEDIFF(year , birth_date,GETDATE()) as [Calculated Age] ,
case
	
	when age = DATEDIFF(year , birth_date,GETDATE()) then 'Correct'
	else 'Not Correct'
	end
	 as Status from Person
--generates random number
	 select ceiling(rand() *20)

	 go
create function [Age Check] (@bday date)
returns int 
as
begin
declare @datediff int
if(@bday > GETDATE())
	begin
		set @datediff = 0
		end
else
set @datediff = (select DATEDIFF(year,@bday,getdate()))
return @datediff
end

go
select dbo.[Age Check] ('4/6/2023')

--3
go
create  function [Count Person]()
returns int
as 
begin
	declare @count int
	select @count = count(Person.personName ) from Person

	end
	go
create function [search](@searched varchar(10))
returns table
return(
	select * from Person
	where personName like '% + @searched%' or  birth_date like '% +@searched %' or  
	 
)