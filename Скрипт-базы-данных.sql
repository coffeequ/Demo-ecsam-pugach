USE [master]
GO
/****** Object:  Database [СозданиеМебели]    Script Date: 13.05.2025 13:27:46 ******/
CREATE DATABASE [СозданиеМебели]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'СозданиеМебели', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\СозданиеМебели.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'СозданиеМебели_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\СозданиеМебели_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [СозданиеМебели] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [СозданиеМебели].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [СозданиеМебели] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [СозданиеМебели] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [СозданиеМебели] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [СозданиеМебели] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [СозданиеМебели] SET ARITHABORT OFF 
GO
ALTER DATABASE [СозданиеМебели] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [СозданиеМебели] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [СозданиеМебели] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [СозданиеМебели] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [СозданиеМебели] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [СозданиеМебели] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [СозданиеМебели] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [СозданиеМебели] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [СозданиеМебели] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [СозданиеМебели] SET  DISABLE_BROKER 
GO
ALTER DATABASE [СозданиеМебели] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [СозданиеМебели] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [СозданиеМебели] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [СозданиеМебели] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [СозданиеМебели] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [СозданиеМебели] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [СозданиеМебели] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [СозданиеМебели] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [СозданиеМебели] SET  MULTI_USER 
GO
ALTER DATABASE [СозданиеМебели] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [СозданиеМебели] SET DB_CHAINING OFF 
GO
ALTER DATABASE [СозданиеМебели] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [СозданиеМебели] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [СозданиеМебели] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [СозданиеМебели] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [СозданиеМебели] SET QUERY_STORE = OFF
GO
USE [СозданиеМебели]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[ТипМатериала] [nvarchar](50) NOT NULL,
	[ПроцентПотериСырья] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[КодТипПродукции] [int] NOT NULL,
	[НаименованиеПродукции] [nvarchar](300) NOT NULL,
	[Артикул] [nvarchar](50) NOT NULL,
	[МинСтоимостьДляПартнера] [float] NOT NULL,
	[КодОсновнойМатериал] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterialType]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterialType](
	[Код] [int] NOT NULL,
	[Наимненование] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ProductMaterialType] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[ТипПродукции] [nvarchar](50) NOT NULL,
	[Коэффициент] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductWorkShops]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWorkShops](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[КодПродукции] [int] NOT NULL,
	[КодЦеха] [int] NOT NULL,
	[ВремяИзготовления] [float] NOT NULL,
 CONSTRAINT [PK_ProductWorkShops] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeWorkShops]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeWorkShops](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeWorkShops] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkShop]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkShop](
	[Код] [nchar](10) NOT NULL,
	[Наименование] [nvarchar](200) NULL,
	[ТипЦеха] [int] NULL,
	[КоличествоЧелДляПроизводства] [int] NULL,
 CONSTRAINT [PK_WorkShop] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkShops]    Script Date: 13.05.2025 13:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkShops](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[НазаваниеЦеха] [nvarchar](200) NOT NULL,
	[КодТипаЦеха] [int] NOT NULL,
	[КоличествоЧелДляПроизодства] [int] NOT NULL,
 CONSTRAINT [PK_WorkShops] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Код], [ТипМатериала], [ПроцентПотериСырья]) VALUES (1, N'Мебельный щит из массива дерева', 0.008)
