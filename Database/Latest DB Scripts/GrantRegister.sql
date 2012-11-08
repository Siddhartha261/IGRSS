USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[GrantRegister]    Script Date: 11/08/2012 14:29:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GrantRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [int] NULL,
	[Date] [date] NULL,
	[DetailOfBill] [nvarchar](max) NULL,
	[AmountOfBill] [money] NULL,
	[TotalExpense] [money] NULL,
	[Balance] [money] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GrantRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


