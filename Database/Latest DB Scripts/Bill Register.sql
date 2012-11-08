USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[BillRegister]    Script Date: 11/08/2012 14:26:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [int] NULL,
	[BillDate] [datetime] NULL,
	[DetailsOfBill] [nvarchar](max) NULL,
	[Name_subamount] [nvarchar](200) NULL,
	[Amount_subamount] [money] NULL,
	[Total_subamount] [money] NULL,
	[Name_deductions] [nvarchar](200) NULL,
	[Amount_deductions] [money] NULL,
	[Total_deductions] [money] NULL,
	[NetAmount] [money] NULL,
	[SignOnBill] [nvarchar](200) NULL,
	[SignDate] [datetime] NULL,
	[DatePresentedTreasure] [datetime] NULL,
	[DateApprovalTreasure] [datetime] NULL,
 CONSTRAINT [PK_BillRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


