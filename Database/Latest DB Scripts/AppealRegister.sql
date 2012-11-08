USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[AppealRegister]    Script Date: 11/08/2012 15:24:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AppealRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NULL,
	[KacheriOffice] [nvarchar](256) NOT NULL,
	[DocumentNo] [int] NULL,
	[Year] [int] NULL,
	[NameOfApplicant] [nvarchar](200) NULL,
	[Versus] [nvarchar](256) NOT NULL,
	[DeficitStampDuty] [money] NULL,
	[TotalStampDuty] [money] NULL,
	[Continue_remand] [bit] NULL,
	[Result] [nvarchar](50) NULL,
	[OutwardNo] [varchar](50) NOT NULL,
	[Date] [datetime] NULL,
	[AGYear] [int] NULL,
 CONSTRAINT [PK_AppealRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


