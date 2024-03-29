USE [master]
GO
/****** Object:  Database [Store]    Script Date: 22.01.2024 13:25:21 ******/
CREATE DATABASE [Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Store] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Store] SET  MULTI_USER 
GO
ALTER DATABASE [Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Store', N'ON'
GO
ALTER DATABASE [Store] SET QUERY_STORE = ON
GO
ALTER DATABASE [Store] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Store]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percent] [float] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 22.01.2024 13:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (1, N'Дерибасовская, 20', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'Космонавтов, 33', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'Успенская, 89', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'Соборная, 10', 2)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'Проспект Мира, 1', 2)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (6, N'Андреевский спуск, 56', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (7, N'Грушевского, 23', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (8, N'Льва Толстого, 12', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (9, N'Суворова, 6', 4)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (10, N'Салатная, 5', 5)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (11, N'Зандала Шарика, 55', 6)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (12, N'Кроненштрассе, 1', 7)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (13, N'Спиталгассе, 11', 7)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (14, N'Лилитасан, 6', 8)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (15, N'Маллабар Марг, 5', 9)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (16, N'Гандхи Марг, 6', 9)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (17, N'Малл Роуд, 99', 10)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (18, N'Советская, 52', 11)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (19, N'Ленина, 65', 11)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (20, N'Комсомольская, 1', 12)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (21, N'Нью-Стрит, 32', 13)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (22, N'Корпорейшн Стрит, 33', 13)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (23, N'Говинда, 108', 15)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (24, N'Калле Ладиславо Кабрера, 87', 16)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (25, N'Родриген, 65', 17)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (26, N'Корсо Мазини, 23', 14)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Молочка')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Напитки')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Снеки')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Сладости')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Хлебобулочное')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Овощи')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Фрукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Замороженное')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Масла')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Сухофрукты и Орехи')
INSERT [dbo].[Category] ([id], [name]) VALUES (11, N'Консервы')
INSERT [dbo].[Category] ([id], [name]) VALUES (12, N'Крупы')
INSERT [dbo].[Category] ([id], [name]) VALUES (13, N'Соусы')
INSERT [dbo].[Category] ([id], [name]) VALUES (14, N'Пчелопродукты')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Одесса', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'Черноморск', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Киев', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Херсон', 3)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Конгаз', 5)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (6, N'Тараклия', 5)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (7, N'Берн', 6)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (8, N'Укхрул', 8)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (9, N'Бишнупур', 8)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (10, N'Амритсар', 11)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (11, N'Пинск', 13)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (12, N'Брест', 13)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (13, N'Бирмингем', 15)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (14, N'Катандзаро', 17)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (15, N'Кумяй', 18)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (16, N'Оруро', 20)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (17, N'Сан-Карлос', 21)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Украина')
INSERT [dbo].[Country] ([id], [name]) VALUES (2, N'Молдова')
INSERT [dbo].[Country] ([id], [name]) VALUES (3, N'Швейцария')
INSERT [dbo].[Country] ([id], [name]) VALUES (4, N'Индия')
INSERT [dbo].[Country] ([id], [name]) VALUES (5, N'Беларусь')
INSERT [dbo].[Country] ([id], [name]) VALUES (6, N'США')
INSERT [dbo].[Country] ([id], [name]) VALUES (7, N'Италия')
INSERT [dbo].[Country] ([id], [name]) VALUES (8, N'Таиланд')
INSERT [dbo].[Country] ([id], [name]) VALUES (9, N'Боливия')
INSERT [dbo].[Country] ([id], [name]) VALUES (10, N'Филиппины')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 2, 15, 1200, 500, CAST(N'2023-05-01' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 6, 10, 1100, 500, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 10, 11, 590, 100, CAST(N'2023-11-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 20, 1, 1600, 1000, CAST(N'2022-09-26' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 50, 6, 1600, 500, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (7, 32, 7, 560, 200, CAST(N'2023-06-01' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (8, 9, 8, 2000, 800, CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (9, 8, 9, 1900, 1000, CAST(N'2024-02-05' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (10, 16, 16, 3600, 2000, CAST(N'2022-09-21' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (11, 39, 20, 2000, 900, CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (12, 26, 2, 2100, 1500, CAST(N'2023-01-23' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (13, 48, 3, 3000, 200, CAST(N'2023-01-20' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (14, 33, 12, 1200, 500, CAST(N'2023-09-04' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (15, 34, 17, 1500, 1000, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (16, 18, 18, 1999, 1500, CAST(N'2023-04-21' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (17, 1, 13, 1950, 250, CAST(N'2023-09-30' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (18, 3, 4, 1500, 1200, CAST(N'2022-08-16' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (19, 43, 5, 900, 300, CAST(N'2023-06-10' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (20, 49, 14, 1600, 500, CAST(N'2023-02-11' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (1, N'Стандартная', 0)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (2, N'Праздничная', 3)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (3, N'Распродажа', 75)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (4, N'Студенческая', 15)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (5, N'Пенсионная', 20)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (6, N'Полная распродажа', 95)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (7, N'Оптовая покупка', 10)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (8, N'Скидка на пробные партии', 5)
INSERT [dbo].[Discount] ([id], [name], [percent]) VALUES (9, N'Для постоянных покупателей', 7)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (1, N'шт', N'Поштучно')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (2, N'2 л.', N'Бутылка 2 л.')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (3, N'1 л.', N'Бутылка 1 л.')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (4, N'0.5 л.', N'Бутылка 0.5 л.')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (5, N'кг', N'На вес')
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (1, N'КОМО', 1)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (2, N'Coca-Cola Company', 21)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (3, N'Frito Lay', 22)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (4, N'Простоквашино', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (5, N'Milennium', 4)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (6, N'Pepsi Co', 21)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (7, N'Одесский Хлебзавод', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (8, N'Morshinska', 1)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (9, N'Моя Ферма', 20)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (10, N'Ласунка', 6)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (11, N'Хлебзавод', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (12, N'Оливковая ферма', 25)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (13, N'Золотая осень', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (14, N'Sandora', 7)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (15, N'Данон', 19)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (16, N'Паста-Фабрик', 25)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (17, N'Рисовая плантация', 13)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (18, N'Хозяйство "Солнечный"', 10)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (19, N'Здоровый чай', 9)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (20, N'Сырзавод "Вкусный"', 8)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (21, N'Солнечный', 11)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (22, N'Завод заморозки', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (23, N'Фабрика "Вкуснятина"', 12)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (24, N'Зелённый мир', 12)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (25, N'Фабрика "Италия"', 26)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (26, N'Кокосовая ферма', 24)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (27, N'Здоровый орех', 22)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (28, N'Ароматный мир', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (29, N'Восточный аромат', 23)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (30, N'Сырный рай', 7)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (31, N'Золотая пчела', 10)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (32, N'Вкусный урожай', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (33, N'Зелёный урожай', 9)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (34, N'Ароматные оливки', 17)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (35, N'Золотая гречка', 14)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (36, N'Здоровая альтернатива', 13)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (37, N'Сладкий урожай', 8)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (38, N'Тропичный рай', 26)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (39, N'Вкусный стол', 3)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (40, N'Зелённые поля', 16)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (41, N'Радуга овощей', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (42, N'Здоровое зерно', 14)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (43, N'Вкусные бобы', 25)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (44, N'Свежее молоко', 23)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (45, N'Золотой урожай', 9)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (46, N'Здоровый лист', 6)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (47, N'Тропическое счастье', 24)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (48, N'Господарка', 9)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (49, N'Золотые яблоки', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (50, N'Счастливы вместе', 3)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (1, N'Голандский сыр', 1, 199, 500, 1, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (2, N'Кока-кола', 2, 35.5, 1000, 2, 2, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (3, N'Чипсы Lays', 3, 53.49, 1200, 3, 1, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (4, N'Молоко', 1, 39.75, 400, 4, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (5, N'Молочный шоколад', 4, 45, 1000, 5, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (6, N'Пепси', 2, 38.49, 1000, 6, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (7, N'Хлеб', 5, 20, 150, 7, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (8, N'Вода газированная', 2, 35.2, 2000, 8, 2, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (9, N'Картошка', 6, 19.25, 1000, 9, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (10, N'Мороженное', 8, 95.59, 500, 10, 1, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (11, N'Хлеб Бородинский', 5, 25.2, 100, 11, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (12, N'Оливковое масло', 9, 199.99, 700, 12, 4, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (13, N'Яблоки', 7, 49.99, 2000, 13, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (14, N'Сок "Виноградный"', 2, 38.2, 1500, 14, 3, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (15, N'Йогурт "Activia"', 1, 40, 200, 15, 4, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (16, N'Макароны "Спагети"', 12, 55.5, 4000, 16, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (17, N'Сахар', 12, 45.09, 1500, 17, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (18, N'Рис', 12, 85.65, 4000, 18, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (19, N'Помидоры "Черри"', 6, 149.4, 1000, 19, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (20, N'Чай "Фруктовый"', 2, 89.1, 2100, 20, 1, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (21, N'Сыр "Чеддер"', 1, 248.5, 500, 21, 5, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (22, N'Масло "Подсолечное"', 9, 112, 800, 22, 3, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (23, N'Картофель фри', 8, 129.99, 400, 23, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (24, N'Майонез', 13, 48.13, 1000, 24, 4, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (25, N'Кукуруза консервированная', 11, 49.1, 2700, 25, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (26, N'Макароны "Фарфалле"', 12, 58.75, 1500, 26, 5, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (27, N'Молоко кокосовое', 1, 115.9, 500, 27, 4, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (28, N'Орехи "Миндаль"', 10, 499.99, 600, 28, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (29, N'Соус "Помидорный"', 13, 52.3, 500, 29, 4, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (30, N'Чай "Ассам"', 2, 135.5, 1000, 30, 1, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (31, N'Сыр "Моцарелла"', 1, 210.65, 350, 31, 5, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (32, N'Мёд "Липовый"', 14, 298.25, 200, 32, 4, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (33, N'Сухофрукты "Изюм"', 10, 95.5, 500, 33, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (34, N'Помидоры', 6, 49.49, 500, 34, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (35, N'Оливки', 11, 75.56, 1000, 35, 5, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (36, N'Гречка', 12, 85, 900, 36, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (37, N'Соевое молоко', 1, 62.39, 200, 37, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (38, N'Морс "Клюквенный"', 2, 56.2, 450, 38, 3, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (39, N'Бананы', 7, 65.5, 1000, 39, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (40, N'Кетчуп', 13, 39.49, 500, 40, 4, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (41, N'Лук репчатый', 6, 15.19, 500, 41, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (42, N'Морковь', 6, 26.5, 800, 42, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (43, N'Киноа', 12, 123.4, 650, 43, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (44, N'Фасоль консерва', 11, 56.29, 1500, 44, 4, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (45, N'Кефир', 1, 69.96, 1000, 45, 3, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (46, N'Картофель "Белый"', 6, 35.5, 1000, 46, 5, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (47, N'Шпинат', 6, 64.49, 600, 47, 5, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (48, N'Масло кокосовое', 9, 246.25, 200, 48, 3, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (49, N'Огурцы "Маринованные"', 11, 145.1, 500, 49, 4, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (50, N'Яблоки "Голден"', 7, 48.59, 1000, 50, 5, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Одесская обасть', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'Киевская область', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Херсонская область', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Калараш', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Гагаузия', 2)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (6, N'Берн', 3)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (7, N'Швиц', 3)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (8, N'Манипур', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (9, N'Гоа', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (10, N'Орисса', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (11, N'Пенджаб', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (12, N'Трипура', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (13, N'Бретская область', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (14, N'Гомельская область', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (15, N'Алабама', 6)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (16, N'Аризона', 6)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (17, N'Калабрия', 7)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (18, N'Ясотхон', 8)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (19, N'Паттани', 8)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (20, N'Оруро', 9)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (21, N'Регион Илокос', 10)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 2, 35.5, 2, CAST(N'2023-05-01' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 6, 38.49, 1, CAST(N'2023-05-05' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 12, 199.99, 3, CAST(N'2022-11-25' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 11, 25.2, 1, CAST(N'2023-01-20' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 17, 45.09, 5, CAST(N'2023-08-05' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (6, 44, 56.29, 1, CAST(N'2024-01-10' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (7, 45, 69.96, 1, CAST(N'2023-08-08' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (8, 50, 48.59, 2, CAST(N'2023-07-23' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (9, 9, 19.25, 10, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (10, 2, 35.5, 6, CAST(N'2023-12-31' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (11, 6, 38.49, 12, CAST(N'2022-12-31' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (12, 3, 53.49, 4, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (13, 16, 55.5, 2, CAST(N'2022-10-05' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (14, 14, 38.2, 1, CAST(N'2023-09-09' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (15, 16, 55.5, 1, CAST(N'2023-10-06' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (16, 24, 48.13, 3, CAST(N'2023-04-26' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (17, 45, 69.96, 3, CAST(N'2023-02-03' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (18, 47, 64.49, 1, CAST(N'2024-05-01' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (19, 49, 145.1, 5, CAST(N'2023-11-29' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (20, 39, 65.5, 3, CAST(N'2023-08-05' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (1, N'Хлебзавод', 1)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (2, N'Все буде', 2)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'Love Water', 3)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (4, N'Бусик пандоры', 4)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (5, N'Солнечный ООО', 5)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (6, N'Вкусный стол ООО', 6)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (7, N'Свежее молоко ООО', 7)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (8, N'Здоровый лист ООО', 8)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (9, N'Золотые яблоки ООО', 9)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (10, N'Господарка ООО', 10)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (11, N'Тропичный рай ООО', 12)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (12, N'Аромат чая ООО', 14)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (13, N'Рисовая плантация ООО', 15)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (14, N'Восточный аромат ООО', 17)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (15, N'Kartofka', 19)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (16, N'Godfather company', 20)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (17, N'Здоровый орех ООО', 22)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (18, N'Молочная ферма ООО', 23)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (19, N'Здоровое зерно ООО', 24)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (20, N'Оливковая ферма ООО', 26)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Discount] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Store] SET  READ_WRITE 
GO
