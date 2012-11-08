USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[ChequeRegister]    Script Date: 11/08/2012 14:28:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChequeRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[ChequeReceivedDate] [date] NULL,
	[PersonNamegivingcheque] [nvarchar](200) NULL,
	[BankName] [nvarchar](200) NULL,
	[ChequeNo] [int] NULL,
	[ChequeDate] [date] NULL,
	[Amount] [money] NULL,
	[AccountName] [nvarchar](200) NULL,
	[DateChequeSent] [date] NULL,
	[DateOfHisab] [datetime] NULL,
	[InitialsOfOfficer] [nvarchar](100) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChequeRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


