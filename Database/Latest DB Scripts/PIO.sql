USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[PIO]    Script Date: 11/08/2012 14:43:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[PIO](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NULL,
	[ApplicantName] [nvarchar](200) NULL,
	[ApplicationDate] [date] NOT NULL,
	[ApplicantAddress] [nvarchar](max) NULL,
	[Application_Received_Actual_Date] [date] NULL,
	[Appl_BPL] [bit] NULL,
	[Sub_Info_Asked] [varchar](100) NOT NULL,
	[Recvd_Sata_Mandal] [varchar](100) NULL,
	[Recvd_Date] [date] NULL,
	[Information] [varchar](300) NULL,
	[Recvd_Fees] [money] NOT NULL,
	[Recvd_Fees_Mode] [varchar](50) NOT NULL,
	[Last_Date_Reply] [date] NOT NULL,
	[Info_Send] [bit] NOT NULL,
	[Info_Pages] [int] NOT NULL,
	[Page_Amt] [money] NOT NULL,
	[Total_Amt] [money] NOT NULL,
	[Reject_Date] [date] NOT NULL,
	[Section] [varchar](50) NOT NULL,
	[Reasons] [nvarchar](max) NOT NULL,
	[FileClosureDate] [date] NULL,
	[Authority] [nvarchar](200) NOT NULL,
	[AppealNoFirstAppeal] [int] NULL,
	[AppealDateFirstAppeal] [date] NULL,
	[Order_Authority] [int] NOT NULL,
	[FileClosureDateFirstAppeal] [date] NULL,
	[Letteer_Recvd_Date_commissioner] [date] NULL,
	[AppealNoSecondAppeal] [int] NULL,
	[ApplicationNameSecondAppeal] [nvarchar](200) NOT NULL,
	[AddressSecondAppeal] [nvarchar](max) NOT NULL,
	[AppealDateSecondAppeal] [date] NULL,
	[Remarks_SentTo_Commission] [nvarchar](500) NOT NULL,
	[Remarks_Send_Date] [date] NULL,
	[FileClosureDateSecondAppeal] [date] NULL,
 CONSTRAINT [PK_PIO] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


