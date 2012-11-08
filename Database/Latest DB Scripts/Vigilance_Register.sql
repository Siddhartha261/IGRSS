USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[Vigilance]    Script Date: 11/08/2012 14:33:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vigilance](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Letterno] [int] NULL,
	[deptdate] [date] NULL,
	[letterdate] [date] NULL,
	[applname] [nvarchar](200) NULL,
	[empname] [nvarchar](200) NULL,
	[emp_desig] [nvarchar](200) NULL,
	[applsummary] [nvarchar](max) NULL,
	[reportdate] [date] NULL,
	[Status] [nvarchar](200) NULL,
	[closedate] [date] NULL,
	[remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Vigilance] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


