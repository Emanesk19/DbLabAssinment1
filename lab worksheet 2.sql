use University
create table computer(
	id int primary key ,
	fname varchar (20),
	lname varchar(30),
	dateHired date default getdate(),
	salary money 
)

 
--1
declare @maxAcc int , @maxCom int 
select @maxAcc = max(Salary) from Accounting
select @maxCom = max(salary) from computer
if(@maxAcc > @maxCom)

	print 'Salary Information :employees in Accounting department are highly paid than employees in computer'+char(10) 
	+' Maximum Salary is :' + cast(@maxAcc as varchar(30))
	
else 
	print 'Salary Information :employees in computer department are highly paid than employees in Accounting'+char(10) 
	+' Maximum Salary is :' + cast(@maxCom as varchar(30))

--2
if exists (select *from Accounting where sid = 7)
	print 'found '
else 
		insert into Accounting values (7 , 'wondesen', 'tessema' , '2007-08-03' , 3600)

if((select f_name from Accounting where sid =7) is null)
	print 'null '

else 
		print ' Not null '

--3
declare @avgSalary int 
select @avgSalary = avg(Salary)from Accounting
select f_name +' ' +l_name ,
case 

	 when Salary > @avgSalary then 'High'
	 when Salary < @avgSalary then 'Low'
	 else 
	 'idk'
end as [Salary Compared] from Accounting 

--4
declare @count int 
select @count=count(sid) from Accounting
where salary > (select avg(salary)from Accounting)
print case  @count 
		when 1 then 'Few'
		when 2 then 'few'
		when 3 then 'A lot'
	else 
		'Many'
	end   

--5
declare @number int=1
while(@number <=100)
begin 
if(@number % 2 = 0) 
 print @number
 set @number +=1
 end

 --6 
 declare @fnames varchar(30) , @lnames varchar(30),  @cont int =1
 while(@cont <=3)
	begin
		select @fnames  = fname from computer where @cont  = id
		select @lnames = lname from computer where @cont = id
		print @fnames + ' '+@lnames
		set @cont = @cont+1
	end

 