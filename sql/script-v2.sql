USE [master]
GO
/****** Object:  Database [PRJ301_SU23]    Script Date: 7/3/2023 11:26:47 PM ******/
CREATE DATABASE [PRJ301_SU23]
GO
USE [PRJ301_SU23]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/3/2023 11:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[address] [nvarchar](150) NULL,
	[isVerify] [bit] NOT NULL,
	[roleId] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/3/2023 11:26:47 PM ******/
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
	[image] [nvarchar](max) NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/3/2023 11:26:47 PM ******/
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
/****** Object:  Table [dbo].[EmailLog]    Script Date: 7/3/2023 11:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[to] [nvarchar](50) NOT NULL,
	[subject] [nvarchar](50) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/3/2023 11:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerifyRequest]    Script Date: 7/3/2023 11:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerifyRequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestContent] [nvarchar](max) NOT NULL,
	[isVerify] [bit] NOT NULL,
	[expired] [datetime] NOT NULL,
	[createAt] [datetime] NOT NULL,
	[accountId] [int] NOT NULL,
	[emailLogId] [int] NOT NULL,
 CONSTRAINT [PK_VerifyRequest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (1, N'admin', N'123', N'abc', NULL, 1, 0)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (2, N'user', N'123', N'abc', NULL, 1, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (3, N'user1', N'sedA/Fnp+BFiRmA+GWiYMw==', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (4, N'user1234', N'd13GYtj0nEA=', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (5, N'user1234', N'd13GYtj0nEA=', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (6, N'123', N'Xuq6t7Fr/Dg=', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (7, N'123', N'3r7H2Jbj7WsOmBFNxz03jA==', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (8, N'123', N'3r7H2Jbj7WsOmBFNxz03jA==', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (9, N'123', N'3r7H2Jbj7WsOmBFNxz03jA==', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (10, N'1234', N'zqWsY7yYGyR51z4VGx5orA==', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (11, N'123', N'3r7H2Jbj7WsOmBFNxz03jA==', N'vinhpham2761@gmail.com', NULL, 0, 1)
INSERT [dbo].[Account] ([id], [username], [password], [email], [address], [isVerify], [roleId]) VALUES (12, N'123', N'3r7H2Jbj7WsOmBFNxz03jA==', N'vinhpham2761@gmail.com', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (1, N'Asoka', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Kalindi Haworth', 71.6, 42, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (2, N'Veribet', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Sayre Yewdall', 93.1, 47, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (3, N'Keylex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Sarajane Morsom', 5.1, 52, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (4, N'Tres-Zap', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Alistair Zielinski', 43.6, 74, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (5, N'Veribet', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Henryetta Whitrod', 97.5, 67, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (6, N'Cardify', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Constantine Collin', 95.9, 19, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (7, N'Zathin', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Ev Eacott', 35, 45, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (8, N'Sub-Ex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Hewie Crispin', 99.5, 7, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (9, N'Job', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Joachim Santarelli', 4, 7, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (10, N'Fintone', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Augusto Gartside', 96.6, 44, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (11, N'Redhold', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Noam Watkiss', 8.4, 5, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (12, N'Sonair', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Julio Dulake', 91.2, 39, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (13, N'Redhold', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Giavani D''Abbot-Doyle', 99.8, 56, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (14, N'Bigtax', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Sky Kubu', 60.1, 18, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (15, N'Temp', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Mallorie Sarre', 97.1, 38, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (16, N'Andalax', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Fielding Skerrett', 71.9, 63, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (17, N'Stringtough', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Gerri Harris', 49.3, 79, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (18, N'Matsoft', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Cilka Wink', 20.8, 47, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (19, N'Opela', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Lucien Threadkell', 21.6, 73, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (20, N'Daltfresh', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Mort Silcock', 71.3, 15, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (21, N'Wrapsafe', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Percival Borres', 64.3, 7, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (22, N'Hatity', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Josepha Holworth', 2, 69, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (23, N'Cookley', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Nicki Bullick', 98.6, 90, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (24, N'Cardify', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Noelani Featherstone', 30.9, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (25, N'Temp', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Kevina Rutherforth', 39.3, 95, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (26, N'Zamit', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Amerigo Greer', 46.4, 96, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (27, N'Gembucket', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Nertie Scattergood', 36.2, 30, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (28, N'Andalax', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Buck Morstatt', 18.1, 30, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (29, N'Y-find', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Nap Minall', 59.2, 61, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (30, N'Flexidy', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Meir Rimell', 44.3, 91, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (31, N'Regrant', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Peder St Angel', 70.9, 86, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (32, N'Bitchip', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Amanda Ogborne', 35.2, 100, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (33, N'Ventosanzap', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Em Fahrenbacher', 84.6, 54, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (34, N'Konklab', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Beltran Wishart', 84.8, 7, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (35, N'Rank', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Geoffry Northey', 23.8, 52, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (36, N'Sonsing', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Sheridan Chapelle', 18, 19, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (37, N'Sonair', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Maribelle Cowern', 56.8, 90, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (38, N'Zamit', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Barbabra Ferentz', 38.4, 15, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (39, N'Zaam-Dox', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Willdon Stockdale', 100, 27, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (40, N'Hatity', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Querida Ketts', 75.3, 34, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (41, N'Tres-Zap', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Hubie Ropartz', 36.3, 60, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (42, N'Voltsillam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Shell Wiper', 15.3, 65, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (43, N'Temp', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Fanchon Leaming', 81, 54, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (44, N'Zoolab', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Berkley Waylen', 81.4, 54, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (45, N'Cardify', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Rudolfo Danne', 3, 5, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (46, N'Trippledex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Gwenette Shenfish', 61.2, 41, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (47, N'Mat Lam Tam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Rriocard McCafferty', 76.6, 43, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (48, N'Zaam-Dox', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Laverne Delouch', 43.2, 20, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (49, N'Zaam-Dox', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Karlan Marr', 16.3, 58, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (50, N'Fixflex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Erwin Curnucke', 87.6, 41, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (51, N'Rank', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Artemis Crocetto', 24.9, 54, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (52, N'Duobam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Hiram Tingey', 92.7, 60, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (53, N'Bytecard', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Lorenza Goggins', 73.3, 73, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (54, N'Alphazap', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Laural Beldan', 72.2, 78, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (55, N'Otcom', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Franny Spikeings', 74.9, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (56, N'Biodex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Nadia Booij', 19.9, 44, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (57, N'Tampflex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Leeann Pretti', 26, 96, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (58, N'Tin', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Tonya Piscopiello', 3.7, 1, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (59, N'Sonair', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Minne Cicchitello', 89.4, 28, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (60, N'Subin', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Emmi Wiggam', 95.1, 43, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (61, N'Hatity', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Milzie Marunchak', 94.8, 65, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (62, N'Fintone', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Filippo Harker', 62.6, 58, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (63, N'Home Ing', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Lind Trethowan', 30.1, 37, N'http://dummyimage.com/400x400.png/dddddd/000000', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (64, N'Domainer', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Royall O''Corren', 24.8, 19, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (65, N'Greenlam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Millicent Delamere', 61, 78, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (66, N'Zamit', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Shem Roomes', 65.1, 22, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (67, N'Flowdesk', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Konstance Joannet', 73.4, 19, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (68, N'Konklab', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Chick Mandeville', 4.9, 2, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (69, N'Zaam-Dox', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Karon Claussen', 29.5, 55, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (70, N'Overhold', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Clem Brito', 66.3, 29, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (71, N'Fix San', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Bryna Meryett', 12.7, 50, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (72, N'Asoka', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Grantham Klawi', 45.3, 3, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (73, N'Duobam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Peg Gercke', 27.2, 49, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (74, N'Quo Lux', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Carroll Lathee', 60.1, 83, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (75, N'Rank', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Kiley Parnby', 21.5, 96, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (76, N'Bitchip', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Tommie Cottom', 74.4, 6, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (77, N'Treeflex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Ardys Parker', 82.3, 10, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 4)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (78, N'Voltsillam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Shanta Heighton', 67.4, 63, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (79, N'Bitchip', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Mela Esilmon', 42.9, 40, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (80, N'Keylex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Allyce Headey', 9.1, 82, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (81, N'Y-Solowarm', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Nadine Blachford', 40.7, 9, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (82, N'Bamity', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Lanette Brikner', 14.6, 67, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (83, N'Redhold', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Carita Simla', 90.2, 19, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (84, N'Sonsing', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Guss Hebburn', 16, 43, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (85, N'Bamity', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Juliane Chalker', 35.8, 36, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (86, N'Domainer', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Ashien Corbould', 53.5, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (87, N'Greenlam', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Mildrid Doag', 78, 49, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (88, N'Subin', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Hinda Juliano', 84.6, 92, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (89, N'Latlux', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Aluin Lowdes', 77.8, 61, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (90, N'Viva', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Aime Stovold', 35.2, 92, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (91, N'It', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Kacy Villa', 52.9, 71, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (92, N'Stringtough', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Rodi Sabathe', 64.8, 8, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (93, N'Keylex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Ethelbert Fronsek', 55.1, 70, N'http://dummyimage.com/400x400.png/5fa2dd/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (94, N'Asoka', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Dulcy MacSherry', 24.7, 86, N'http://dummyimage.com/400x400.png/dddddd/000000', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (95, N'Fintone', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Constance Antognozzii', 1.5, 90, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (96, N'Tres-Zap', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Kizzee Bridal', 73.2, 55, N'http://dummyimage.com/400x400.png/dddddd/000000', 3)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (97, N'Ronstring', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Karena Castello', 22.8, 90, N'http://dummyimage.com/400x400.png/dddddd/000000', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (98, N'Sub-Ex', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Camila Heaford', 86.6, 16, N'http://dummyimage.com/400x400.png/cc0000/ffffff', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (99, N'Flowdesk', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Nicole Linguard', 87.9, 53, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
GO
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (100, N'Ronstring', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'Hubert D''Hooghe', 61.6, 20, N'http://dummyimage.com/400x400.png/ff4444/ffffff', 2)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (101, N'1234', N'Bao Gồm:

- Sách Giáo Khoa Bộ Lớp 1 - Chân Trời Sáng Tạo - Sách Bài Học (Bộ 9 Cuốn) (2023)

- Bao Sách TP - Khổ Lớn (10 Tờ/Cuộn)', N'123', 123, 123, N'/BookStore/images/photo_2023-04-24_06-20-31.jpg', 1)
INSERT [dbo].[Book] ([id], [name], [description], [author], [price], [quantity], [image], [categoryId]) VALUES (116, N'1234', N'', N'123', 123, 123, N'/BookStore/images/Screenshot_3.png', 1)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Văn học')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Manga')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Kinh tế')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Địa lý')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailLog] ON 

INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (1, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/8JuWX+ewJDp+CH6kXcC/5GuSumyn7pFZaD2HurU20Djq7tJH1g84hQnVyLQvk0L4xpFtpcBbQE3L/SyhVeSDdw==')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (2, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?token=/z2AZ47GzEaBZGeArLBx+ZMS/ouQxgfCAqj5KoNFoWxlqDxLvWfnJ0IhhJ9PBw1+Ed13GYtj0nEA=')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (3, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?tokenYpAUFeHf6SmwnXFTPtLdbPsvQxGopUONLVWe/+UUeVra1CK4De/KnA==&account=4Ph59BiWkKQ=')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (4, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?token/z+kEG7comI6VIo55gCgLRINQ3pRMPcSIJtW1cgKcRIOpqDuBCO1TtU6tge78jOI&account=p5V+TlrWr3dQBcWgnDZwow==')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (5, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?token=Hq7EyDYjA7ats9uffR61MyvjAeg4LTNz1W2CX68Tbn8BO9rFbAusEBX2xdTMhl33&account=l0anqwUdE8kLi0JcsuJhlg==')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (6, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?token=0+zMPw71ZgGcFhTbn7+AKBa42ns6NJNHmC0Njr0KOI41MdylerVZLoQCr5pgSmgb&account=LnrlHKsRVH1xkuwc18ko1w==')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (7, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?token=1B2GeiJ52UqDTc/T2gArealG708XmrqogJWfpqIStY2EVyEkesjj9F7f01SBCYwh&account=3AYFN4XQ+23Uagp7Dh1G0Q==')
INSERT [dbo].[EmailLog] ([id], [to], [subject], [content]) VALUES (8, N'vinhpham2761@gmail.com', N'Register', N'http://localhost:8080/BookStore/verify?token=dWJUOpXxFK36bjTH9oF9qR7IUYsKeaWYw/MFDBTmMhUkAP/SL2R70PNFbihMYbbI&account=anaMp3GtgfzuqEm1byCLeQ==')
SET IDENTITY_INSERT [dbo].[EmailLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (0, N'admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[VerifyRequest] ON 

INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (1, N'8JuWX+ewJDp+CH6kXcC/5GuSumyn7pFZaD2HurU20Djq7tJH1g84hQnVyLQvk0L4xpFtpcBbQE3L/SyhVeSDdw==', 0, CAST(N'2023-07-03T05:04:27.600' AS DateTime), CAST(N'2023-07-02T05:04:27.123' AS DateTime), 3, 1)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (2, N'z2AZ47GzEaBZGeArLBx+ZMS/ouQxgfCAqj5KoNFoWxlqDxLvWfnJ0IhhJ9PBw1+Ed13GYtj0nEA=', 0, CAST(N'2023-07-03T21:02:48.217' AS DateTime), CAST(N'2023-07-02T21:02:48.217' AS DateTime), 4, 2)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (3, N'YpAUFeHf6SmwnXFTPtLdbPsvQxGopUONLVWe/+UUeVra1CK4De/KnA==', 0, CAST(N'2023-07-04T05:26:08.023' AS DateTime), CAST(N'2023-07-03T05:26:08.023' AS DateTime), 6, 3)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (4, N'/z+kEG7comI6VIo55gCgLRINQ3pRMPcSIJtW1cgKcRIOpqDuBCO1TtU6tge78jOI', 0, CAST(N'2023-07-04T06:59:57.257' AS DateTime), CAST(N'2023-07-03T06:59:57.257' AS DateTime), 8, 4)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (5, N'Hq7EyDYjA7ats9uffR61MyvjAeg4LTNz1W2CX68Tbn8BO9rFbAusEBX2xdTMhl33', 0, CAST(N'2023-07-04T07:01:20.213' AS DateTime), CAST(N'2023-07-03T07:01:20.213' AS DateTime), 9, 5)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (6, N'0+zMPw71ZgGcFhTbn7+AKBa42ns6NJNHmC0Njr0KOI41MdylerVZLoQCr5pgSmgb', 0, CAST(N'2023-07-04T20:30:26.780' AS DateTime), CAST(N'2023-07-03T20:30:26.780' AS DateTime), 10, 6)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (7, N'1B2GeiJ52UqDTc/T2gArealG708XmrqogJWfpqIStY2EVyEkesjj9F7f01SBCYwh', 0, CAST(N'2023-07-04T20:44:05.107' AS DateTime), CAST(N'2023-07-03T20:44:05.107' AS DateTime), 11, 7)
INSERT [dbo].[VerifyRequest] ([id], [requestContent], [isVerify], [expired], [createAt], [accountId], [emailLogId]) VALUES (8, N'dWJUOpXxFK36bjTH9oF9qR7IUYsKeaWYw/MFDBTmMhUkAP/SL2R70PNFbihMYbbI', 0, CAST(N'2023-07-04T20:59:59.367' AS DateTime), CAST(N'2023-07-03T20:59:59.367' AS DateTime), 12, 8)
SET IDENTITY_INSERT [dbo].[VerifyRequest] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[VerifyRequest]  WITH CHECK ADD  CONSTRAINT [FK_VerifyRequest_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[VerifyRequest] CHECK CONSTRAINT [FK_VerifyRequest_Account]
GO
ALTER TABLE [dbo].[VerifyRequest]  WITH CHECK ADD  CONSTRAINT [FK_VerifyRequest_EmailLog] FOREIGN KEY([emailLogId])
REFERENCES [dbo].[EmailLog] ([id])
GO
ALTER TABLE [dbo].[VerifyRequest] CHECK CONSTRAINT [FK_VerifyRequest_EmailLog]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SU23] SET  READ_WRITE 
GO
