USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[Sealing]    Script Date: 11/08/2012 15:26:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sealing](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Kacheri_Office] [nvarchar](256) NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[PhotoVolumeNo] [int] NULL,
	[BookNo] [int] NULL,
	[SealedVolumes] [int] NULL,
	[RemainingVolumes] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sealing] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


