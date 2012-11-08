USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[SunavniRegister]    Script Date: 11/08/2012 15:25:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SunavniRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[AppealNo] [int] NOT NULL,
	[FileNo] [int] NOT NULL,
	[NameOfPetitioner] [nvarchar](200) NULL,
	[Versus] [nvarchar](300) NULL,
	[IssueDateOfLetter] [datetime] NULL,
	[DateOfHearing] [datetime] NULL,
	[Result] [nvarchar](50) NULL,
 CONSTRAINT [PK_SunavniRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SunavniRegister]  WITH CHECK ADD  CONSTRAINT [FK_SunavniRegister_AppealRegister] FOREIGN KEY([AppealNo])
REFERENCES [dbo].[AppealRegister] ([SrNo])
GO

ALTER TABLE [dbo].[SunavniRegister] CHECK CONSTRAINT [FK_SunavniRegister_AppealRegister]
GO


