USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[InquiryRegister]    Script Date: 11/08/2012 14:44:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InquiryRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[Name_Of_Employee] [nvarchar](300) NULL,
	[Designation_Of_Employee] [nvarchar](50) NOT NULL,
	[Date_Of_Complaint] [date] NULL,
	[Details_To_Vigilance_Commissioner] [nvarchar](max) NULL,
 CONSTRAINT [PK_InquiryRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


