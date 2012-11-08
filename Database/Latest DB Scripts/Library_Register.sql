USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[LibraryRegister]    Script Date: 11/08/2012 14:31:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LibraryRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Author] [nvarchar](200) NULL,
	[Price] [money] NULL,
	[No_Of_Communication] [int] NULL,
	[Date_Of_Communication] [date] NULL,
	[Date_Of_Receipt] [date] NULL,
	[No_Of_Copies_Receivecd] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
 CONSTRAINT [PK_LibraryRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


