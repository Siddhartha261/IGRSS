USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[GovtDocs]    Script Date: 11/08/2012 14:29:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GovtDocs](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[InwardNo] [varchar](50) NOT NULL,
	[Details] [nvarchar](max) NULL,
	[LetterNo] [int] NULL,
	[LetterDate] [datetime] NULL,
	[NameOfDepartment] [nvarchar](50) NULL,
	[FileNo] [int] NULL,
	[DetailsOfOutput] [nvarchar](max) NULL,
	[DetailsOfPreservingFiles] [nvarchar](max) NULL,
	[TypesOfRecord] [nvarchar](50) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GovtDocs] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


