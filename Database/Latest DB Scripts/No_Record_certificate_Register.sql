USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[NoRecordCertificateregister]    Script Date: 11/08/2012 14:32:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NoRecordCertificateregister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[ApplicantName] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[ApplicationDate] [date] NULL,
	[Purpose] [nvarchar](200) NULL,
	[SignOfMarriageSubRegistrar] [nchar](200) NULL,
	[ApplicationDisposalDate] [date] NULL,
	[SignOfOfficer] [nvarchar](200) NULL,
 CONSTRAINT [PK_NoRecordCertificateregister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


