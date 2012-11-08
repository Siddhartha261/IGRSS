USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[DeadStockRegister]    Script Date: 11/08/2012 14:28:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DeadStockRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[DescOfArticle] [nvarchar](500) NULL,
	[Authority_For_purchase] [nvarchar](200) NULL,
	[Purchase_date] [date] NULL,
	[Noofqty] [int] NULL,
	[Value] [int] NULL,
	[InitialsOfHO] [nvarchar](200) NULL,
	[NoQty] [int] NULL,
	[NatureDisposal] [nvarchar](200) NULL,
	[Authorityvoucher] [nvarchar](200) NULL,
	[AmtRealize] [money] NULL,
	[DateCredit] [date] NULL,
	[AmtWritten_off] [money] NULL,
	[BalanceStock] [money] NULL,
	[Remarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_DeadStockRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


