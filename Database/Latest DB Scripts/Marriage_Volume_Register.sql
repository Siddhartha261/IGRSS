USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[MarriageVolumeListRegister]    Script Date: 11/08/2012 14:32:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MarriageVolumeListRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[VolumeNo] [int] NULL,
	[DateToDate] [datetime] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_MarriageVolumeListRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


