USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[CD_Register]    Script Date: 11/08/2012 14:27:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CD_Register](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[YearDate] [date] NULL,
	[CD_No] [int] NULL,
	[DetailsOfDocument] [nvarchar](100) NULL,
	[StartingNo] [int] NULL,
	[EndingNo] [int] NULL,
	[SecondCopyDate] [date] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_CD_Register] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


