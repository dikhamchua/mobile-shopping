USE [master]
GO
/****** Object:  Database [PRJ301_SU23]    Script Date: 6/5/2023 7:22:27 AM ******/
CREATE DATABASE [PRJ301_SU23]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_SU23', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_SU23.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_SU23_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_SU23_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_SU23] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SU23].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SU23] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SU23] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SU23] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SU23] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SU23] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_SU23] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SU23] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SU23] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SU23] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SU23] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SU23] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_SU23] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_SU23', N'ON'
GO
ALTER DATABASE [PRJ301_SU23] SET QUERY_STORE = OFF
GO
USE [PRJ301_SU23]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 6/5/2023 7:22:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[author] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/5/2023 7:22:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categorry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (1, N'Asoka', N'War operation involving other effects of nuclear weapons, military personnel, sequela', N'Kalindi Haworth', 71.6, 42, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (2, N'Veribet', N'Nondisplaced Maisonneuve''s fracture of left leg, initial encounter for open fracture type I or II', N'Sayre Yewdall', 93.1, 47, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (3, N'Keylex', N'Unspecified sprain of left little finger', N'Sarajane Morsom', 5.1, 52, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (4, N'Tres-Zap', N'Corrosion of second degree of wrist and hand', N'Alistair Zielinski', 43.6, 74, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (5, N'Veribet', N'Poisoning by chloramphenicol group, intentional self-harm, sequela', N'Henryetta Whitrod', 97.5, 67, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (6, N'Cardify', N'Puncture wound with foreign body of left thumb without damage to nail, subsequent encounter', N'Constantine Collin', 95.9, 19, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (7, N'Zathin', N'Unspecified injury of other blood vessels of thorax, left side, sequela', N'Ev Eacott', 35, 45, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (8, N'Sub-Ex', N'Acute perichondritis of external ear, bilateral', N'Hewie Crispin', 99.5, 7, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (9, N'Job', N'Nondisplaced comminuted fracture of shaft of right femur, subsequent encounter for open fracture type I or II with nonunion', N'Joachim Santarelli', 4, 7, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (10, N'Fintone', N'Corrosion of first degree of abdominal wall', N'Augusto Gartside', 96.6, 44, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (11, N'Redhold', N'Transient synovitis, unspecified hand', N'Noam Watkiss', 8.4, 5, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (12, N'Sonair', N'Idiopathic aseptic necrosis of pelvis and femur', N'Julio Dulake', 91.2, 39, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (13, N'Redhold', N'Salter-Harris Type I physeal fracture of lower end of radius, unspecified arm', N'Giavani D''Abbot-Doyle', 99.8, 56, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (14, N'Bigtax', N'Melanocytic nevi of right ear and external auricular canal', N'Sky Kubu', 60.1, 18, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (15, N'Temp', N'Laceration without foreign body of right thumb without damage to nail, initial encounter', N'Mallorie Sarre', 97.1, 38, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (16, N'Andalax', N'Unspecified fracture of left toe(s)', N'Fielding Skerrett', 71.9, 63, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (17, N'Stringtough', N'Hyperacusis, unspecified ear', N'Gerri Harris', 49.3, 79, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (18, N'Matsoft', N'Thyrotoxicosis from ectopic thyroid tissue with thyrotoxic crisis or storm', N'Cilka Wink', 20.8, 47, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (19, N'Opela', N'Exudative age-related macular degeneration, bilateral, stage unspecified', N'Lucien Threadkell', 21.6, 73, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (20, N'Daltfresh', N'External constriction of unspecified eyelid and periocular area, initial encounter', N'Mort Silcock', 71.3, 15, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (21, N'Wrapsafe', N'Toxic effect of chlorine gas, intentional self-harm, subsequent encounter', N'Percival Borres', 64.3, 7, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (22, N'Hatity', N'Other folate deficiency anemias', N'Josepha Holworth', 2, 69, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (23, N'Cookley', N'Corrosion of second degree of upper back, sequela', N'Nicki Bullick', 98.6, 90, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (24, N'Cardify', N'Chronic venous hypertension (idiopathic) with ulcer and inflammation of left lower extremity', N'Noelani Featherstone', 30.9, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (25, N'Temp', N'Fracture of one rib, left side', N'Kevina Rutherforth', 39.3, 95, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (26, N'Zamit', N'Unspecified injury of intrinsic muscle and tendon at ankle and foot level, unspecified foot, subsequent encounter', N'Amerigo Greer', 46.4, 96, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (27, N'Gembucket', N'Corrosion of unspecified degree of multiple sites of left lower limb, except ankle and foot, initial encounter', N'Nertie Scattergood', 36.2, 30, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (28, N'Andalax', N'Displaced fracture of distal phalanx of left great toe, initial encounter for open fracture', N'Buck Morstatt', 18.1, 30, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (29, N'Y-find', N'Displaced fracture of pisiform, left wrist, sequela', N'Nap Minall', 59.2, 61, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (30, N'Flexidy', N'Puncture wound without foreign body of left lesser toe(s) with damage to nail, subsequent encounter', N'Meir Rimell', 44.3, 91, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (31, N'Regrant', N'Sprain of tarsometatarsal ligament of right foot, subsequent encounter', N'Peder St Angel', 70.9, 86, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (32, N'Bitchip', N'Nondisplaced segmental fracture of shaft of ulna, right arm, subsequent encounter for open fracture type I or II with nonunion', N'Amanda Ogborne', 35.2, 100, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (33, N'Ventosanzap', N'Neuromuscular scoliosis, site unspecified', N'Em Fahrenbacher', 84.6, 54, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (34, N'Konklab', N'Narcolepsy with cataplexy', N'Beltran Wishart', 84.8, 7, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (35, N'Rank', N'Motorcycle driver injured in collision with unspecified motor vehicles in traffic accident', N'Geoffry Northey', 23.8, 52, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (36, N'Sonsing', N'Displaced comminuted fracture of shaft of right femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing', N'Sheridan Chapelle', 18, 19, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (37, N'Sonair', N'Other mast cell activation disorder', N'Maribelle Cowern', 56.8, 90, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (38, N'Zamit', N'Corrosion of unspecified degree of scalp [any part], initial encounter', N'Barbabra Ferentz', 38.4, 15, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (39, N'Zaam-Dox', N'Other fracture of upper end of left ulna, subsequent encounter for open fracture type I or II with delayed healing', N'Willdon Stockdale', 100, 27, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (40, N'Hatity', N'Respiratory conditions due to inhalation of chemicals, gases, fumes and vapors', N'Querida Ketts', 75.3, 34, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (41, N'Tres-Zap', N'Nondisplaced fracture of lateral condyle of left femur', N'Hubie Ropartz', 36.3, 60, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (42, N'Voltsillam', N'Abrasion of left middle finger, initial encounter', N'Shell Wiper', 15.3, 65, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (43, N'Temp', N'Wear of articular bearing surface of internal prosthetic right knee joint', N'Fanchon Leaming', 81, 54, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (44, N'Zoolab', N'Complete traumatic amputation at left hip joint, subsequent encounter', N'Berkley Waylen', 81.4, 54, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (45, N'Cardify', N'External constriction, right hip, subsequent encounter', N'Rudolfo Danne', 3, 5, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (46, N'Trippledex', N'Frostbite with tissue necrosis of left hip and thigh, sequela', N'Gwenette Shenfish', 61.2, 41, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (47, N'Mat Lam Tam', N'Superficial foreign body, right thigh, initial encounter', N'Rriocard McCafferty', 76.6, 43, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (48, N'Zaam-Dox', N'Memory deficit following other cerebrovascular disease', N'Laverne Delouch', 43.2, 20, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (49, N'Zaam-Dox', N'Contusion of unspecified hand, subsequent encounter', N'Karlan Marr', 16.3, 58, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (50, N'Fixflex', N'Unspecified injury of unspecified blood vessel at abdomen, lower back and pelvis level, sequela', N'Erwin Curnucke', 87.6, 41, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (51, N'Rank', N'Burn of other parts of respiratory tract', N'Artemis Crocetto', 24.9, 54, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (52, N'Duobam', N'Strain of intrinsic muscle and tendon at ankle and foot level, unspecified foot', N'Hiram Tingey', 92.7, 60, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (53, N'Bytecard', N'Other injury of other muscles, fascia and tendons at forearm level, unspecified arm, subsequent encounter', N'Lorenza Goggins', 73.3, 73, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (54, N'Alphazap', N'Other incomplete lesion at T2-T6 level of thoracic spinal cord', N'Laural Beldan', 72.2, 78, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (55, N'Otcom', N'Displaced fracture of base of second metacarpal bone. left hand, subsequent encounter for fracture with routine healing', N'Franny Spikeings', 74.9, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (56, N'Biodex', N'Atherosclerosis of nonbiological bypass graft(s) of other extremity with ulceration', N'Nadia Booij', 19.9, 44, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (57, N'Tampflex', N'Other fish poisoning, assault, sequela', N'Leeann Pretti', 26, 96, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (58, N'Tin', N'Toxic effect of other specified inorganic substances, assault, initial encounter', N'Tonya Piscopiello', 3.7, 1, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (59, N'Sonair', N'Other fracture of upper end of unspecified radius, sequela', N'Minne Cicchitello', 89.4, 28, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (60, N'Subin', N'Hair causing external constriction, sequela', N'Emmi Wiggam', 95.1, 43, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (61, N'Hatity', N'Physical abuse complicating pregnancy, third trimester', N'Milzie Marunchak', 94.8, 65, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (62, N'Fintone', N'Arthritis due to other bacteria, left knee', N'Filippo Harker', 62.6, 58, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (63, N'Home Ing', N'Nondisplaced oblique fracture of shaft of left radius, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion', N'Lind Trethowan', 30.1, 37, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (64, N'Domainer', N'Adverse effect of androgens and anabolic congeners, initial encounter', N'Royall O''Corren', 24.8, 19, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (65, N'Greenlam', N'Other injury of intrinsic muscle, fascia and tendon of left ring finger at wrist and hand level, initial encounter', N'Millicent Delamere', 61, 78, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (66, N'Zamit', N'Unspecified appendicitis', N'Shem Roomes', 65.1, 22, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (67, N'Flowdesk', N'Cerebral infarction due to unspecified occlusion or stenosis of unspecified carotid arteries', N'Konstance Joannet', 73.4, 19, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (68, N'Konklab', N'Blister (nonthermal) of left thumb, initial encounter', N'Chick Mandeville', 4.9, 2, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (69, N'Zaam-Dox', N'Displaced fracture of coracoid process, left shoulder, initial encounter for open fracture', N'Karon Claussen', 29.5, 55, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (70, N'Overhold', N'Anaplastic large cell lymphoma, ALK-positive, intrapelvic lymph nodes', N'Clem Brito', 66.3, 29, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (71, N'Fix San', N'Wedge compression fracture of fourth thoracic vertebra, initial encounter for closed fracture', N'Bryna Meryett', 12.7, 50, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (72, N'Asoka', N'Encounter for adjustment and management of infusion pump', N'Grantham Klawi', 45.3, 3, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (73, N'Duobam', N'Nondisplaced subtrochanteric fracture of left femur, subsequent encounter for closed fracture with malunion', N'Peg Gercke', 27.2, 49, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (74, N'Quo Lux', N'Pedal cycle passenger injured in collision with car, pick-up truck or van in nontraffic accident', N'Carroll Lathee', 60.1, 83, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (75, N'Rank', N'Unspecified open wound of unspecified part of head, subsequent encounter', N'Kiley Parnby', 21.5, 96, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (76, N'Bitchip', N'Open wound of ankle, foot and toes', N'Tommie Cottom', 74.4, 6, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (77, N'Treeflex', N'Nondisplaced midcervical fracture of left femur, initial encounter for open fracture type I or II', N'Ardys Parker', 82.3, 10, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (78, N'Voltsillam', N'Nondisplaced fracture of right tibial tuberosity, subsequent encounter for open fracture type I or II with malunion', N'Shanta Heighton', 67.4, 63, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (79, N'Bitchip', N'Displaced fracture of distal phalanx of unspecified great toe, initial encounter for open fracture', N'Mela Esilmon', 42.9, 40, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (80, N'Keylex', N'Chronic atticoantral suppurative otitis media, unspecified ear', N'Allyce Headey', 9.1, 82, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (81, N'Y-Solowarm', N'Torus fracture of lower end of right fibula', N'Nadine Blachford', 40.7, 9, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (82, N'Bamity', N'Other specified nutritional deficiencies', N'Lanette Brikner', 14.6, 67, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (83, N'Redhold', N'Unspecified open wound of abdominal wall, left lower quadrant without penetration into peritoneal cavity, sequela', N'Carita Simla', 90.2, 19, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (84, N'Sonsing', N'Effusion, right hip', N'Guss Hebburn', 16, 43, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (85, N'Bamity', N'Unspecified injury at unspecified level of thoracic spinal cord, initial encounter', N'Juliane Chalker', 35.8, 36, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (86, N'Domainer', N'Unspecified corneal neovascularization, right eye', N'Ashien Corbould', 53.5, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (87, N'Greenlam', N'Other disorders of pancreatic internal secretion', N'Mildrid Doag', 78, 49, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (88, N'Subin', N'Other nondisplaced fracture of seventh cervical vertebra, subsequent encounter for fracture with routine healing', N'Hinda Juliano', 84.6, 92, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (89, N'Latlux', N'Unspecified focal traumatic brain injury with loss of consciousness of 31 minutes to 59 minutes', N'Aluin Lowdes', 77.8, 61, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (90, N'Viva', N'Disorders of purine and pyrimidine metabolism', N'Aime Stovold', 35.2, 92, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (91, N'It', N'NIHSS score 35', N'Kacy Villa', 52.9, 71, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (92, N'Stringtough', N'Mycosis fungoides, lymph nodes of multiple sites', N'Rodi Sabathe', 64.8, 8, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (93, N'Keylex', N'Other subluxation of right knee, initial encounter', N'Ethelbert Fronsek', 55.1, 70, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (94, N'Asoka', N'Fall into unspecified water causing other injury, subsequent encounter', N'Dulcy MacSherry', 24.7, 86, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (95, N'Fintone', N'Other proteinuria', N'Constance Antognozzii', 1.5, 90, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (96, N'Tres-Zap', N'Poisoning by calcium-channel blockers, intentional self-harm', N'Kizzee Bridal', 73.2, 55, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (97, N'Ronstring', N'Osteonecrosis due to drugs of right ulna', N'Karena Castello', 22.8, 90, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (98, N'Sub-Ex', N'Unspecified fracture of lower end of right ulna, subsequent encounter for closed fracture with delayed healing', N'Camila Heaford', 86.6, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (99, N'Flowdesk', N'Displaced fracture of shaft of right clavicle, subsequent encounter for fracture with nonunion', N'Nicole Linguard', 87.9, 53, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
GO
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (100, N'Ronstring', N'Nondisplaced fracture of lateral condyle of unspecified femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with delayed healing', N'Hubert D''Hooghe', 61.6, 20, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Văn học')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Manga')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Kinh tế')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Địa lý')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SU23] SET  READ_WRITE 
GO
