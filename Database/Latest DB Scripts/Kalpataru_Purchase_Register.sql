USE [IGRSS_FINAL]
GO

/****** Object:  Table [dbo].[Kalpataru_Purchase_Stock_Register]    Script Date: 11/08/2012 14:30:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kalpataru_Purchase_Stock_Register](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[Billno] [int] NULL,
	[BillDate] [date] NULL,
	[ListOfConsumableItems] [nvarchar](200) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Kalpataru_Purchase_Stock_Register] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


