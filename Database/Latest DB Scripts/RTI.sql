USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[RTI]    Script Date: 11/08/2012 15:20:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RTI](
	[Sr_No] [int] IDENTITY(1,1) NOT NULL,
	[Appl_name] [nvarchar](200) NULL,
	[Appl_surname] [nvarchar](200) NULL,
	[Appl_Date] [datetime] NULL,
	[PIO_desig] [nvarchar](50) NULL,
	[PIO_date] [datetime] NULL,
	[Last_Date] [datetime] NULL,
	[Decision_Taken] [varchar](100) NULL,
 CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED 
(
	[Sr_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


