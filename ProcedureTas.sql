create database ProcedureHomeWork
 
 use ProcedureHomeWork

 create table Books (
Id int primary key identity,
Name nvarchar(100) not null  check (len (Name)>=2),
PageCount int check (PageCount>=10)
 )

  create table Authors (
Id int primary key identity,
Name nvarchar(30) not null ,
Surname nvarchar(30)
 )


 alter table Books 
 add Author_Id int foreign key references Authors(Id)

 insert into Authors
 values ('Azra','Kohen'),
		('Ahmet','Umut'),
		('Corc','Oruel'),
		('Joanne','Kathleen')

insert into Books
values ('Aeden',567,1),
		('Fi',643,1),
		('Sis ve Gece',495,2),
		('Kavim ',672,2),
		('Kukla ',358,2),
		('Animal ',269,3),
		('1987 ',865,3),
		('Harry Potter ',987,4)
		
	create view vw_AuthorsAndBooks
	as 
	select*from
	(
	select b.Id, b.Name, b.PageCount, a.Name+' '+a.Surname as AutherFullName from Books as b
	join Authors as a
	on b.Author_Id=a.Id
	)
	as AuthorsAndBooks
	select*from vw_AuthorsAndBooks

	create procedure usp_SearchBooks

	@Name nvarchar (30)
	as 
	select b.Id, b.Name, b.PageCount, a.Name+' '+a.Surname as AutherFullName from Books as b
	join Authors as a
	on b.Author_Id=a.Id
	where a.Name=@Name

	create procedure Insert_AuthorFullName
	@Name nvarchar(30),
	@Surname nvarchar(30)
	as insert into Authors
	values (@Name,@Surname)

	create procedure Update_AuthorFullName
	@Id int,
	@Name nvarchar(30)
	as 
	update Authors
	set Name=@Name where	Id=@Id

	create procedure Delete_AuthorFullName
	@Id int
	as
	delete from Authors where Id=@Id
