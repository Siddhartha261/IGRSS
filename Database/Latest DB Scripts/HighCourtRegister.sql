USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[HighcourtReg]    Script Date: 11/08/2012 14:40:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HighcourtReg](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Fileno] [int] NULL,
	[SpecialCivilApplNo] [int] NULL,
	[DistrictOfficeName] [nvarchar](256) NULL,
	[PetitionerName] [nvarchar](200) NULL,
	[PetitionReason] [nvarchar](max) NULL,
	[Parawiseremarks] [bit] NULL,
	[Parawiseremarksdate] [datetime] NULL,
	[Affidavit] [bit] NULL,
	[Affidavitdate] [datetime] NULL,
	[LatestStatus] [nvarchar](50) NULL,
	[PetitionDispoasedYear] [int] NULL,
	[DisposalDate] [datetime] NULL,
	[OrderJudgementSheet] [nvarchar](50) NULL,
	[JudgementDetail] [nvarchar](max) NULL,
 CONSTRAINT [SrNo] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


