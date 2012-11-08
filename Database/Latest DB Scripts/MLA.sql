USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[MLA]    Script Date: 11/08/2012 14:43:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[MLA](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[InwardNo] [varchar](50) NULL,
	[FileNo] [int] NULL,
	[MLAname] [nvarchar](200) NULL,
	[Subject] [nchar](10) NULL,
	[LetterNo] [int] NULL,
	[LetterDate] [datetime] NULL,
	[DepartmentName] [nvarchar](200) NULL,
	[FileNumber] [int] NULL,
	[DetailsofOutput] [nvarchar](max) NULL,
	[DetailsofFilePreservation] [nvarchar](max) NULL,
	[DetailsOfRecord] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_MLA] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


