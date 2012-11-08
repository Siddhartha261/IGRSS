USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[FileRegister]    Script Date: 11/08/2012 11:53:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FileRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Worksheet_ID] [int] NOT NULL,
	[FileName] [nvarchar](200) NULL,
	[FileNo] [int] NULL,
	[StartingDate] [datetime] NULL,
	[EndingDate] [datetime] NULL,
	[ClassOfFile] [nvarchar](200) NULL,
	[DisposalDateOfFile] [datetime] NULL,
	[DisposalDateOn] [datetime] NULL,
 CONSTRAINT [PK_FileRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