INSERT [dbo].[MaterialType] ([Код], [ТипМатериала], [ПроцентПотериСырья]) VALUES (2, N'Ламинированное ДСП', 0.007)
INSERT [dbo].[MaterialType] ([Код], [ТипМатериала], [ПроцентПотериСырья]) VALUES (3, N'Фанера', 0.0055)
INSERT [dbo].[MaterialType] ([Код], [ТипМатериала], [ПроцентПотериСырья]) VALUES (4, N'МДФ', 0.003)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (1, 1, N'Комплект мебели для гостиной Ольха горная', N'1549922', 160507, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (2, 1, N'Стенка для гостиной Вишня темная', N'1018556', 216907, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (3, 2, N'Прихожая Венге Винтаж', N'3028272', 24970, 2)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (4, 2, N'Тумба с вешалкой Дуб натуральный', N'3029272', 18206, 2)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (5, 2, N'Прихожая-комплект Дуб темный', N'3028248', 177509, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (6, 3, N'Диван-кровать угловой Книжка', N'7118827', 85900, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (7, 3, N'Диван модульный Телескоп', N'7137981', 75900, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (8, 3, N'Диван-кровать Соло', N'7029787', 120345, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (9, 3, N'Детский диван Выкатной', N'7758953', 25990, 3)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (10, 4, N'Кровать с подъемным механизмом с матрасом 1600х2000 Венге', N'6026662', 69500, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (11, 4, N'Кровать с матрасом 90х2000 Венге', N'6159043', 55600, 2)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (12, 4, N'Кровать универсальная Дуб натуральный', N'6588376', 37900, 2)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (13, 4, N'Кровать с ящиками Ясень белый', N'6758375', 46750, 3)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (14, 5, N'Шкаф-купе 3-х дверный Сосна белая', N'2759324', 131560, 2)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (15, 5, N'Стеллаж Бук натуральный', N'2118827', 38700, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (16, 5, N'Шкаф 4 дверный с ящиками Ясень серый', N'2559898', 160151, 3)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (17, 5, N'Шкаф-пенал Береза белый', N'2259474', 40500, 3)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (18, 6, N'Комод 6 ящиков Вишня светлая', N'4115947', 61235, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (19, 6, N'Комод 4 ящика Вишня светлая', N'4033136', 41200, 1)
INSERT [dbo].[Product] ([Код], [КодТипПродукции], [НаименованиеПродукции], [Артикул], [МинСтоимостьДляПартнера], [КодОсновнойМатериал]) VALUES (20, 6, N'Тумба под ТВ ', N'4028048', 12350, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductMaterialType] ([Код], [Наимненование]) VALUES (1, N'Мебельный щит из массива дерева')
INSERT [dbo].[ProductMaterialType] ([Код], [Наимненование]) VALUES (2, N'Ламинированное ДСП')
INSERT [dbo].[ProductMaterialType] ([Код], [Наимненование]) VALUES (3, N'Фанера')
INSERT [dbo].[ProductMaterialType] ([Код], [Наимненование]) VALUES (4, N'МДФ')
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Код], [ТипПродукции], [Коэффициент]) VALUES (1, N'Гостиные', 3.5)
INSERT [dbo].[ProductType] ([Код], [ТипПродукции], [Коэффициент]) VALUES (2, N'Прихожие', 5.6)
INSERT [dbo].[ProductType] ([Код], [ТипПродукции], [Коэффициент]) VALUES (3, N'Мягкая мебель', 3)
INSERT [dbo].[ProductType] ([Код], [ТипПродукции], [Коэффициент]) VALUES (4, N'Кровати', 4.7)
INSERT [dbo].[ProductType] ([Код], [ТипПродукции], [Коэффициент]) VALUES (5, N'Шкафы', 1.5)
INSERT [dbo].[ProductType] ([Код], [ТипПродукции], [Коэффициент]) VALUES (6, N'Комоды', 2.3)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductWorkShops] ON 

INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (1, 10, 8, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (2, 20, 8, 2.7)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (3, 6, 9, 4.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (4, 7, 9, 4.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (5, 8, 9, 4.7)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (6, 9, 9, 4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (7, 11, 9, 5.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (8, 2, 10, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (9, 3, 10, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (10, 5, 10, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (11, 10, 10, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (12, 14, 10, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (13, 20, 10, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (14, 1, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (15, 2, 4, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (16, 3, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (17, 4, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (18, 5, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (19, 6, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (20, 7, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (21, 8, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (22, 9, 4, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (23, 10, 4, 0.6)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (24, 11, 4, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (25, 12, 4, 0.8)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (26, 13, 4, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (27, 14, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (28, 15, 4, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (29, 16, 4, 1.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (30, 17, 4, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (31, 18, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (32, 19, 4, 0.4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (33, 20, 4, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (34, 1, 6, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (35, 2, 6, 0.4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (36, 5, 6, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (37, 6, 6, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (38, 7, 6, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (39, 8, 6, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (40, 9, 6, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (41, 10, 6, 0.4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (42, 13, 6, 1.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (43, 15, 6, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (44, 17, 6, 2.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (45, 18, 6, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (46, 19, 6, 0.4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (47, 20, 6, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (48, 1, 1, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (49, 2, 1, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (50, 5, 1, 1.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (51, 8, 1, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (52, 14, 1, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (53, 15, 1, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (54, 20, 1, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (55, 1, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (56, 2, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (57, 3, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (58, 4, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (59, 5, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (60, 6, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (61, 7, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (62, 8, 3, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (63, 9, 3, 0.7)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (64, 10, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (65, 11, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (66, 12, 3, 1.1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (67, 13, 3, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (68, 14, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (69, 15, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (70, 16, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (71, 17, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (72, 18, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (73, 19, 3, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (74, 20, 3, 0.6)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (75, 1, 2, 0.4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (76, 2, 2, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (77, 5, 2, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (78, 8, 2, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (79, 14, 2, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (80, 15, 2, 0.7)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (81, 20, 2, 0.4)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (82, 2, 11, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (83, 3, 11, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (84, 5, 11, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (85, 6, 11, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (86, 7, 11, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (87, 12, 11, 0.8)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (88, 13, 11, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (89, 14, 11, 1.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (90, 15, 11, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (91, 16, 11, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (92, 18, 11, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (93, 20, 11, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (94, 1, 7, 1.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (95, 2, 7, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (96, 5, 7, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (97, 7, 7, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (98, 8, 7, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (99, 9, 7, 1)
GO
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (100, 15, 7, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (101, 16, 7, 1)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (102, 17, 7, 3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (103, 18, 7, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (104, 19, 7, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (105, 1, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (106, 2, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (107, 5, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (108, 6, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (109, 7, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (110, 15, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (111, 18, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (112, 19, 5, 2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (113, 1, 12, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (114, 4, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (115, 5, 12, 0.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (116, 6, 12, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (117, 7, 12, 0.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (118, 8, 12, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (119, 9, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (120, 10, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (121, 11, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (122, 12, 12, 0.3)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (123, 13, 12, 0.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (124, 14, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (125, 15, 12, 0.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (126, 16, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (127, 17, 12, 0.5)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (128, 18, 12, 0.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (129, 19, 12, 0.2)
INSERT [dbo].[ProductWorkShops] ([Код], [КодПродукции], [КодЦеха], [ВремяИзготовления]) VALUES (130, 20, 12, 0.3)
SET IDENTITY_INSERT [dbo].[ProductWorkShops] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeWorkShops] ON 

INSERT [dbo].[TypeWorkShops] ([Код], [Наименование]) VALUES (1, N'Проектирование')
INSERT [dbo].[TypeWorkShops] ([Код], [Наименование]) VALUES (2, N'Обработка')
INSERT [dbo].[TypeWorkShops] ([Код], [Наименование]) VALUES (3, N'Сушка')
INSERT [dbo].[TypeWorkShops] ([Код], [Наименование]) VALUES (4, N'Сборка')
SET IDENTITY_INSERT [dbo].[TypeWorkShops] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkShops] ON 

INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (1, N'Проектный', 1, 4)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (2, N'Расчетный', 1, 5)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (3, N'Раскроя', 2, 5)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (4, N'Обработки', 2, 6)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (5, N'Сушильный', 3, 3)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (6, N'Покраски', 2, 5)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (7, N'Столярный', 2, 7)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (8, N'Изготовления изделий из искусственного камня и композитных материалов', 2, 3)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (9, N'Изготовления мягкой мебели', 2, 5)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (10, N'Монтажа стеклянных, зеркальных вставок и других изделий', 4, 2)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (11, N'Сборки', 4, 6)
INSERT [dbo].[WorkShops] ([Код], [НазаваниеЦеха], [КодТипаЦеха], [КоличествоЧелДляПроизодства]) VALUES (12, N'Упаковки', 4, 4)
SET IDENTITY_INSERT [dbo].[WorkShops] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductMaterialType] FOREIGN KEY([КодОсновнойМатериал])
REFERENCES [dbo].[ProductMaterialType] ([Код])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductMaterialType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([КодТипПродукции])
REFERENCES [dbo].[ProductType] ([Код])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductWorkShops]  WITH CHECK ADD  CONSTRAINT [FK_ProductWorkShops_Product] FOREIGN KEY([КодПродукции])
REFERENCES [dbo].[Product] ([Код])
GO
ALTER TABLE [dbo].[ProductWorkShops] CHECK CONSTRAINT [FK_ProductWorkShops_Product]
GO
ALTER TABLE [dbo].[ProductWorkShops]  WITH CHECK ADD  CONSTRAINT [FK_ProductWorkShops_WorkShops] FOREIGN KEY([КодЦеха])
REFERENCES [dbo].[WorkShops] ([Код])
GO
ALTER TABLE [dbo].[ProductWorkShops] CHECK CONSTRAINT [FK_ProductWorkShops_WorkShops]
GO
ALTER TABLE [dbo].[WorkShops]  WITH CHECK ADD  CONSTRAINT [FK_WorkShops_TypeWorkShops] FOREIGN KEY([КодТипаЦеха])
REFERENCES [dbo].[TypeWorkShops] ([Код])
GO
ALTER TABLE [dbo].[WorkShops] CHECK CONSTRAINT [FK_WorkShops_TypeWorkShops]
GO
USE [master]
GO
ALTER DATABASE [СозданиеМебели] SET  READ_WRITE 
GO
