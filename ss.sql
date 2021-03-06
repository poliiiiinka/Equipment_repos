USE [master]
GO
/****** Object:  Database [Equipment]    Script Date: 21.06.2022 15:16:34 ******/
CREATE DATABASE [Equipment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Equipment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Equipment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Equipment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Equipment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Equipment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Equipment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Equipment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Equipment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Equipment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Equipment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Equipment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Equipment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Equipment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Equipment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Equipment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Equipment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Equipment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Equipment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Equipment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Equipment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Equipment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Equipment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Equipment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Equipment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Equipment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Equipment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Equipment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Equipment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Equipment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Equipment] SET  MULTI_USER 
GO
ALTER DATABASE [Equipment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Equipment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Equipment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Equipment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Equipment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Equipment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Equipment] SET QUERY_STORE = OFF
GO
USE [Equipment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](120) NULL,
	[login] [nvarchar](60) NULL,
	[password] [nvarchar](50) NULL,
	[id_role] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](90) NULL,
	[inventory_number] [nvarchar](20) NULL,
	[year_of_issue] [int] NULL,
	[id_type] [int] NULL,
	[id_status] [int] NULL,
	[id_manufact] [int] NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactory]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nchar](10) NULL,
	[id_responsible] [int] NULL,
 CONSTRAINT [PK_Manufactory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repair]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[id_responsible] [int] NULL,
	[id_request] [int] NULL,
 CONSTRAINT [PK_Repair] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repair_status]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Repair_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](30) NULL,
	[short_description] [nvarchar](max) NULL,
	[id_equip] [int] NULL,
	[id_master] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_of_equipment]    Script Date: 21.06.2022 15:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_of_equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type_of_equipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (1, N'Матвеев Дамир Ильич', N'Zazana', N'sek8dy', 1)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (2, N'Лукьянов Марк Ильич', N'Yann', N'kz20wz', 1)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (3, N'Титов Макар Иванович', N'Onatoni', N'm0y5tq', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (4, N'Дроздова Ксения Никитична', N'Ujiaaa', N'xif75x', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (5, N'Кондратьева Аиша Дмитриевна', N'Eahinet', N'bew0ot', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (6, N'Покровский Марат Егорович', N'Cooperal', N'cooper', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (7, N'Романова Алиса Константиновна', N'Stin', N'tbam3v', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (8, N'Тарасов Максим Павлович', N'Rrett', N'lwaq5c', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (9, N'Столяров Роман Робертович', N'Kitoki', N'ykqnx9', 3)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (10, N'Воронин Тимофей Тимофеевич', N'Delbyaak', N'4hm8ba', 3)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (11, N'Митрофанов Всеволод Антонович', N'Meld', N'59lqq9', 3)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (12, N'Никитин Лев Владиславович', N'nik', N'1', 1)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (13, N'Соколов Николай Ярославович', N'sokol', N'2', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (14, N'Левин Леонид Маркович', N'lev', N'3', 3)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (15, N'Андреев Вячеслав Юрьевич', N'Thiall', N'CRRSw7', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (16, N'Богомолова Александра Матвеевна', N'Elineala', N'9f8Lx9', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (17, N'Петров Даниил Маркович', N'Vanner', N'611c63', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (18, N'Виноградов Михаил Давидович', N'Waldona', N'VgHhS0', 2)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (19, N'Булочкин Виктор Андреевич', N'vikvik', N'7265Qa', 3)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (20, N'Туточкин Олег Сергеевич', N'tutu', N'en-GB', 1)
INSERT [dbo].[Account] ([id], [FIO], [login], [password], [id_role]) VALUES (21, N'Михайлов Михаил Михайлович', N'misha', N'mechanic', 3)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (1, N'ИЖ 1И611П', N'104', 1974, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (2, N'250ИТВМ.01', N'00032926', 2015, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (3, N'ИЖ 240 ТС', N'139', 1989, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (4, N'УТ16П', N'143', 1984, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (5, N'SV 18 RA', N'71', 1984, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (6, N'MN 80A', N'25', 1987, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (7, N'MN 80A', N'169', 1984, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (8, N'ИЖ 250 ИТВМ-01', N'3067', 2006, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (9, N'1Е 61 ПМ', N'225', 1976, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (10, N'MN 80A', N'178', 1984, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (11, N'СТ16К20/1000', N'Л49949', 2020, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (12, N'16К20П', N'2894', 2005, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (13, N'SV 18 RA', N'1124', 1969, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (14, N'16Р25П', N'3236', 2009, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (15, N'ИС1-195ТС', N'120', 1981, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (16, N'16Б16КА', N'1197', 1987, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (17, N'ИЖ 1И611П', N'1144', 1976, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (18, N'ИЖ 1И611П', N'107', 1979, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (19, N'250ИТВМ.01', N'00032896', 2015, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (20, N'250ИТВМ.01', N'00032902', 2015, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (21, N'250ИТВМ.01', N'00033053', 2015, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (22, N'OPTIUM D240-500 DC/G', N'3366', 2012, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (23, N'ЕМО-200', N'222', 1976, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (24, N'ИЖ 1И611П', N'1143', 1974, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (25, N'УТ16П', N'10', 1984, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (26, N'16К20', N'86', 1973, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (27, N'CS6150B/2000', N'33010014', 2017, 1, 3, 2)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (28, N'ОФ 55', N'280', 1989, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (29, N'ФС 250-02', N'1154', 1992, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (30, N'ФС 250-02', N'1118', 1992, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (31, N'ОФ 55', N'121', 1982, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (32, N'ОФ 55', N'283', 1989, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (33, N'OMM 64S', N'3065', 2007, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (34, N'6Т 82Ш', N'3237', 2009, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (35, N'ОФ-55', N'188', 1978, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (36, N'675 ПФ', N'79', 1985, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (37, N'СФ 250', N'1067', 1991, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (38, N'JMD-18', N'33010809', 2019, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (39, N'JMD-3', N'33010816', 2019, 2, 3, 5)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (40, N'MIYANO BNA-34S', N'3508', 2011, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (41, N'MIYANO BNA-42S', N'3517', 2011, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (42, N'MIYANO BNA-42S', N'3578', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (43, N'MIYANO BNA-42S', N'3579', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (44, N'MIYANO BND-51SY', N'3546', 2012, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (45, N'MIYANO BND-51SY', N'3547', 2012, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (46, N'MIYANO BND-51SY', N'33010137', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (47, N'MIYANO BND-51SY', N'33010144', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (48, N'MIYANO BND-51SY', N'3577', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (49, N'MIYANO BND-51SY', N'3576', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (50, N'MIYANO BND-51SY', N'00044585', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (51, N'MIYANO BND-51SY', N'00044592', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (52, N'FEELER FTC-350L', N'3448', 2013, 3, 3, 6)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (53, N'UM-V400', N'33011042', 2021, 4, 3, 1)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (54, N'UM-V400', N'33011059', 2021, 4, 3, 1)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (55, N'UM-V400', N'33011066', 2021, 4, 3, 1)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (56, N'DNM 500 II', N'33010090', 2014, 4, 3, 1)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (57, N'DNM 500 II', N'00031257', 2014, 4, 3, 1)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (58, N'VB-610', N'3151', 2007, 4, 3, 1)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (59, N'3Е 180В', N'1125', 1989, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (60, N'395 1ВФ1', N'1074', 1989, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (61, N'395 2ВФ1У', N'0004445', 2010, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (62, N'3Д 642Е', N'2025', 1985, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (63, N'ВЗ-318Е', N'2703', 2004, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (64, N'ОШ-400-30', N'3238', 2008, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (65, N'GS-26', N'3305', 2011, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (66, N'GS-6', N'3306', 2011, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (67, N'GS-7', N'3307', 2012, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (68, N'E-tech EGP-2050NC', N'3572', 2013, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (69, N'E-tech ECG-1206S', N'Л41474', 2019, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (70, N'SG1-50', N'33010731', 2020, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (71, N'СО-331', N'33011189', 2021, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (72, N'GS-9', N'33011363', 2021, 5, 3, 9)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (73, N'ГС2116К', N'12616', 2011, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (74, N'2Н118', N'12607', 1965, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (75, N'2Г125', N'12608', 1964, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (76, N'2Н106П', N'12609', 1977, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (77, N'2Н106П', N'12610', 1977, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (78, N'2Н106П', N'12611', 1977, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (79, N'2Г125', N'12612', 1977, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (80, N'JMB-3', N'3490', 2014, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (81, N'2М112', N'1190', 1969, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (82, N'2М112', N'1191', 1969, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (83, N'2М112', N'1192', 1969, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (84, N'2А106', N'1009', 1960, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (85, N'2Е52', N'3646', 1967, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (86, N'АС 2540', N'00032667', 2013, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (87, N'Верт. резьбонарезн. ст. ВСН-12', N'3556', 2016, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (88, N'Бумагосверл. машина Filepecker III 100', N'3287', 2009, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (89, N'2М112', N'33010205', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (90, N'2М112', N'33010212', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (91, N'2М112', N'33010298', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (92, N'Верт. резьбонарезн. ст. ВСН-12', N'33010311', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (93, N'Верт. резьбонарезн. ст. ВСН-12', N'33010328', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (94, N'2М112', N'33010717', 2020, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (95, N'2М112', N'33010724', 2020, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (96, N'Верт. резьбонарезн. ст. ВСН-12', N'33010311', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (97, N'Верт. резьбонарезн. ст. ВСН-12', N'33010328', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (98, N'Напольный сверлильный ст. IDP-22', N'33010649', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (99, N'Настольный сверлильный ст. JDP-10M', N'33010656', 2019, 6, 3, 4)
GO
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (100, N'Верт. разьбонарезн. ст. ВСН-12', N'33011233', 2019, 6, 3, 4)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (101, N'PHM-63h', N'2023', 1977, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (102, N'С-3465М', N'3204', 2003, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (103, N'100х400-2Э', N'2413', 2003, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (104, N'100х400-2Э', N'3447', 2012, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (105, N'ДБ 2426', N'221', 1974, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (106, N'Пресс (малый) №1', N'б/н', 1975, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (107, N'Пресс (малый) №2', N'б/н', 1975, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (108, N'Пресс (малый) №3', N'б/н', 1975, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (109, N'XD-1000', N'3178', NULL, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (110, N'XD-1000', N'3177', NULL, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (111, N'XD-1000', N'3205', NULL, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (112, N'ФБ1732А', N'1176', 1991, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (113, N'ЭП-100', N'108', 1979, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (114, N'Ф1734А', N'2004', 1989, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (115, N'PYE-250S1M', N'3580', 1986, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (116, N'LENP 63A (Чех)', N'1115', 1979, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (117, N'Молот М4132А', N'1170', NULL, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (118, N'Пресс кривошипный КД 2128', N'3592', 2016, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (119, N'XD(YG) - 1000', N'3555', 2015, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (120, N'Пресс ножницы НГ 5224', N'3566', 2016, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (121, N'Пресс листогибочный ПГЛ-160.25', N'3565', 2016, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (122, N'П6328б', N'33010298', 2019, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (123, N'Пресс кривошипный 100 т.', N'1160', NULL, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (124, N'Пресс кривошипный КД2130', N'Л47342', 2020, 7, 3, 8)
INSERT [dbo].[Equipment] ([id], [title], [inventory_number], [year_of_issue], [id_type], [id_status], [id_manufact]) VALUES (125, N'Пресс гидравлический KSY-040H', N'Л51148', 2020, 7, 3, 8)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufactory] ON 

INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (1, N'1-М       ', 3)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (2, N'2-ЭЛ      ', 6)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (3, N'3-А       ', 5)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (4, N'4-КС      ', 4)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (5, N'5-Л       ', 8)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (6, N'6-ПП      ', 7)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (7, N'7-НК      ', 17)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (8, N'8-ОУ      ', 15)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (9, N'9-Ф       ', 18)
INSERT [dbo].[Manufactory] ([id], [number], [id_responsible]) VALUES (10, N'10-РП     ', 16)
SET IDENTITY_INSERT [dbo].[Manufactory] OFF
GO
SET IDENTITY_INSERT [dbo].[Repair] ON 

INSERT [dbo].[Repair] ([id], [start_date], [end_date], [id_responsible], [id_request]) VALUES (1, CAST(N'2021-11-10' AS Date), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Repair] OFF
GO
SET IDENTITY_INSERT [dbo].[Repair_status] ON 

INSERT [dbo].[Repair_status] ([id], [status]) VALUES (1, N'В ремонте')
INSERT [dbo].[Repair_status] ([id], [status]) VALUES (2, N'Требует ремонта')
INSERT [dbo].[Repair_status] ([id], [status]) VALUES (3, N'Ремонт не требуется')
INSERT [dbo].[Repair_status] ([id], [status]) VALUES (4, N'Списано')
SET IDENTITY_INSERT [dbo].[Repair_status] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [status], [short_description], [id_equip], [id_master]) VALUES (1, N'В обработке', NULL, 72, 6)
INSERT [dbo].[Request] ([id], [status], [short_description], [id_equip], [id_master]) VALUES (2, N'В обработке', NULL, 10, 4)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([id], [role]) VALUES (2, N'Мастер')
INSERT [dbo].[Role] ([id], [role]) VALUES (3, N'Механик')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_of_equipment] ON 

INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (1, N'Токарные станки')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (2, N'Фрезерные станки')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (3, N'Горизонтальные обрабатывающие центры')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (4, N'Вертикальные обрабатывающие центры')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (5, N'Шлифовальные станки')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (6, N'Сверлильные станки')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (7, N'Прессовое оборудование')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (8, N'Термопластавтоматы')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (9, N'Ножницы гильотинные')
INSERT [dbo].[Type_of_equipment] ([id], [type]) VALUES (10, N'Прочие станки и оборудование')
SET IDENTITY_INSERT [dbo].[Type_of_equipment] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([id_role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Manufactory1] FOREIGN KEY([id_manufact])
REFERENCES [dbo].[Manufactory] ([id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Manufactory1]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Repair_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Repair_status] ([id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Repair_status]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Type_of_equipment] FOREIGN KEY([id_type])
REFERENCES [dbo].[Type_of_equipment] ([id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Type_of_equipment]
GO
ALTER TABLE [dbo].[Manufactory]  WITH CHECK ADD  CONSTRAINT [FK_Manufactory_Account] FOREIGN KEY([id_responsible])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Manufactory] CHECK CONSTRAINT [FK_Manufactory_Account]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Account] FOREIGN KEY([id_responsible])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Account]
GO
ALTER TABLE [dbo].[Repair]  WITH CHECK ADD  CONSTRAINT [FK_Repair_Request] FOREIGN KEY([id_request])
REFERENCES [dbo].[Request] ([id])
GO
ALTER TABLE [dbo].[Repair] CHECK CONSTRAINT [FK_Repair_Request]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Account] FOREIGN KEY([id_master])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Account]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Equipment] FOREIGN KEY([id_equip])
REFERENCES [dbo].[Equipment] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Equipment]
GO
USE [master]
GO
ALTER DATABASE [Equipment] SET  READ_WRITE 
GO
