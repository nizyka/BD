USE [18ip12]
GO
/****** Object:  Table [dbo].[issing_books]    Script Date: 15.01.2022 10:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issing_books](
	[id_b] [int] NOT NULL,
	[i_num] [int] NULL,
	[id_reader] [int] NULL,
	[date_issing] [date] NULL,
	[date_return] [date] NULL,
	[num] [int] NULL,
 CONSTRAINT [PK_issing_books] PRIMARY KEY CLUSTERED 
(
	[id_b] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[izdanie]    Script Date: 15.01.2022 10:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[izdanie](
	[i_num] [int] NOT NULL,
	[author] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[tipe] [nvarchar](50) NULL,
	[year_i] [date] NULL,
	[vol_s] [int] NULL,
	[num_cop] [int] NULL,
 CONSTRAINT [PK_izdanie] PRIMARY KEY CLUSTERED 
(
	[i_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[readers]    Script Date: 15.01.2022 10:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[readers](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
	[patronymic] [nvarchar](50) NULL,
 CONSTRAINT [PK_readers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[issing_books]  WITH CHECK ADD  CONSTRAINT [FK_issing_books_izdanie] FOREIGN KEY([i_num])
REFERENCES [dbo].[izdanie] ([i_num])
GO
ALTER TABLE [dbo].[issing_books] CHECK CONSTRAINT [FK_issing_books_izdanie]
GO
ALTER TABLE [dbo].[issing_books]  WITH CHECK ADD  CONSTRAINT [FK_issing_books_readers] FOREIGN KEY([id_reader])
REFERENCES [dbo].[readers] ([id])
GO
ALTER TABLE [dbo].[issing_books] CHECK CONSTRAINT [FK_issing_books_readers]
GO
