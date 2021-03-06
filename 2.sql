USE [18ip12]
GO
/****** Object:  Table [dbo].[Cleent]    Script Date: 01.10.2021 12:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cleent](
	[ID_cle] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronumic] [nvarchar](50) NULL,
	[Call] [varchar](50) NULL,
 CONSTRAINT [PK_Cleent] PRIMARY KEY CLUSTERED 
(
	[ID_cle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 01.10.2021 12:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID_man] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronumic] [nvarchar](50) NULL,
	[Call] [varchar](50) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID_man] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfume]    Script Date: 01.10.2021 12:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfume](
	[ID_per] [int] NOT NULL,
	[ID_typ] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Brend] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[ID_zak] [int] NULL,
	[Valume] [bigint] NULL,
 CONSTRAINT [PK_Perfume] PRIMARY KEY CLUSTERED 
(
	[ID_per] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postawka]    Script Date: 01.10.2021 12:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postawka](
	[ID_posta] [int] NOT NULL,
	[Nomber_postawki] [int] NULL,
	[Date_postawki] [date] NULL,
	[IP_poss] [int] NULL,
	[Kol_postawki] [int] NULL,
	[ID_per] [int] NULL,
 CONSTRAINT [PK_Postawka] PRIMARY KEY CLUSTERED 
(
	[ID_posta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 01.10.2021 12:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ID_poss] [int] NOT NULL,
	[Name_company] [nvarchar](50) NULL,
	[Call] [varchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ID_poss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type of perfume]    Script Date: 01.10.2021 12:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type of perfume](
	[ID_typ] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Type of perfume] PRIMARY KEY CLUSTERED 
(
	[ID_typ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakaz]    Script Date: 01.10.2021 12:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz](
	[ID_zak] [int] NOT NULL,
	[ID_cle] [int] NULL,
	[Date_oformlenie] [date] NULL,
	[Valume] [bigint] NULL,
	[ID_man] [int] NULL,
 CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED 
(
	[ID_zak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Perfume]  WITH CHECK ADD  CONSTRAINT [FK_Perfume_Type of perfume] FOREIGN KEY([ID_typ])
REFERENCES [dbo].[Type of perfume] ([ID_typ])
GO
ALTER TABLE [dbo].[Perfume] CHECK CONSTRAINT [FK_Perfume_Type of perfume]
GO
ALTER TABLE [dbo].[Perfume]  WITH CHECK ADD  CONSTRAINT [FK_Perfume_Zakaz] FOREIGN KEY([ID_zak])
REFERENCES [dbo].[Zakaz] ([ID_zak])
GO
ALTER TABLE [dbo].[Perfume] CHECK CONSTRAINT [FK_Perfume_Zakaz]
GO
ALTER TABLE [dbo].[Postawka]  WITH CHECK ADD  CONSTRAINT [FK_Postawka_Perfume] FOREIGN KEY([ID_per])
REFERENCES [dbo].[Perfume] ([ID_per])
GO
ALTER TABLE [dbo].[Postawka] CHECK CONSTRAINT [FK_Postawka_Perfume]
GO
ALTER TABLE [dbo].[Postawka]  WITH CHECK ADD  CONSTRAINT [FK_Postawka_Provider] FOREIGN KEY([IP_poss])
REFERENCES [dbo].[Provider] ([ID_poss])
GO
ALTER TABLE [dbo].[Postawka] CHECK CONSTRAINT [FK_Postawka_Provider]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Cleent] FOREIGN KEY([ID_cle])
REFERENCES [dbo].[Cleent] ([ID_cle])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Cleent]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Manager] FOREIGN KEY([ID_man])
REFERENCES [dbo].[Manager] ([ID_man])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Manager]
GO
