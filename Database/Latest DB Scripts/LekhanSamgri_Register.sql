USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[LekhanSamagriRegister]    Script Date: 11/08/2012 14:30:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LekhanSamagriRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Article_desc] [nvarchar](max) NULL,
	[Purchaseauthorityname] [nvarchar](200) NULL,
	[PurchaseDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[ArticlePrice] [money] NULL,
	[EmployeeReceivingDate] [datetime] NULL,
	[ArticleCompletiobDate] [datetime] NULL,
	[EmployeeSign] [nvarchar](10) NULL,
	[Officersign] [nvarchar](10) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_LekhanSamagriRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


