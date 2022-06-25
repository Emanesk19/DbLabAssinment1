 create database University
 use University
 create table Accounting(
	sid int primary key identity,
	f_name varchar(20),
	l_name varchar(20),
	dateHired varchar(10),
	salary money
 )
 create table demo(
 	dateHired date,

 )
 insert into demo values ('1994-03-98')
 --1
 insert into Accounting values ('Abebe', 'Alemu','1994-03-05',2000)
 insert into Accounting values ('Hana', 'Girma','2003-11-06',2500)
 insert into Accounting values ('Yared', 'Yitagesu','2007-07-02',3000)
 insert into Accounting values ('Saba', 'Ayele','2005-03-07',2900)
 
 --2
 declare @l int =20 ,@w int =22.34
 print @l*@w *0.5
 
 --3
 declare @salary money
 set @salary = (select sum(salary) from Accounting)
 print 'Total salary in accounting department is : ' + cast(@salary as varchar (30))

 --4
declare @salarys money
select @salarys = sum(salary) from Accounting
print 'Total salary in accounting department is : ' + cast(@salarys as varchar (30))

--5
declare @names varchar(max) = ''
select @names +=f_name + ' ' + l_name + ' | ' from Accounting
print @names

--6
declare @Fname varchar(30) , @sal money
select @sal = salary from Accounting 
where sid = 4
select @Fname = f_name from Accounting
where sid = 4
print 'Result for Employee no 4' + char(10) + '-----------------------------' + char(13)+'First name  ' + @Fname + char(10)+ 'Salary : '+cast(@sal as varchar(20)) 

--7
declare @name varchar(max)=' ' , @payment int
select @payment =avg(salary)from Accounting
select @name += ' Full Name : '+ f_name + '  '+ l_name +char(13)  from Accounting
where Accounting.salary > @payment
print 'Employees with salary greater than the average salary are '+ char(10)+
'----------------------------------------------------------------'+ char(13)+ @name  

--8
declare @highPaid varchar(max)=' ' ,@lowPaid varchar(max)=' ', @sala money
select @sala = avg(salary) from Accounting
select @lowPaid += 'Full Name : '+f_name+ '  '+ l_name+ '   |   '+'Old Salary '+ cast(salary as varchar (max))+'  |  '+ 'New Salary'+  cast(salary +500 as varchar(max))
+char(10) from Accounting
where Accounting.salary < @sala
print  'New added salary for lower income employee ' + char(10) +'----------------------------------------------------------' +char(13)+@lowPaid

select @highPaid += 'Full Name : '+f_name +'  '+ l_name+ '   |   '+'Old Salary '+cast(salary as varchar (max)) +'  |  '+ 'New Salary'+  cast(salary -500 as varchar(max))
+char(10)  from Accounting
where Accounting.salary > @sala
print  'New Salary for highly paid Employees' + char(10) +'----------------------------------------------------------' +char(13)+@highPaid + char(13)



 

