USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[SOFILE]    Script Date: 11/08/2012 14:33:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SOFILE](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Circulars] [int] NULL,
	[DateOfCirculars] [datetime] NULL,
	[Department] [nvarchar](25) NULL,
	[Subject] [nvarchar](50) NULL,
	[PageNo] [int] NULL,
 CONSTRAINT [PK_SOFILE] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


