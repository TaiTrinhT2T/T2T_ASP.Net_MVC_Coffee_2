USE [NOC_Coffee]
GO
/****** Object:  StoredProcedure [dbo].[Bill_Create]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Bill_Create]
(
@idProduct int, 
@idEmployee int,
@date date,
@total int,
@quantity int,
@name nvarchar(50), 
@address nvarchar(500), 
@email nvarchar(100), 
@phone nvarchar(40)
)
as 
begin
	declare @IdBill int
	set @IdBill = (SELECT MAX([ID Bill]) FROM Bill)

	declare @CheckCustomer int
	set @CheckCustomer = (select COUNT(*) from Customer where Name = @name and Address = @address and Email = @email and Telephone = @phone)
	if( @CheckCustomer = 0)
		begin
			exec Customer_Create @name, @address, @email, @phone
		end

	declare @idCustomer int

	set @idCustomer = (select [ID Customer] from Customer where Name = @name and Address = @address and Email = @email and Telephone = @phone)

	declare @CheckIdBill int
	set @CheckIdBill = (select COUNT([ID Bill]) from Bill where [ID Customer] = @idCustomer and [ID Employee] = @idEmployee and Date = @date)

	if(@CheckIdBill = 0)
	begin
		set @IdBill += 1
	end

	insert into Bill values 
	(@IdBill, @idCustomer, @idProduct, @idEmployee, @date, @total, @quantity)

	declare @result int
	set @result = 1
	select @result
end
GO
/****** Object:  StoredProcedure [dbo].[Bill_Delete]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Bill_Delete]
(
	@idBill int
)
as
begin
	declare @result int
	delete from Bill where [ID Bill] = @idBill
	set @result = 1
	select @result
end
GO
/****** Object:  StoredProcedure [dbo].[Bill_DetailBill]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Bill_DetailBill]
(
	@idBill int
)
as
begin
	select B.[ID Bill] as ID_HoaDon, C.Name as NameCustomer, E.Name as NameEmployee, Date, Total, P.Name as NameProduct, P.Price, Quantity
	from Bill B, Customer C, Employee E, Product P
	where B.[ID Customer] = C.[ID Customer]
	and B.[ID Employee] = E.[ID Employee]
	and B.[ID Product] = P.[ID Product]
	and B.[ID Bill] = @idBill
end

GO
/****** Object:  StoredProcedure [dbo].[Bill_SelectAllBill]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Bill_SelectAllBill]
as
begin
	select DISTINCT [ID Bill] as ID_HoaDon, C.Name as NameCustomer, E.Name as NameEmployee, Date, Total from Bill B, Customer C, Employee E
	where B.[ID Customer] = C.[ID Customer]
	and B.[ID Employee] = E.[ID Employee]
end
GO
/****** Object:  StoredProcedure [dbo].[Bill_SelectIdMax]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Bill_SelectIdMax]
as
begin
  SELECT MAX([ID Bill])
  FROM Bill
end
GO
/****** Object:  StoredProcedure [dbo].[Customer_Create]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Customer_Create]
(
@name nvarchar(50), 
@address nvarchar(500), 
@email nvarchar(100), 
@phone nvarchar(40)
)
as 
begin
	declare @result int

	--update Role 
	--set
	--	[Name Role] = @NameRole
	--where [ID Role] = @ID

	insert into Customer (Name, Address, Email, Telephone) values (@name, @address, @email, @phone)

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Customer_Update]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Customer_Update]
(
@ID int,
@name nvarchar(50), 
@address nvarchar(500), 
@email nvarchar(100), 
@phone nvarchar(40)
)
as 
begin
	declare @result int

	update Customer 
	set
		Name = @name,
		Address = @address, 
		Email = @email, 
		Telephone = @phone
	where [ID Customer] = @ID

	--insert into Customer (Name, Address, Email, Telephone) values (@name, @address, @email, @phone)

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Employee_Check_Login]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Employee_Check_Login]
(@UserName nvarchar(50), @Password nvarchar(50))
as
begin
	declare @result int

	IF( (SELECT COUNT(*) FROM Employee WHERE Email = @UserName AND Password = @Password) >0 )
		SET @result = 1
	ELSE
		SET @result = 0
	SELECT @result
end
GO
/****** Object:  StoredProcedure [dbo].[Employee_Create]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employee_Create](
@Role nvarchar(50),
@Name nvarchar(50),
@Email nvarchar(50),
@Telephone nvarchar(40),
@Status nvarchar(50),
@Password nvarchar(50)
)
as
begin
	declare @result int

	declare @ID_Res int = (select [ID Res] from Responsibilty where Name = @Role)

	insert into Employee ([ID Res], Name, Email, Telephone, Status, Password)
	values (@ID_Res, @Name, @Email, @Telephone, @Status, @Password)

	set @result = 1
	select @result
end
GO
/****** Object:  StoredProcedure [dbo].[Employee_Update]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employee_Update](
@ID int,
@Role nvarchar(50),
@Name nvarchar(50),
@Email nvarchar(50),
@Telephone nvarchar(40),
@Status nvarchar(50),
@Password nvarchar(50)
)
as
begin
	declare @result int

	declare @ID_Res int = (select [ID Res] from Responsibilty where Name = @Role)

	update Employee
	set
		[ID Res] = @ID_Res,
		Name = @Name,
		Email = @Email,
		Telephone = @Telephone,
		Status = @Status,
		Password = @Password
	where [ID Employee] = @ID

	set @result = 1
	select @result
end
GO
/****** Object:  StoredProcedure [dbo].[Product_Create]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Product_Create]
(
	@name nvarchar(50), 
	@detail nvarchar(500), 
	@price int, 
	@image nvarchar(500)
)
as 
begin
	declare @result int

	--update Product 
	--set
	--	Name = @name,
	--	Detail = @detail, 
	--	Price = @price, 
	--	Image = @image
	--where [ID Product] = @ID

	insert into Product (Name, Detail, Price, Image, [Creating Date]) values 
	(@name, @detail, @price, @image, GETDATE())

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Product_Update]
(
	@ID int, 
	@name nvarchar(50), 
	@detail nvarchar(500), 
	@price int, 
	@image nvarchar(500)
)
as 
begin
	declare @result int

	update Product 
	set
		Name = @name,
		Detail = @detail, 
		Price = @price, 
		Image = @image
	where [ID Product] = @ID

	--insert into Customer (Name, Address, Email, Telephone) values (@name, @address, @email, @phone)

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Responsibilty_Create]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Responsibilty_Create]
(
@Name nvarchar(50),
@Description nvarchar(50)
)
as 
begin
	declare @result int

	insert into Responsibilty (Name, Description)
	values (@Name, @Description)

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Responsibilty_Update]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Responsibilty_Update]
(
@ID int,
@Name nvarchar(50),
@Description nvarchar(50)
)
as 
begin
	declare @result int

	update Responsibilty 
	set
		Name = @Name,
		Description = @Description
	where [ID Res] = @ID

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Role_Create]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Role_Create]
(
@NameRole nvarchar(50)
)
as 
begin
	declare @result int

	--update Role 
	--set
	--	[Name Role] = @NameRole
	--where [ID Role] = @ID

	insert into Role ([Name Role]) values (@NameRole)

	set @result = 1
	select @result
end

GO
/****** Object:  StoredProcedure [dbo].[Role_Update]    Script Date: 17/06/2018 9:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Role_Update]
(
@ID int,
@NameRole nvarchar(50)
)
as 
begin
	declare @result int

	update Role 
	set
		[Name Role] = @NameRole
	where [ID Role] = @ID

	set @result = 1
	select @result
end

GO
