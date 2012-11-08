USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[tarankit]    Script Date: 11/08/2012 15:21:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tarankit](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Tarankit_Atarnkit] [nvarchar](100) NULL,
	[quesno] [int] NULL,
	[mlaName] [nvarchar](200) NULL,
	[mlaPlace] [nvarchar](50) NULL,
	[Subject] [nvarchar](100) NULL,
	[Number] [int] NULL,
	[Reply_Sent] [nvarchar](200) NULL,
	[Date] [date] NULL,
	[Fileno] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_tarankit] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


