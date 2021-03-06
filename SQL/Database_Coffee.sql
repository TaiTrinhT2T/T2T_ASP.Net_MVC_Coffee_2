USE [NOC_Coffee]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID Bill] [int] NOT NULL,
	[ID Customer] [int] NOT NULL,
	[ID Product] [int] NOT NULL,
	[ID Employee] [int] NOT NULL,
	[Date] [date] NULL,
	[Total] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID Bill] ASC,
	[ID Customer] ASC,
	[ID Product] ASC,
	[ID Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID Customer] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](100) NULL,
	[Telephone] [nvarchar](40) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID Employee] [int] IDENTITY(1,1) NOT NULL,
	[ID Res] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telephone] [nvarchar](40) NULL,
	[Status] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID Product] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](500) NULL,
	[Price] [int] NULL,
	[Image] [nvarchar](500) NULL,
	[Creating Date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Responsibilty]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsibilty](
	[ID Res] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Responsibilty] PRIMARY KEY CLUSTERED 
(
	[ID Res] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Responsibilty_Role]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsibilty_Role](
	[ID Res] [int] NOT NULL,
	[ID Role] [int] NOT NULL,
 CONSTRAINT [PK_Responsibilty_Role] PRIMARY KEY CLUSTERED 
(
	[ID Res] ASC,
	[ID Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 05/05/2018 11:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID Role] [int] IDENTITY(1,1) NOT NULL,
	[Name Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bill] ([ID Bill], [ID Customer], [ID Product], [ID Employee], [Date], [Total], [Quantity]) VALUES (1, 1, 1, 3, CAST(0x263E0B00 AS Date), 35000, 1)
INSERT [dbo].[Bill] ([ID Bill], [ID Customer], [ID Product], [ID Employee], [Date], [Total], [Quantity]) VALUES (1, 1, 2, 3, CAST(0x263E0B00 AS Date), 100000, 2)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID Customer], [Name], [Address], [Email], [Telephone]) VALUES (1, N'Nguyễn Van A', N'Hoài Ðức - Hà Nội', N'vanan@gmail.com', N'01239474283')
INSERT [dbo].[Customer] ([ID Customer], [Name], [Address], [Email], [Telephone]) VALUES (2, N'Nguyễn Van B', N'Ðống Ða - Hà Nội', N'vanbn@gmail.com', N'09374823742')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID Employee], [ID Res], [Name], [Email], [Telephone], [Status], [Password]) VALUES (2, 3, N'Trần Đại Nghĩa', N'nghiatran@gmail.com', N'012323843235', N'Đã nghỉ việc', N'111')
INSERT [dbo].[Employee] ([ID Employee], [ID Res], [Name], [Email], [Telephone], [Status], [Password]) VALUES (3, 2, N'Hoa Anh Thắng', N'thanghap@gmail.com', N'094726228193', N'Đang làm việc', N'222')
INSERT [dbo].[Employee] ([ID Employee], [ID Res], [Name], [Email], [Telephone], [Status], [Password]) VALUES (4, 4, N'Vũ Xuân Anh', N'anhvu@gmail.com', N'012984723749', N'Đã nghỉ việc', N'333')
INSERT [dbo].[Employee] ([ID Employee], [ID Res], [Name], [Email], [Telephone], [Status], [Password]) VALUES (5, 2, N'Trần Đăng A', N'trandanga@gmail.com', N'123456654321', N'111', N'444')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID Product], [Name], [Detail], [Price], [Image], [Creating Date]) VALUES (1, N'Nâu dá', N'Cà phê Hà Nội vị sữa đặc', 35000, N'null', NULL)
INSERT [dbo].[Product] ([ID Product], [Name], [Detail], [Price], [Image], [Creating Date]) VALUES (2, N'Trà cam dào', N'Vị trà hòa quyện với dào tuoi', 50000, N'null', NULL)
INSERT [dbo].[Product] ([ID Product], [Name], [Detail], [Price], [Image], [Creating Date]) VALUES (4, N'1', N'1', 1, N'1', CAST(0x323E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Responsibilty] ON 

INSERT [dbo].[Responsibilty] ([ID Res], [Name], [Description]) VALUES (2, N'Waitress 1', N'Bồi bàn, phục vụ khách')
INSERT [dbo].[Responsibilty] ([ID Res], [Name], [Description]) VALUES (3, N'Admin', N'Điều khiển toàn bộ hoạt động của quán')
INSERT [dbo].[Responsibilty] ([ID Res], [Name], [Description]) VALUES (4, N'Đầu bếp', N'Chế biến')
SET IDENTITY_INSERT [dbo].[Responsibilty] OFF
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 5)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 7)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 8)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 9)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 14)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 15)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 16)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (2, 17)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 1)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 3)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 4)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 5)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 7)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 8)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 9)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 10)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 11)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 12)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 13)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 14)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 15)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 16)
INSERT [dbo].[Responsibilty_Role] ([ID Res], [ID Role]) VALUES (3, 17)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (1, N'Bill - Delete')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (3, N'Bill - Detail')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (4, N'Bill - Update')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (5, N'Customer - Delete')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (7, N'Customer - Detail')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (8, N'Customer - Update')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (9, N'Customer - Add')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (10, N'Employee - Delete')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (11, N'Employee - Update')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (12, N'Employee - Detail')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (13, N'Employee - Add')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (14, N'Product - Delete')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (15, N'Product - Detail')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (16, N'Product - Update')
INSERT [dbo].[Role] ([ID Role], [Name Role]) VALUES (17, N'Product - Add')
SET IDENTITY_INSERT [dbo].[Role] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([ID Customer])
REFERENCES [dbo].[Customer] ([ID Customer])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Employee] FOREIGN KEY([ID Employee])
REFERENCES [dbo].[Employee] ([ID Employee])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Employee]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Product] FOREIGN KEY([ID Product])
REFERENCES [dbo].[Product] ([ID Product])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Product]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Responsibilty] FOREIGN KEY([ID Res])
REFERENCES [dbo].[Responsibilty] ([ID Res])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Responsibilty]
GO
ALTER TABLE [dbo].[Responsibilty_Role]  WITH CHECK ADD  CONSTRAINT [FK_Responsibilty_Role_Responsibilty] FOREIGN KEY([ID Res])
REFERENCES [dbo].[Responsibilty] ([ID Res])
GO
ALTER TABLE [dbo].[Responsibilty_Role] CHECK CONSTRAINT [FK_Responsibilty_Role_Responsibilty]
GO
ALTER TABLE [dbo].[Responsibilty_Role]  WITH CHECK ADD  CONSTRAINT [FK_Responsibilty_Role_Role] FOREIGN KEY([ID Role])
REFERENCES [dbo].[Role] ([ID Role])
GO
ALTER TABLE [dbo].[Responsibilty_Role] CHECK CONSTRAINT [FK_Responsibilty_Role_Role]
GO
