USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[WorkSheetRegister]    Script Date: 11/08/2012 15:22:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WorkSheetRegister](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkSheet_No] [int] NOT NULL,
	[Inward_No] [varchar](50) NOT NULL,
	[Name_Of_Person] [nvarchar](500) NOT NULL,
	[Letter_Details] [nvarchar](1000) NULL,
	[Work_Disposal_Date] [date] NOT NULL,
 CONSTRAINT [PK_WorkSheetRegister] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


