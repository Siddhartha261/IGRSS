USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[MarriageCertificate]    Script Date: 11/08/2012 14:31:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MarriageCertificate](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Bridegroom_name] [nvarchar](500) NULL,
	[Bridegroom_father_name] [nvarchar](500) NULL,
	[Bride_name] [nvarchar](500) NULL,
	[Bride_father_name] [nvarchar](500) NULL,
	[MarriageDate] [date] NULL,
	[MarriagePlace] [nvarchar](10) NULL,
	[Village_church_name] [nvarchar](50) NULL,
	[Talk] [nvarchar](10) NULL,
	[District] [nvarchar](10) NULL,
	[ApplicationNo] [int] NULL,
	[ApplicationDate] [date] NULL,
	[NoOfCopies] [int] NULL,
	[ReceiptNo] [int] NULL,
	[Fees] [int] NULL,
	[CopiesFurnished] [int] NULL,
 CONSTRAINT [PK_MarriageCertificate] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


