USE [master]
GO
/****** Object:  Database [FashionShop]    Script Date: 10/31/2017 10:41:13 AM ******/
CREATE DATABASE [FashionShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FashionShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FashionShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FashionShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\FashionShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FashionShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FashionShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FashionShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FashionShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FashionShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FashionShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FashionShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FashionShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FashionShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FashionShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FashionShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FashionShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FashionShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FashionShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FashionShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FashionShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FashionShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FashionShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FashionShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FashionShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FashionShop] SET  MULTI_USER 
GO
ALTER DATABASE [FashionShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FashionShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FashionShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FashionShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FashionShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[IdGroup] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Email] [nchar](50) NULL,
	[Message] [nchar](500) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NULL,
	[IdOrder] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[OrderDate] [date] NULL,
	[Receiver] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Amount] [float] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](3000) NULL,
	[UnitPrice] [float] NULL,
	[Image] [nvarchar](250) NULL,
	[DateProduct] [date] NULL,
	[IdCategories] [int] NULL,
	[IdSuppnier] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [char](10) NULL,
	[Quantity] [int] NULL,
	[SaleOff] [float] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Status] [nvarchar](200) NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Logo] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInRole]    Script Date: 10/31/2017 10:41:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInRole](
	[ID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_UserInRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (1, N'Áo sơ mi', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (2, N'Áo phông', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (3, N'Áo khoác', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (4, N'Áo len', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (5, N'Áo 2 dây', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (6, N'áo crop-top', 1, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (7, N'Quần jeans', 2, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (8, N'Quần legging', 2, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (9, N'Quần thun', 2, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (10, N'Quần tây', 2, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (12, N'Quần short', 2, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (13, N'Đầm công sở', 3, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (14, N'Đầm dự tiệc', 3, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (15, N'Đầm dạo phố', 3, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (21, N'Chân váy', 3, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (22, N'Mũ', 4, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (23, N'Phụ kiện tóc nữ', 4, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (24, N'Giầy,dép', 4, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (25, N'Kính', 4, 1)
INSERT [dbo].[Categories] ([Id], [Name], [IdGroup], [Status]) VALUES (26, N'Đồng hồ', 4, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Contact] ([ID], [Name], [Email], [Message]) VALUES (0, N'trinh     ', N'ẻtyui                                             ', N'ẻtyui                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'admin', N'admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'AnhMTA', N'123456', N'Nguyễn  Ngọc Ánh', N'Anhatbmtt@gmail.com                                                                                                                                                                                                                                       ', N'Hà Nội', N'0979640196')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'HoaiMTA', N'123456', N'Nguyễn Vân Anh', N'Hoaiatbmtt@gmail.com                                                                                                                                                                                                                                      ', N'TP Hồ chí minh', N'0979640196')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'HoaMTA', N'123456', N'Ngô Thị Hòa', N'Hoaatbmtt@gmail.com                                                                                                                                                                                                                                       ', N'Bắc Ninh', N'0979640196')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'KienMTA', N'123456', N'Nguyễn Trung Kiên', N'Kienatbmtt@gmail.com                                                                                                                                                                                                                                      ', N'Nghệ An', N'0979640196')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'TrangMTA', N'123456', N'BùiThu Trang', N'Trangatbmtt@gmail.com                                                                                                                                                                                                                                     ', N'Sơn la', N'0979640196')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'trinh', N'123456', N'tr', N'trinh@gmail.com                                                                                                                                                                                                                                           ', N'hà nội', N'0979640196')
INSERT [dbo].[Customer] ([Username], [Password], [FullName], [Email], [Address], [Phone]) VALUES (N'TrinhMTA', N'123456', N'Nguyễn Thị Trinh', N'trinhatbmtt@gmail.com                                                                                                                                                                                                                                     ', N'Nghệ An', N'0979640196')
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [Name]) VALUES (1, N'Áo')
INSERT [dbo].[Group] ([Id], [Name]) VALUES (2, N'Quần')
INSERT [dbo].[Group] ([Id], [Name]) VALUES (3, N'Váy')
INSERT [dbo].[Group] ([Id], [Name]) VALUES (4, N'Phụ kiện')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1009, 8, 13, 1, 539)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1010, 2, 14, 3, 627)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1011, 24, 15, 1, 109)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1012, 48, 15, 1, 330)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1013, 46, 15, 1, 500)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1014, 24, 16, 1, 109)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1015, 24, 17, 1, 109)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1016, 2, 18, 1, 209000)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1017, 24, 19, 1, 109000)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1018, 24, 20, 1, 109000)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1019, 58, 21, 1, 640000)
INSERT [dbo].[OrderDetail] ([Id], [IdProduct], [IdOrder], [Quantity], [Amount]) VALUES (1020, 24, 23, 1, 109000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (14, N'TrinhMTA', CAST(N'2017-12-13' AS Date), N'hgg', N'hhgh', 627, N'0866575', N'hoa1110elf', 2)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (15, N'TrinhMTA', CAST(N'2017-12-13' AS Date), N'h', N'dfg', 939, N'9', N'hoa2345789', 2)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (16, N'TrinhMTA', CAST(N'2017-12-13' AS Date), N'trinh', N'hg', 109, N'0987654', N'trinh@gmail.com', 2)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (17, N'TrinhMTA', CAST(N'2017-12-13' AS Date), N'trinh', N'th', 109, N'0987654', N'trinh@gmail.com', 2)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (18, N'TrinhMTA', CAST(N'2017-12-13' AS Date), N'trinh', N'nghệ an', 209000, N'90987654', N'trinh@gmail.com', 2)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (19, N'TrinhMTA', CAST(N'2017-12-13' AS Date), N'trinh', N'nghệ an', 109000, N'09876543', N'trinh@gmail.com', 2)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (20, N'TrinhMTA', CAST(N'2017-12-14' AS Date), N'trinh', N'nghệ an', 109000, N'ư45678', N'trinh@gmail.com', 0)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (21, N'TrinhMTA', CAST(N'2017-12-14' AS Date), N'trinh', N'HÀ nội', 640000, N'0987654', N'trinh@gmail.com', 0)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (22, N'TrinhMTA', CAST(N'2017-12-14' AS Date), N'trinh', N'ỷ', 109000, N'09876543', N'trinh@gmail.com', 0)
INSERT [dbo].[Orders] ([Id], [Customer], [OrderDate], [Receiver], [Address], [Amount], [Phone], [Email], [TinhTrang]) VALUES (23, N'TrinhMTA', CAST(N'2017-12-14' AS Date), N'trinh', N'nghệ an', 109000, N'0937494949', N'trinh@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (1, N'Áo sơ mi phom rộng 2 túi', N'Áo Sơ Mi Phom Rộng Hai Túi Labelle S37 - Kem có màu sắc trang nhã đi kèm thiết kế trẻ trung, hiện đại, vừa phù hợp với môi trường công sở, vừa thích hợp để mặc đi chơi cùng bạn bè. Thiết kế áo phom rộng, cổ trụ, may phối 2 túi trước ngực làm điềm nhấn. Các bạn gái sẽ trông thật xinh xắn khi kết hợp áo cùng quần jeans, chân váy hay quần short tùy hoàn cảnh.', 189000, N'/Resources/Image/files/aosm1.jpg', CAST(N'2015-02-05' AS Date), 1, 1, N'Trắng', N'M         ', 0, 100000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (2, N'Áo sơ mi nữ MINTBasic', NULL, 209000, N'/Resources/Image/files/aosm2.jpg', CAST(N'2016-03-02' AS Date), 1, 1, N'Đen', N'L         ', 14, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (3, N'Áo sơ mi phối sọc', NULL, 610000, N'/Resources/Image/files/aosm3.jpg', CAST(N'2015-02-07' AS Date), 1, 2, N'Hồng', N'M         ', 10, 100000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (4, N'Áo thun nữ Hoa Lily Crino', NULL, 129000, N'/Resources/Image/files/aothun1.jpg', CAST(N'2016-02-05' AS Date), 2, 2, N'Xám', N'S         ', 2, 90000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (5, N'Áo thun trơn cổ  tròn tay ngắn', NULL, 149000, N'/Resources/Image/files/aothun2.jpg', CAST(N'2014-02-04' AS Date), 2, 3, N'Hồng', N'M         ', 4, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (6, N'Áo khoác nữ xỏ ngón Phúc An', NULL, 159000, N'/Resources/Image/files/aokhoac1.jpg', CAST(N'2016-06-23' AS Date), 3, 9, N'Xám', N'S         ', 3, 100000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (7, N'Áo khoác nữ chống tia UV', NULL, 399000, N'/Resources/Image/files/aokhoac2.jpg', CAST(N'2017-03-07' AS Date), 3, 4, N'Xanh', N'M         ', 4, 120000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (8, N'Quần Jeans Skinny Nữ', NULL, 539000, N'/Resources/Image/files/quanjean1.jpg', CAST(N'2015-12-06' AS Date), 7, 3, N'Xanh dương', N'S         ', 7, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (9, N'Quần Jeans Baggy Lưng thun', NULL, 290000, N'/Resources/Image/files/quanjean2.jpg', CAST(N'2014-03-04' AS Date), 7, 3, N'Xanh đậm', N'L         ', 12, 200000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (10, N'Quần Jeans dài nữ Anata Fashion', NULL, 659000, N'/Resources/Image/files/quanjean3.jpg', CAST(N'2017-03-06' AS Date), 7, 3, N'Đen', N'M         ', 2, 400000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (11, N'Áo thun nữ form rộng phối màu T&D', N'Áo Thun Nữ Phom Rộng Phối Màu T&D D25 - Đồng Phối Đen ngay lập tức gây ấn tượng với người đối diện bởi họa tiết cùng chữ sáng tạo. Sắc màu phối đầy cá tính với thân áo màu đồng, hai tay màu đen. Bạn gái có thể diện áo cùng quần jeans, short để sỡ hữu cho mình vẻ ngoài thật cá tính và năng động khi đi chơi, dạo phố cùng người thâ, bạn bè.', 300000, N'/Resources/Image/files/aothun3.jpg', CAST(N'2016-07-07' AS Date), 2, 1, N'Đen', N'M         ', 7, 200000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (12, N'Áo thun nữ T&D Body black Bee', N'Áo Thun Nữ T&D Body Black Bees Năng Động D83 - Trắng có thiết kế trẻ trung với cổ tròn, phối tay ngắn tiện lợi cùng họa tiết chữ cái thu hút nơi ngực áo, tạo phong cách thời trang khỏe khoắn, năng động cho bạn gái. Áo có màu trắng nhã nhặn, có thể mặc cùng nhiều loại trang phục khác nhau như: Quần Jeans, Shorts Jeans, Váy ngắn, Quần Legging thể thao,...', 550000, N'/Resources/Image/files/aothun4.jpg', CAST(N'2016-07-07' AS Date), 2, 1, N'Trắng', N'M         ', 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (13, N'Áo thun nữ T&D ami D90', N'Áo Thun Nữ T&D Body Black Bees Năng Động D83 - Trắng có thiết kế trẻ trung với cổ tròn, phối tay ngắn tiện lợi cùng họa tiết chữ cái thu hút nơi ngực áo, tạo phong cách thời trang khỏe khoắn, năng động cho bạn gái. Áo có màu trắng nhã nhặn, có thể mặc cùng nhiều loại trang phục khác nhau như: Quần Jeans, Shorts Jeans, Váy ngắn, Quần Legging thể thao,...', 400000, N'/Resources/Image/files/aothun5.jpg', CAST(N'2016-06-06' AS Date), 2, 1, N'Trằng Đen', N'S         ', 8, 375000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (14, N'Áo thun nữ họa tiết Sunny Morning rộng', N'Áo Thun Nữ Họa Tiết Sunday Morning From Rộng Phong Cách Xẻ Tà Thời Trang T&D D276 - Hồng (Freesize) có gam màu nền nã, có thể mặc cùng nhiều loại trang phục khác nhau như: Quần Jeans, Váy Jeans, Váy bút chì,..
Chất liệu thun cotton êm ái, co giãn dễ dàng, thấm hút tốt.
Đường chỉ may mịn đẹp, không thừa đầu chỉ.
Áo có độ bền màu cao, chống xù lông trong suốt thời gian sử dụng.
Form áo dễ mặc, không kén dáng.', 250000, N'/Resources/Image/files/aothun6.jpg', CAST(N'2017-06-08' AS Date), 2, 1, N'Hồng nhạt', N'M         ', 10, 200000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (15, N'Áo thun nữ T&D Cute D74', N'Áo Thun Nữ T&D Sacramento Cute D74 - Trắng có thiết kế đơn giản với cổ tròn, phối tay ngắn trẻ trung cùng họa tiết slogan phối khác màu thu hút trước ngực áo, tạo phong cách thời trang dễ thương, năng động cho bạn gái. Áo có màu trắng thanh lịch, có thể mặc cùng nhiều loại trang phục khác nhau như: Quần Jeans, Shorts Jeans, Váy ngắn, Quần Legging thể thao,...', 100000, N'/Resources/Image/files/aothun7.jpg', CAST(N'2016-07-09' AS Date), 2, 1, N'Trắng ', N'M         ', 5, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (16, N'Áo khoác nữ đi nắng Phúc An D700', N'Áo Khoác Nữ Đi Nắng Phúc An DN0001 ngoài việc góp phần định hình phong cách thời trang trẻ trung, năng động còn giúp bảo vệ làn da của bạn khỏi những tia nắng gay gắt trong tiết trời oi bức. Áo có chất liệu thun thoáng mát, độ co giãn tốt, cho bạn thỏa sức hoạt động ngoài trời mà không lo hầm bí, khó chịu. Bên cạnh đó, với tone màu trơn, kiểu dáng nhã nhặn, bạn hoàn toàn dễ dàng kết hợp áo khoác cùng các trang phục khác để thật tự tin, hoàn hảo khi đi học, đi làm hay dạo phố cùng bạn bè.', 250000, N'/Resources/Image/files/aokhoac3.jpg', CAST(N'2017-08-08' AS Date), 3, 9, N'Vàng', N'F         ', 15, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (17, N'Áo khoác nữ xỏ ngón Basic Phúc An', N'Áo Khoác Xỏ Ngón Chống Nắng Basix Phúc An 4034 được thiết kế tay dài thời trang, xỏ ngón tiện dụng, áo có nón, phối dây cột, mang đến phong cách trẻ trung, năng động. Dây khóa kéo cao có thể che được phần cổ, giúp bạn bảo vệ cổ khỏi nắng nóng hoặc không khí lạnh khi đi ra ngoài đường', 200000, N'/Resources/Image/files/aokhoac4.jpg', CAST(N'2016-07-06' AS Date), 3, 9, N'Xanh dương đậm', N'L         ', 8, 180000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (18, N'Áo khoác nữ Xỏ ngón Phúc An', N'Áo Khoác Nữ Xỏ Ngón Phúc An xn_xam - Xám (Freesize) màu sắc tinh tế, gia công sắc sảo, thể hiện tính thẩm mỹ cao. Form áo chuẩn với chất liệu thun nỉ cao cấp, cho bạn cảm giác thoải mái và dễ dàng vận động. Sản phẩm còn được ưa chuộng bởi độ bền vượt trội và tính tiện dụng cao.', 560000, N'/Resources/Image/files/aokhoac5.jpg', CAST(N'2016-05-05' AS Date), 3, 9, N'Xám nhạt', N'Freesize  ', 10, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (19, N'Áo khoác Nữ chống tia UV Cửu Long ', N'Áo Khoác Nữ Chống Tia UV Cửu Long AKCL-D - Đen có thiết kế tay dài thời trang kết hợp cùng tông màu tươi tắn và nhã nhặn sẽ mang lại diện mạo trẻ trung cho bạn khi sử dụng.
Chất liệu vải thun Tixi mềm mịn, co giãn tốt, thông thoáng, không xù lông, dễ dàng giặt sạch và nhanh khô.
Dây khóa dễ dàng kéo cao, có thể che được phần cổ kết hợp với phần mũ giúp bạn tránh nắng nóng hoặc không khí lạnh khi đi ra ngoài đường.
Túi áo có kèm dây kéo giúp bạn đựng đồ dùng mà không sợ rơi. Ngoài ra, bên trong áo có thêm 2 túi phụ rất tiện lợi, thích hợp cho bạn đựng điện thoại, ví, phụ kiện khác,...
Đường chỉ may đều đặn, chắc chắn và không thừa đầu chỉ khó chịu.
Miệng 2 túi 2 bên được may viền khác màu tạo điểm nhấn ấn tượng.
Áo dễ dàng kết hợp với các trang phục khác như: Áo Sơmi, Quần Jeans, Váy Maxi,..', 400000, N'/Resources/Image/files/aokhoac6.jpg', CAST(N'2016-06-08' AS Date), 3, 10, N'Đen viền cam', N'M         ', 12, 355000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (20, N'Quần Jean nữ Freelancer Xanh', N'Quần Jean Nữ Freelancer FWJN16A005-G2 - Xanh được may từ chất liệu cotton/spandex, mềm mịn, độ bền cao cùng khả năng co giãn tốt. Form quần ôm giúp tôn dáng, giúp bạn khoe vóc dáng quyến rũ. Quần may túi cổ điển mang đến sự trẻ trung và cá tính cho bạn gái.', 550000, N'/Resources/Image/files/quanjean4.jpg', CAST(N'2017-06-06' AS Date), 7, 11, N'Xanh viền đậm', N'M         ', 14, 400000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (21, N'Quần jean nữ Anata  Fashion', N'Quần Jean Dài Nữ Anata Fashion PPWPA091 - Light Dark được may từ chất liệu cotton/spandex, mềm mịn, độ bền cao cùng khả năng co giãn tốt. Form quần ôm giúp tôn dáng, giúp bạn khoe vóc dáng quyến rũ. Quần may 5 túi cổ điển với 3 túi trước và 2 túi sau, mang đến sự trẻ trung và cá tính cho bạn gái.', 449000, N'/Resources/Image/files/quanjean5.jpg', CAST(N'2016-07-08' AS Date), 7, 12, N'Xám sáng', N'M         ', 15, 430000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (22, N'Quần jean nữ ống loe Cirino', N'Quần Boyfriend AAA Jean Cirino form rộng được cải tiến từ mẫu boyfriend thông dụng nhưng ôm hơn mà không quá bó sát, mẫu quần này không những thoải mái, năng động mà còn tôn lên triệt để các đường cong trên cơ thể bạn.', 553000, N'/Resources/Image/files/quanjean6.jpg', CAST(N'2017-05-06' AS Date), 7, 5, N'Xanh dương', N'L         ', 10, 550000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (23, N'Quần legging nữ Feel Free Anata', N'Quần Legging Nữ Just Feel Free H6630 - Họa Tiết Sấm Sét được may từ chất liệu vải nhập khẩu với từng đường kim mũi chỉ tương đương đồ tập từ các thương hiệu nổi tiếng.', 230000, N'/Resources/Image/files/quanlegging1.jpg', CAST(N'2017-06-06' AS Date), 8, 12, N'Họa tiết sấm sét đen vàng', N'M         ', 12, 200000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (24, N'Quần legging nữ VIC', N'Quần Legging Nữ VIC VM084 - Đen (Freesize) tôn dáng triệt để, dễ phối với nhiều trang phục, thích hợp với nhiều dáng người.', 112000, N'/Resources/Image/files/quanlegging2.jpg', CAST(N'2107-05-06' AS Date), 8, 14, N'Đen', N'Freesize  ', 12, 109000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (25, N'Quần legging nữ Just Feel Free Size H6995', N'Quần Legging Nữ Just Feel Free H6995 được may từ chất liệu vải nhập khẩu với từng đường kim mũi chỉ tương đương đồ tập từ các thương hiệu nổi tiếng.', 260000, N'/Resources/Image/files/quanlegging3.jpg', CAST(N'2016-07-08' AS Date), 8, 15, N'Đen', N'Freesize  ', 16, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (26, N'Quần legging sọc VIC', N'Quần Legging 2 Sọc VIC có thiết kế form ôm với lưng thun rất tự nhiên, tạo cảm giác thoải mái nhất khi vận động, đồng thời cũng giúp tôn dáng và làm nổi bật những đường cong cơ thể. ', 345000, N'/Resources/Image/files/quanlegging4.jpg', CAST(N'2017-06-06' AS Date), 8, 14, N'Xám nhạt', N'Freesize  ', 10, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (27, N'Quần thun ngắn VIC D89', N'Quần Thun Ngắn VIC - Xám Nhạt có thiết kế đơn giản kiểu dáng quần ngắn trên gối trẻ trung đem lại vẻ ngoài năng động và khỏe khoắn.', 125000, N'/Resources/Image/files/quanthun1.jpg', CAST(N'2017-05-06' AS Date), 9, 14, N'Xám nhạt', N'FreeSize  ', 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (28, N'Quần thun lửng Fashion Anata ', N'Quần Thun Lửng Anata Fashion được may từ chất liệu vải da cá gồm 95% cotton và 5% spandex mềm mịn, thoáng mát. ', 200000, N'/Resources/Image/files/quanthun2.jpg', CAST(N'2017-06-07' AS Date), 9, 3, N'Xám ', N'M         ', 9, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (29, N'Quần thun dài VIC', N'Quần Thun Dài VIC được may từ chất liệu vải da cá và spandex mềm mịn, thoáng mát. ', 235000, N'/Resources/Image/files/quanthun3.jpg', CAST(N'2017-06-05' AS Date), 9, 14, N'Xám nhạt', N'M         ', 10, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (30, N'Quần thun ngắn Anata ', N'Quần Thun Ngắn Anata - Xanh Cổ Vịt có thiết kế đơn giản kiểu dáng quần ngắn trên gối trẻ trung đem lại vẻ ngoài năng động và khỏe khoắn.', 230000, N'/Resources/Image/files/quanthun4.jpg', CAST(N'2017-08-08' AS Date), 9, 3, N'Xanh cố vịt', N'M         ', 12, 215000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (31, N'Quần tây nữ Cirino Xám', N'Quần Tây Nữ Cirino - Xám sở hữu thiết kế kiểu dáng cùng màu sắc thời trang, cho bạn nữ sự trẻ trung, sành điệu nhưng cũng không kém phần nữ tính. Bên cạnh đó, quần được may từ chất liệu vải cao cấp, mềm mại, đường may chắc chắn và tỉ mỉ, mang đến độ bền cao cũng như sự thoải mái cho người mặc.', 554000, N'/Resources/Image/files/quantay1.jpg', CAST(N'2017-05-06' AS Date), 10, 5, N'Xám nhạt', N'Freesize  ', 17, 540000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (32, N'Quần tây nữ phối sọc Anata', N'Quần Tây Nữ Anata Xanh sở hữu thiết kế kiểu dáng cùng màu sắc thời trang, cho bạn nữ sự trẻ trung, sành điệu nhưng cũng không kém phần nữ tính. Bên cạnh đó, quần được may từ chất liệu vải cao cấp, mềm mại, đường may chắc chắn và tỉ mỉ, mang đến độ bền cao cũng như sự thoải mái cho người mặc.', 490000, N'/Resources/Image/files/quantay2.jpg', CAST(N'2017-06-07' AS Date), 10, 3, N'Xanh dương ', N'L         ', 20, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (33, N'Quần tây nữ Amun', N'Quần Tây Nữ Amun - Hồng (Size L) là item không thể thiếu trong tủ quần áo của mỗi cô gái. Thiết kế quần tây mang phong cách hiện đại đến từ nhãn hiệu Amun sẽ mang đến cho bạn vẻ ngoài thanh lịch và nhã nhặn.
', 342000, N'/Resources/Image/files/quantay3.jpg', CAST(N'2016-05-06' AS Date), 10, 6, N'Đỏ tươi', N'L         ', 12, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (34, N'Quần Short Freelancer', N'Quần Shorts Nữ Freelancer FWSP17S005-G1 - Đen được may từ chất liệu cotton cao cấp, đem tới cảm giác mềm mại, thoải mái khi mặc. Quần được thiết kế hiện đại, tinh tế và thời thượng, đem đến phong cách sành điệu cho phái nữ.', 245000, N'/Resources/Image/files/quanshort1.jpg', CAST(N'2016-05-06' AS Date), 12, 13, N'Đen', N'S         ', 12, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (35, N'Quần Short Amun Trắng', N'Quần Shorts Nữ Amun- Trắng có thiết kế màu trắng đơn giản nhưng thời trang, giúp cho vẻ ngoài của bạn gái thêm năng động nhưng vẫn giữ được nét thanh lịch và quyến rũ rất riêng.', 600000, N'/Resources/Image/files/quanshort2.jpg', CAST(N'2017-06-07' AS Date), 12, 6, N'Trắng', N'M         ', 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (36, N'Quần Short nữ Fashion Freelancer', N'Quân Shorts Nữ  Freelancer - Hồng là item không thể thiếu trong tủ quần áo của mỗi cô gái. Thiết kế quần shorts mang phong cách hiện đại đến từ nhãn hiệu Freelancer sẽ mang đến cho bạn vẻ ngoài năng động, khỏa khoắn.', 249000, N'/Resources/Image/files/quanshort3.jpg', CAST(N'2016-06-07' AS Date), 12, 13, N'Đỏ', N'M         ', 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (37, N'Đầm công sở V eden', N'Đầm Công Sở Cổ V Eden D121T - Tím mang đến vẻ ngoài thanh lịch pha chút quyến rũ và đằm thắm cho các quý cô với thiết kế dáng ôm giúp tôn lên số đo hoàn hảo của cơ thể, đồng thời tông màu ngọt dịu, nhẹ nhàng của đầm giúp cho các nàng dễ dàng lựa chọn phụ kiện để kết hợp.', 567000, N'/Resources/Image/files/damcs1.jpg', CAST(N'2017-06-06' AS Date), 13, 15, N'Tím', N'M         ', 7, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (38, N'Đầm công sở phối sọc Eden', N'Đầm Công Sở Phối Sọc Eden D120HN - Hồng Nhạt thiết kế cổ tròn phối tay ngắn trẻ trung, tông màu tinh tế và nhã nhặn mang đến cho bạn nhiều sự lựa chọn hơn khi cần phối với túi xách, đồng hồ, giày, áo khoác,... để xuống phố hay đi làm.', 679000, N'/Resources/Image/files/damcs2.jpg', CAST(N'2016-06-07' AS Date), 13, 15, N'Hồng nhạt', N'M         ', 14, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (39, N'Đầm công sở Dáng suông thuê hoa thủ công', N'Đầm Công Sở Dáng Suông Thêu Hoa Thủ Công Eden D210XN - Xanh nhạt sở hữu chất liệu Cotton lạnh mềm mại, thoáng mát, màu xanh nhã nhặn điểm nhấn là họa tiết hoa thêu tay thủ công trải dọc theo đường cắt nối lượn sóng phần thân trước sẽ khiến người mặc trở nên thon gọn hơn', 555000, N'/Resources/Image/files/damcs3.jpg', CAST(N'2016-05-06' AS Date), 13, 15, N'Xanh dương', N'L         ', 14, 550000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (40, N'Đầm dự tiệc độc đáo họa tiết hình thoi Cirino', N'ầm Maxi Dự Tiệc Độc Đáo CIRINO D_MAXIDT_KS_002FS - Xanh Hình Thoi (Freesize) nổi bật với họa tiết hình thoi lạ mắt và thiết kế suông dài mang lại vẻ nữ tính đầy lôi cuốn cho bạn gái. Được may từ chất liệu vải cotton thoáng mát, sản phẩm giúp người mặc luôn thoải mái và tự tin trong hoạt động. Bạn có thể sử dụng đầm này trong các dịp đi tiệc, đi chơi, đi dạo phố,… mà chỉ cần thay đổi một vài phụ kiện cho phù hợp.', 600000, N'/Resources/Image/files/damdt1.jpg', CAST(N'2015-06-07' AS Date), 14, 5, N'Xanh lá ', N'L         ', 20, 567000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (41, N'Đầm dạo phố phối lưới eden ', N'Đầm Suôn Dạo Phố Phối Lưới Elen- Hồng Cam với thiết kế cổ chữ V, tay sát nách cho nàng thêm xinh xắn khi xuống phố.', 569000, N'/Resources/Image/files/damdp1.jpg', CAST(N'2016-05-07' AS Date), 15, 15, N'Hồng cam', N'L         ', 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (43, N'Đầm xòe Eden D079', N'Đầm Xòe Eden D079D - Đỏ Đô thiết kế dáng váy chữ A cổ điển, phối màu ấn tượng mang đến vẻ ngoài sang trọng và thu hút mọi ánh nhìn cho người mặc.', 223000, N'/Resources/Image/files/damdp3.jpg', CAST(N'2017-04-06' AS Date), 15, 15, N'Đỏ đô', N'L         ', 7, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (44, N'Chân váy Xèo dưới Amun', N'Chân Váy xòe dưới Amun - Xanh với kiểu dáng chân váy đuôi cá hiện đại, tôn dáng cùng gam màu trung tính cho phái đẹp phong cách thời trang nữ tính và duyên dáng.', 459000, N'/Resources/Image/files/chanvay1.jpg', CAST(N'2017-04-06' AS Date), 21, 6, N'Xanh dương nhạt', N'M         ', 8, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (45, N'Chân váy Eden D71', N'Chân Váy Eden- Cam được thiết kế từ chất liệu cao cấp, kiểu dáng thời trang, mang lại nét quyến rũ, hiện đại cho phái đẹp.', 235000, N'/Resources/Image/files/chanvay2.jpg', CAST(N'2017-05-06' AS Date), 21, 15, N'Đỏ cam', N'L         ', 12, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (46, N'Chân váy bút chì thắt nơ Cirino', N'Chân Váy Bút Chì Thắt Nơ Cirino - Đen có thiết kế dáng bút chì ôm nhẹ cơ thể, thân váy thắt nơ xinh xắn kết hợp cùng tông màu cá tính giúp các nàng dễ dàng kết hợp cùng nhiều kiểu áo, giày hay túi xách.', 567000, N'/Resources/Image/files/chanvay3.jpg', CAST(N'2018-06-07' AS Date), 21, 5, N'Đen', N'M         ', 15, 500000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (47, N'Nón vành nữ Evest cao cấp ', N'Nón Vành Nữ Evest H23 - Màu Be mang đến cho vẻ ngoài của bạn gái nét thanh lịch và duyên dáng với thiết kế phối nơ nữ tính kết hợp cùng tông màu nền nã, dễ phối với nhiều kiểu váy áo khác nhau để các nàng luôn tự tin mỗi lần xuống phố.', 139000, N'/Resources/Image/files/mu1.jpg', CAST(N'2017-06-07' AS Date), 22, 16, N'Màu be', N'Freesize  ', 12, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (48, N'Mũ lady Beach Amun', N'Mũ Lady Beach Amun - Xanh Da Trời được thiết kế bằng chất liệu Polyester, siêu nhẹ, vành mũ rộng, giúp bạn luôn trông tự tin và xinh xắn mỗi khi đội', 379000, N'/Resources/Image/files/mu2.jpg', CAST(N'2106-07-08' AS Date), 22, 16, N'Màu trắng viền xanh', N'Freesize  ', 16, 330000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (49, N'Nón vành nữ Evest Đen', N'Nón Vành Nữ Evest H44 - Đen mang đến cho vẻ ngoài của bạn gái nét thanh lịch và duyên dáng với thiết kế phối nơ nữ tính kết hợp cùng tông màu nền nã, dễ phối với nhiều kiểu váy áo khác nhau để các nàng luôn tự tin mỗi lần xuống phố.', 289000, N'/Resources/Image/files/mu3.jpg', CAST(N'2016-07-08' AS Date), 22, 16, N'Đen', N'Freesize  ', 17, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (50, N'Cột tóc giả Chic ET Plus', N'Cột Tóc Giả Chic Et Plus CEP200600 với chất liệu thun và tóc giả, thiết kế nhỏ gọn giúp tô điểm cho mái tóc thêm đẹp, màu sắc trung tính là phụ kiện không thể thiếu của các chị em.
', 110000, N'/Resources/Image/files/pk1.jpg', CAST(N'2016-05-06' AS Date), 23, 17, N'Vầng nâu', N'FreeSize  ', 20, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (51, N'Bộ kẹp nhựa Chic ET Plus', N'Bộ Kẹp Nhựa Chíc ET Plus với chất liệu nhựa cao cấp, thiết kế dạng răng lược vừa có tác dụng kẹp chặt, vừa tô điểm cho mái tóc thêm đẹp, kiểu dáng nhỏ gọn cùng màu sắc trung tính là phụ kiện không thể thiếu của các chị em.', 560000, N'/Resources/Image/files/pk2.jpg', CAST(N'2017-06-08' AS Date), 23, 17, N'', N'FreeSize  ', 6, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (52, N'Cài tóc đính nơ thời trang Chic ET PLus', N'Cài Tóc Chic Et Plus CEP240117 - Đen với chất liệu kim loại cao cấp, thiết kế nhỏ gọn dễ dàng mang theo mọi lúc mọi nơi, giúp tô điểm mái tóc thêm đẹp, màu sắc trung tính là phụ kiện không thể thiếu của các chị em.', 339000, N'/Resources/Image/files/pk3.jpg', CAST(N'2016-07-08' AS Date), 23, 17, N'Đen', N'Freesize  ', 8, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (53, N'Dép xỏ ngón Adias', N'Dép Xỏ Ngón Adias kiểu dáng nữ tính ôm trọn lấy bàn chân, giúp cho từng bước đi của phái đẹp thêm phần quý phái và sang trọng. Dép được gia công cẩn thận giúp gia tăng độ bền đẹp và kéo dài tuổi thọ cho sản phẩm.', 345000, N'/Resources/Image/files/dep1.jpg', CAST(N'2017-07-08' AS Date), 24, 2, N'Xám', N'37        ', 9, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (54, N'Dép búp bê họa tiết Adias', N'Giày Búp Bê Họa Tiết Hoa Adias - Đồng có kiểu dáng đế bằng tiện lợi, dễ sử dụng và tiện mang mỗi ngày khi đi học, đi làm hay dạo phố. Giày có form ôm chân vừa vặn, tạo sự thoải mái và dễ chịu trên từng bước chân.', 229000, N'/Resources/Image/files/dep2.jpg', CAST(N'2017-09-08' AS Date), 24, 2, N'Hồng nhạt', N'37        ', 12, 200000, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (55, N'Dép quai bính Nike', N'Dép Quai Bính Nike- Đen có kiểu dáng cá tính và thời trang với thiết kế quai ngang tết bính độc đáo, tạo điểm nhấn cho cho đôi chân mảnh khảnh của các nàng. Phần quai may từ da tổng hợp cao cấp và bền chắc cho bạn yên tâm sử dụng dài lâu. Giày được gia công tỉ mỉ và chuẩn xác trong từng chi tiết nhỏ nhất giúp duy trì độ bền đẹp và gia tăng tuổi thọ cho sản phẩm.', 230000, N'/Resources/Image/files/dep3.jpg', CAST(N'2017-05-06' AS Date), 24, 7, N'Đen', N'36        ', 12, NULL, 0)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (56, N'Kính mắt nữ pan', N'Kính Mát Nữ PAN - Vàng có thiết kế khung tròng tròn trẻ trung, phối màu hợp thời trang giúp gương mặt người đeo thêm phần cuốn hút mỗi khi mang.', 329000, N'/Resources/Image/files/kinh1.jpg', CAST(N'2017-06-08' AS Date), 25, 18, N'Vàng nhạt', N'Freesize  ', 19, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (57, N'Kính mắt nữ pan Fashion D71', N'Kính Mát Nữ PAN fashion D71có kiểu dáng tròng mắt mèo sành điệu và xinh xắn với thiết kế gọng bạc sang trọng phối đen phong cách, tạo điểm nhấn hài hòa và thời thượng cho gương mặt thanh tú của phái đẹp. Các quý cô có thể phối kính với nón fedora rộng vành, nón nỉ cùng với áo trễ vai, áo sát nách khi đi biển, hoặc đầm coctail, đầm bút chì hay váy chữ A để dạo phố vào dịp cuối tuần.', 567000, N'/Resources/Image/files/kinh2.jpg', CAST(N'2017-06-09' AS Date), 25, 18, N'xám xanh', N'Fressize  ', 20, NULL, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (58, N'Kính mắt nữ PAN fashion D72', N'Kính Mát Nữ PAN fashion D71 có kiểu dáng gọng mắt mèo bản lớn, được bo cong nhẹ giúp tạo lên sự thanh thoát và quý phái cho gương mặt của phái nữ. Gọng kính có thiết kế mảnh nhằm ngăn chặn những vết hằn khó chịu khi đeo trong thời gian dài. Các quý cô có thể phối kính với nón fedora, nón rộng vành, nón nỉ cùng với áo Sơ Mi, đầm bút chì hay váy Maxi để dạo phố hoặc áo trễ vai, áo hai dây để đi dã ngoại hay du lịch.', 669000, N'/Resources/Image/files/kinh3.jpg', CAST(N'2017-09-09' AS Date), 25, 18, N'Đen', N'Freesize  ', 20, 640000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [UnitPrice], [Image], [DateProduct], [IdCategories], [IdSuppnier], [Color], [Size], [Quantity], [SaleOff], [Status]) VALUES (59, N'Đồng hồ dây kim loại Julius A56', N'Đồng Hồ Nữ Dây Kim Loại Julius JA-728D (28mm) - Đồng có thiết kế sang trọng, đẳng cấp, đạt đến trình độ thẩm mỹ cao tạo nên điểm nhấn thời thượng nơi cổ tay phái đẹp.', 567000, N'/Resources/Image/files/dongho1.jpg', CAST(N'2017-06-07' AS Date), 26, 19, N'Đồng', N'Freesize  ', 4, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (1, 1, N'TrinhMTA', N'Hàng đảm bảo chất lượng', CAST(N'2015-01-03' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (2, 8, N'TrinhMTA', NULL, CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (7, 24, NULL, N'tr', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (8, 24, NULL, N'tt', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (9, 1, NULL, N'Nhân viên giao hàng nhanh, Sản phẩm sử dụng tốt', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (10, 24, NULL, N'yyy', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (11, 58, NULL, N'yy', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (12, 24, NULL, N'kkk', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (13, 54, NULL, N'uu', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (14, 2, N'TrinhMTA', N'kkk', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (15, 4, N'TrinhMTA', N'tr', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (16, 58, N'TrinhMTA', N'ee', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Reviews] ([ID], [ProductID], [Username], [Status], [date]) VALUES (17, 8, N'TrinhMTA', N'Sản phẩm chất lượng tốt', CAST(N'2017-12-13' AS Date))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (1, N'T&D', N'logo1.jpg', N'TD@gmail.com', N'0987373123')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (2, N'Adidas', N'logo2.jpg', N'Adidas@gmail.com', N'0947439222')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (3, N'A91 Jeans', N'logo3.jpg', N'jeans@gmail.com', N'0983737322')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (4, N'Carita', N'logo4.jpg', N'carita@gmail.com', N'0958292922')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (5, N'Cirino', N'logo5.jpg', N'cirino@gmail.com', N'0393220003')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (6, N'Amun', N'logo6.jpg', N'Amun@gmail.com', N'0129393939')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (7, N'Nike', N'logo7.jpg', N'Nike@gmail.com', NULL)
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (8, N'PT200', N'logo8.jpg', N'pt200@gmail.com', NULL)
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (9, N'Phúc An', NULL, N'phucan@gmail.com', NULL)
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (10, N'Cửu Long', NULL, N'CuuLong@gmail.con', NULL)
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (11, N'Freelancer', NULL, N'freelancer@gmali.com', NULL)
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (12, N'Anata', NULL, N'Anata@gmail.com', N'0167898265')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (13, N'Just Feel Free', NULL, N'feelfree@gmai.con', N'0193927437')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (14, N'VIC', NULL, N'vic@gmail.com', N'0983479321')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (15, N'Eden', NULL, N'eden@gmail.com', N'0193846374')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (16, N'Evest', NULL, N'evest@gmail.com', N'0384728375')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (17, N'Chic ET Plus', NULL, N'Chic@gmail.com', N'0845636263')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (18, N'PAN', NULL, N'pan@gmail.com', N'0167898257')
INSERT [dbo].[Suppliers] ([Id], [Name], [Logo], [Email], [Phone]) VALUES (19, N'Julius', NULL, N'luli@gmail.com', N'0193284767')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[UserInRole] ([ID], [UserName], [IDRole], [Status]) VALUES (1, N'TrinhMTA', 1, 1)
INSERT [dbo].[UserInRole] ([ID], [UserName], [IDRole], [Status]) VALUES (2, N'TrinhMTA', 2, 1)
INSERT [dbo].[UserInRole] ([ID], [UserName], [IDRole], [Status]) VALUES (3, N'admin', 1, 0)
USE [master]
GO
ALTER DATABASE [FashionShop] SET  READ_WRITE 
GO
