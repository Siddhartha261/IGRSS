USE [IGRSS_FINAL]
GO
/****** Object:  Table [dbo].[UOMMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UOMMaster](
	[UomID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_UOMMaster] PRIMARY KEY CLUSTERED 
(
	[UomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfer_Appl_Registeer]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfer_Appl_Registeer](
	[DetailsDesig] [nvarchar](max) NULL,
	[SrNo] [int] NOT NULL,
	[EmpName] [nvarchar](200) NULL,
	[jdt] [datetime] NULL,
	[Appldt] [datetime] NULL,
	[Res_dist] [nvarchar](100) NULL,
	[Place_req] [nvarchar](50) NULL,
	[Reason_req] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Transfer_Appl_Registeer] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sEALING]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sEALING](
	[KacheriName] [nvarchar](200) NULL,
	[Timespanyr] [datetime] NULL,
	[noofphotovolume] [int] NULL,
	[sealedphotovolumes] [int] NULL,
	[remainingvolumes] [int] NULL,
	[Remarks] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RTI]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RTI](
	[Sr_No] [int] NOT NULL,
	[Appl_name] [nvarchar](200) NULL,
	[Appl_surname] [nvarchar](200) NULL,
	[Appl_Date] [datetime] NULL,
	[PIO_desig] [nvarchar](50) NULL,
	[PIO_date] [datetime] NULL,
 CONSTRAINT [PK_RTI] PRIMARY KEY CLUSTERED 
(
	[Sr_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RosterRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RosterRegister](
	[desiddetail] [nvarchar](max) NULL,
	[Anamattype] [nvarchar](50) NULL,
	[Recruittype] [nvarchar](50) NULL,
	[Perm_detail] [nvarchar](max) NULL,
	[Recruit_yr] [int] NULL,
	[RosterSrNo] [int] NOT NULL,
	[Cat_reserve] [nvarchar](50) NULL,
	[Empname] [nvarchar](200) NULL,
	[Appt_dt] [datetime] NULL,
	[Appt_auth] [nvarchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_RosterRegister] PRIMARY KEY CLUSTERED 
(
	[RosterSrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevenueStampMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueStampMaster](
	[RevenueStampId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
	[Amount] [money] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_RevenueStampMaster] PRIMARY KEY CLUSTERED 
(
	[RevenueStampId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarankit]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarankit](
	[Tarankit_Atarnkit] [nchar](100) NULL,
	[quesno] [int] NULL,
	[mlaName] [nvarchar](200) NULL,
	[mlaPlace] [nvarchar](50) NULL,
	[Subject] [nchar](100) NULL,
	[Number] [int] NULL,
	[Reply_Sent] [nvarchar](200) NULL,
	[Date] [date] NULL,
	[Fileno] [int] NULL,
	[Remarks] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talukamas]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talukamas](
	[distcd] [int] NOT NULL,
	[talcd] [int] NOT NULL,
	[talukaname] [text] NULL,
	[talukaname_g] [text] NULL,
 CONSTRAINT [PK_talukamas_1] PRIMARY KEY CLUSTERED 
(
	[talcd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SunavniRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SunavniRegister](
	[SrNo] [int] NOT NULL,
	[AppealNo] [int] NULL,
	[FileNo] [int] NULL,
	[NameOfPetitioner] [nvarchar](50) NULL,
	[Versus] [nvarchar](50) NULL,
	[IssueDateOfLetter] [datetime] NULL,
	[DateOfHearing] [datetime] NULL,
	[Result] [nchar](10) NULL,
 CONSTRAINT [PK_SunavniRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRORates]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRORates](
	[RateId] [uniqueidentifier] NOT NULL,
	[RateType] [nchar](10) NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_SRORates] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOFile]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOFile](
	[SrNo] [int] NOT NULL,
	[Circulars] [int] NULL,
	[DateOfCirculars] [datetime] NULL,
	[Department] [nchar](10) NULL,
	[Subject] [nvarchar](50) NULL,
	[PageNo] [int] NULL,
 CONSTRAINT [PK_SOFile] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worksheet_Register]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worksheet_Register](
	[WorhSheet_no] [int] NOT NULL,
	[Inward_No] [int] NULL,
	[NameofPerson] [nvarchar](500) NULL,
	[Letter_details] [nvarchar](500) NULL,
	[Work_Disposal] [datetime] NULL,
 CONSTRAINT [PK_Worksheet_Register] PRIMARY KEY CLUSTERED 
(
	[WorhSheet_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[villagemas]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[villagemas](
	[villcd] [int] NOT NULL,
	[distcd] [int] NULL,
	[talcd] [int] NULL,
	[villname] [text] NULL,
	[villname_g] [text] NULL,
	[gamtalrate] [int] NULL,
	[NARATE] [int] NULL,
	[gamtalrate_HIGH] [int] NULL,
	[gamtalrate_medi] [int] NULL,
	[gamtalrate_low] [int] NULL,
	[gamtalrate_prop] [int] NULL,
	[taluka] [int] NULL,
	[office] [int] NULL,
	[district] [int] NULL,
	[opentag] [bit] NULL,
 CONSTRAINT [PK_villagemas] PRIMARY KEY CLUSTERED 
(
	[villcd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vigillance]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vigillance](
	[srno] [int] NULL,
	[Letterno] [int] NULL,
	[deptdate] [date] NULL,
	[letterdate] [date] NULL,
	[applname] [nvarchar](200) NULL,
	[empname] [nvarchar](200) NULL,
	[emp_desig] [nchar](10) NULL,
	[applsummary] [nvarchar](max) NULL,
	[reportdate] [date] NULL,
	[Status] [nchar](10) NULL,
	[closedate] [date] NULL,
	[remarks] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorMaster](
	[VendorID] [uniqueidentifier] NOT NULL,
	[VendorType] [nchar](1) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[VendorName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](30) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_VendorMaster] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''A'' Service, ''B'' Supplier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VendorMaster', @level2type=N'COLUMN',@level2name=N'VendorType'
GO
/****** Object:  Table [dbo].[distmas]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distmas](
	[distcd] [int] NOT NULL,
	[distname] [text] NULL,
	[distname_g] [text] NULL,
 CONSTRAINT [PK_ZillaPanchayatMaster] PRIMARY KEY CLUSTERED 
(
	[distcd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diary]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diary](
	[Srno] [int] NOT NULL,
	[Daysduringmonth] [int] NULL,
	[TakenLeave] [int] NULL,
	[workingDays] [int] NULL,
	[InspectionDays] [int] NULL,
	[NoOfOfficeinspected] [int] NULL,
	[Timetakenduringinspection] [time](7) NULL,
	[NoOfDocuments] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Diary] PRIMARY KEY CLUSTERED 
(
	[Srno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationMaster](
	[DesignationID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_DesignationMaster] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentMaster](
	[DepartmentID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentalInquiryRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentalInquiryRegister](
	[Srno] [int] NOT NULL,
	[FileNo] [int] NULL,
	[Subject] [nvarchar](50) NULL,
	[DateOfChargeSheet] [datetime] NULL,
	[NameOfEmployee] [nvarchar](200) NULL,
	[Grade] [nchar](10) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_DepartmentalInquiryRegister] PRIMARY KEY CLUSTERED 
(
	[Srno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEL_RegistrationFeeDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEL_RegistrationFeeDetails](
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[FeeId] [uniqueidentifier] NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_RegistrationFeeDetails] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEL_RegistrationDocumentCheckList]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEL_RegistrationDocumentCheckList](
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[DocumentTypeId] [uniqueidentifier] NULL,
	[Submitted] [bit] NULL,
	[NotApplicable] [bit] NULL,
	[DocumentNumber] [nvarchar](30) NULL,
	[Remarks] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_RegistrationDocumentCheckList] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEL_NoticeType_LKP]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEL_NoticeType_LKP](
	[NoticeTypeId] [uniqueidentifier] NOT NULL,
	[Type] [nchar](3) NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
	[TPSchemeNo] [nvarchar](20) NULL,
	[TPSchemeName] [nvarchar](50) NULL,
	[FinalPlotNo] [nvarchar](20) NULL,
	[CitySurveyNo] [nvarchar](20) NULL,
	[RevenueSurveyNo] [nvarchar](20) NULL,
	[Ward_SubWardNo] [nvarchar](20) NULL,
 CONSTRAINT [PK_NoticeType_LKP] PRIMARY KEY CLUSTERED 
(
	[NoticeTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeadStockRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeadStockRegister](
	[Sr.No] [int] NOT NULL,
	[DescArticle] [nvarchar](500) NULL,
	[Authority_purchase] [nchar](10) NULL,
	[Purchasedate] [datetime] NULL,
	[No_of_qty] [int] NULL,
	[Value] [int] NULL,
	[Initials_ Of_ H.o.] [char](10) NULL,
	[Final_Disposal] [nchar](10) NULL,
	[No_qty] [int] NULL,
	[Nature_disposal] [nchar](10) NULL,
	[Authority_voucher] [nchar](10) NULL,
	[Amt_realize] [int] NULL,
	[Date_credit] [datetime] NULL,
	[Amt_written_off] [int] NULL,
	[Balance_stock] [int] NULL,
	[No] [nchar](10) NULL,
	[Remarks] [nvarchar](500) NULL,
	[LibraryRegister] [nchar](10) NULL,
 CONSTRAINT [PK_DeadStockRegister] PRIMARY KEY CLUSTERED 
(
	[Sr.No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CR_Register]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_Register](
	[DetailsDesig] [nvarchar](max) NULL,
	[SrNo] [int] NOT NULL,
	[Empname] [nvarchar](200) NULL,
	[Place] [nvarchar](200) NULL,
	[joinDt] [datetime] NULL,
	[Appldt] [datetime] NULL,
	[Res_dist] [nvarchar](100) NULL,
	[Place_req] [nvarchar](50) NULL,
	[Reasonreq] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_CR_Register] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletedScope]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletedScope](
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[completedScopeID] [uniqueidentifier] NOT NULL,
	[state] [image] NOT NULL,
	[modified] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[C.L.Card]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[C.L.Card](
	[SrNo] [int] NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[EmployeeName] [nvarchar](200) NULL,
	[CalendarYear] [int] NULL,
	[Designation] [nchar](10) NULL,
	[C.L.Date/OptionalLeave] [datetime] NULL,
	[HalfDay/FullDay] [int] NULL,
	[FirstShift/SecondShift] [int] NULL,
	[ReasonsOfLeave] [nvarchar](500) NULL,
	[TotalOfTakenLeaves] [int] NULL,
	[TotalOfRemainingLeaves] [int] NULL,
	[AsOn] [datetime] NULL,
	[LeaveApplicant] [nvarchar](50) NULL,
	[LeaveApprovedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_C.L.Card] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookForms]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookForms](
	[Sr_no] [int] NOT NULL,
	[No_of_forms] [int] NULL,
	[Demand_quantity] [int] NULL,
	[Actual_Stock] [int] NULL,
	[Form_no] [int] NULL,
	[Dept_name] [nvarchar](500) NULL,
	[Emp_Name] [nvarchar](50) NULL,
	[Recd_Date] [datetime] NULL,
	[Remarks] [nvarchar](500) NULL,
 CONSTRAINT [PK_BookForms] PRIMARY KEY CLUSTERED 
(
	[Sr_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillRegister](
	[BillNo] [int] NULL,
	[BillDate] [datetime] NULL,
	[DetailsOfBill] [nvarchar](max) NULL,
	[Name_subamount] [nvarchar](50) NULL,
	[Amount_subamount] [int] NULL,
	[Total_subamount] [int] NULL,
	[Name_deductions] [nvarchar](50) NULL,
	[Amount_deductions] [int] NULL,
	[Total_deductions] [int] NULL,
	[NetAmount] [int] NULL,
	[SignOnBill] [nchar](10) NULL,
	[SignDate] [datetime] NULL,
	[DatePpresentedTreasure] [datetime] NULL,
	[DateApprovalTreasure] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUDIT]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT](
	[AuditId] [bigint] NULL,
	[TableName] [varchar](50) NOT NULL,
	[RowId] [uniqueidentifier] NOT NULL,
	[Operation] [varchar](10) NOT NULL,
	[OccurredAt] [datetime] NOT NULL,
	[PerformedBy] [varchar](50) NOT NULL,
	[FieldName] [varchar](50) NULL,
	[OldValue] [varchar](1000) NULL,
	[NewValue] [varchar](1000) NULL,
	[Data] [xml] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationDisposalRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationDisposalRegister](
	[SrNo] [int] NOT NULL,
	[Date] [datetime] NULL,
	[ApplicantName] [nvarchar](200) NULL,
	[ApplicantAddress] [nvarchar](max) NULL,
	[NoOfCopiesIssued] [int] NULL,
	[FeesTaken] [int] NULL,
	[ReceiptNo] [int] NULL,
	[DisposalDate] [datetime] NULL,
 CONSTRAINT [PK_ApplicationDisposalRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppealTypeMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppealTypeMaster](
	[AppealTypeId] [nchar](1) NOT NULL,
	[AppealName] [nvarchar](50) NULL,
	[AppealName_Guj] [nvarchar](50) NULL,
 CONSTRAINT [PK_AppealTypeMaster_1] PRIMARY KEY CLUSTERED 
(
	[AppealTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppealRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppealRegister](
	[SrNo] [int] NOT NULL,
	[FileNo] [int] NULL,
	[KacheriOffice] [nvarchar](50) NULL,
	[DocumentNo] [int] NULL,
	[Year] [int] NULL,
	[NameOfApplicant] [nvarchar](200) NULL,
	[Versus] [nvarchar](50) NULL,
	[DeficitStampDuty] [int] NULL,
	[TotalStampDuty] [int] NULL,
	[Continueremand] [bit] NULL,
	[Result] [nchar](10) NULL,
	[outwardno] [int] NULL,
	[Date] [datetime] NULL,
	[AGYear] [int] NULL,
	[ParaNo] [nchar](10) NULL,
 CONSTRAINT [PK_AppealRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActMaster](
	[ActId] [uniqueidentifier] NOT NULL,
	[DescriptionOfAct] [nvarchar](50) NULL,
	[NameOfAct] [nvarchar](50) NULL,
	[Module] [char](3) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
	[Info] [xml] NULL,
 CONSTRAINT [PK_ActMaster] PRIMARY KEY CLUSTERED 
(
	[ActId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACB_CaseRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACB_CaseRegister](
	[SrNo] [int] NOT NULL,
	[FileNo] [int] NULL,
	[EmployeeName] [nvarchar](200) NULL,
	[Designation] [nchar](10) NULL,
	[PlaceOfEventOccured] [nvarchar](50) NULL,
	[SummaryOfCase] [nvarchar](max) NULL,
	[F.I.RNo] [int] NULL,
	[CourstCaseNo] [int] NULL,
	[PermissionDateOfProsecution] [datetime] NULL,
	[DateOfSuspension] [datetime] NULL,
	[Re-InstateDate] [datetime] NULL,
	[OrderOfCourt] [nvarchar](350) NULL,
	[HighcourtAppeal] [bit] NULL,
	[HighcourtAppealNo] [int] NULL,
	[HighCourtAppealDate] [datetime] NULL,
	[Highcourtappealorder] [nvarchar](500) NULL,
	[SupremeCourtAppeal] [bit] NULL,
	[Supremecourtappealno] [int] NULL,
	[Supremecourtappleatdate] [datetime] NULL,
	[Supremecourtappealorder] [nvarchar](500) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_ACB_CaseRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alerts]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerts](
	[AlertId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](150) NULL,
	[SentAt] [datetime] NULL,
	[SentTo] [nvarchar](50) NULL,
	[SentBy] [nvarchar](50) NULL,
	[Link] [nvarchar](255) NULL,
	[Info] [xml] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[DeletedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED 
(
	[AlertId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdjudicationRequest]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdjudicationRequest](
	[AdjudicationId] [uniqueidentifier] NOT NULL,
	[FilePrefix] [nchar](4) NULL,
	[FileSlNo] [numeric](5, 0) NULL,
	[FileYear] [numeric](4, 0) NULL,
	[ValuationFormId] [uniqueidentifier] NULL,
	[RegistrationId] [uniqueidentifier] NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[ApplicationDate] [datetime] NULL,
	[ReceiptNumber] [nvarchar](15) NULL,
	[AdjudicationTotalFees] [money] NULL,
	[PhysicalVerification] [bit] NULL,
	[CertificateNumber] [nvarchar](20) NULL,
	[CertificateIssuedOn] [datetime] NULL,
	[CertificateDescription] [nvarchar](150) NULL,
	[Status] [nchar](2) NULL,
	[SchemeType] [nchar](10) NULL,
 CONSTRAINT [PK_AdjudicationRequest] PRIMARY KEY CLUSTERED 
(
	[AdjudicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IgrssGlobalConfig]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IgrssGlobalConfig](
	[Module] [char](3) NOT NULL,
	[ConfigKey] [nchar](10) NOT NULL,
	[ConfigValue] [xml] NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_IgrssGlobalConfig] PRIMARY KEY CLUSTERED 
(
	[Module] ASC,
	[ConfigKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Igrss_Audit]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igrss_Audit](
	[Module] [nchar](3) NOT NULL,
	[TableName] [nchar](10) NOT NULL,
	[FileNo] [nchar](20) NOT NULL,
	[OldValues] [nvarchar](50) NULL,
	[NewValues] [nchar](50) NULL,
	[UserName] [nchar](20) NULL,
	[TimeStamp] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistroryCard]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistroryCard](
	[Empname] [nvarchar](200) NULL,
	[DOB] [date] NULL,
	[P_addr] [nvarchar](max) NULL,
	[Eduqual] [nvarchar](max) NULL,
	[Jdt] [date] NULL,
	[Jdesig] [nvarchar](200) NULL,
	[Promdt] [date] NULL,
	[Promdesig] [nvarchar](200) NULL,
	[actdtjdept] [date] NULL,
	[Religion] [nvarchar](50) NULL,
	[Caste] [nvarchar](50) NULL,
	[C_desig] [nvarchar](200) NULL,
	[PsrvcTrnpdt] [date] NULL,
	[clrkdeptexpdt] [date] NULL,
	[fsthgrddt] [date] NULL,
	[scndhgrddt] [date] NULL,
	[extracactv] [nvarchar](max) NULL,
	[extraqual] [nvarchar](500) NULL,
	[othdetail] [nvarchar](max) NULL,
	[c_desigoffc] [nvarchar](200) NULL,
	[dttodt] [date] NULL,
	[trnsfrdt] [date] NULL,
	[leave] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HighcourtReg]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HighcourtReg](
	[SrNo] [int] NOT NULL,
	[Fileno] [int] NULL,
	[SpecialCivilApplNo] [int] NULL,
	[DistrictOfficeName] [nvarchar](50) NULL,
	[PetitionerName] [nvarchar](200) NULL,
	[PetitionReason] [nvarchar](max) NULL,
	[Parawiseremarks] [bit] NULL,
	[Parawiseremarksdate] [datetime] NULL,
	[Affidavit] [bit] NULL,
	[Affidavitdate] [datetime] NULL,
	[LatestStatus] [nchar](10) NULL,
	[PetitionDispoasedYear] [int] NULL,
	[DisposalDate] [datetime] NULL,
	[OrderJudgementSheet] [nchar](10) NULL,
	[JudgementDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_HighcourtReg] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrantRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrantRegister](
	[SrNo] [int] NOT NULL,
	[BillNo] [int] NULL,
	[Date] [datetime] NULL,
	[DetailOfBill] [nvarchar](max) NULL,
	[AmountOfBill] [int] NULL,
	[TotalExpense] [int] NULL,
	[Balance] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GrantRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GovtDocs]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GovtDocs](
	[SrNo] [int] NOT NULL,
	[InwardNo] [int] NULL,
	[Details] [nvarchar](max) NULL,
	[LetterNo] [int] NULL,
	[LetterDate] [datetime] NULL,
	[NameOfDepartment] [nvarchar](50) NULL,
	[FileNo] [int] NULL,
	[DetailsOfOutput] [nvarchar](max) NULL,
	[DetailsOfPreservingFiles] [nvarchar](max) NULL,
	[TypesOfRecord] [nchar](10) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_GovtDocs] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileRemarks]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileRemarks](
	[RemarkId] [uniqueidentifier] NULL,
	[FileId] [uniqueidentifier] NOT NULL,
	[RemarkNo] [numeric](18, 0) NOT NULL,
	[Subject] [nvarchar](50) NULL,
	[Body] [ntext] NULL,
	[RemarkBy] [nvarchar](25) NULL,
	[RemarkAt] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileMovementRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileMovementRegister](
	[FileNo] [int] NOT NULL,
	[SubjectOfFile] [nchar](10) NULL,
	[FileMovementDate] [datetime] NULL,
	[SendTo] [nchar](10) NULL,
	[ReturnDate] [datetime] NULL,
	[FilePreservationDate] [int] NULL,
	[TypeOfRecord] [nchar](10) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_FileMovementRegister] PRIMARY KEY CLUSTERED 
(
	[FileNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileManagementMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileManagementMaster](
	[FileId] [uniqueidentifier] NOT NULL,
	[FileSerialNo] [numeric](18, 0) NOT NULL,
	[FileDepartment] [nvarchar](5) NULL,
	[FileNo] [numeric](18, 0) NULL,
	[FileYear] [nvarchar](4) NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[IsOpen] [bit] NULL,
 CONSTRAINT [PK_FileManagementMaster] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileForwards]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileForwards](
	[FileId] [uniqueidentifier] NOT NULL,
	[ForwardNo] [numeric](18, 0) NOT NULL,
	[ForwardedBy] [nvarchar](50) NULL,
	[ForwardedTo] [nvarchar](500) NULL,
	[ForwardedAt] [datetime] NULL,
 CONSTRAINT [PK_FileForwards_1] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC,
	[ForwardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[File]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[File](
	[SrNo] [int] NOT NULL,
	[FileName] [nchar](10) NULL,
	[FileNo] [int] NULL,
	[StartingDate] [datetime] NULL,
	[EndingDate] [datetime] NULL,
	[ClassOfFile] [nchar](10) NULL,
	[DisposalDateOfFile] [datetime] NULL,
	[DisposalOn] [datetime] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeMaster](
	[FeeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[FeeType] [nvarchar](5) NULL,
	[Amount] [money] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_FeeMaster] PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[FaqId] [uniqueidentifier] NOT NULL,
	[Question] [nvarchar](100) NULL,
	[Answer] [nvarchar](max) NULL,
	[CreatedBy] [nchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nchar](25) NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FajalRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FajalRegister](
	[SrNo] [int] NOT NULL,
	[DetailsOfDesignation] [nvarchar](max) NULL,
	[EmployeeName] [nvarchar](200) NULL,
	[Designation] [nvarchar](50) NULL,
	[Grade] [nchar](10) NULL,
	[ResidenceDistrict] [nvarchar](50) NULL,
	[CurrentOffice] [nchar](10) NULL,
 CONSTRAINT [PK_FajalRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentMaster](
	[DocumentTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_DocumentMaster] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citizen]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Citizen](
	[Type] [char](1) NOT NULL,
	[Description] [ntext] NULL,
	[Name] [nchar](50) NULL,
	[Address] [nchar](50) NULL,
	[PhoneNo] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChequeRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChequeRegister](
	[SrNo] [int] NOT NULL,
	[ChequeReceivedDate] [datetime] NULL,
	[PersonNamegivingcheque] [nvarchar](200) NULL,
	[BankName] [nvarchar](50) NULL,
	[ChequeNo] [int] NULL,
	[ChequeDate] [datetime] NULL,
	[Amount] [int] NULL,
	[AccountName] [nvarchar](200) NULL,
	[DateChequeSent] [datetime] NULL,
	[DateHisab] [datetime] NULL,
	[InitialsOfOfficer] [nchar](10) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChequeRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_Upload]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_Upload](
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](350) NULL,
	[path] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationHearing]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationHearing](
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[HearingId] [uniqueidentifier] NOT NULL,
	[HearingDate] [datetime] NULL,
	[HearingSummary] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_RegistrationHearing] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC,
	[HearingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationFeeDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationFeeDetails](
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[FeeId] [uniqueidentifier] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_RegistrationFeeDetails_1] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationDocumentCheckList]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationDocumentCheckList](
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[DocumentTypeId] [uniqueidentifier] NULL,
	[Submitted] [bit] NULL,
	[NotApplicable] [bit] NULL,
	[DocumentNumber] [nchar](10) NULL,
	[Remarks] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_RegistrationDocumentCheckList_1] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefundTypeMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefundTypeMaster](
	[RefundTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_RefundTypeMaster] PRIMARY KEY CLUSTERED 
(
	[RefundTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationTypeMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationTypeMaster](
	[RegistrationTypeId] [uniqueidentifier] NULL,
	[RegistartionName] [nvarchar](50) NULL,
	[RegistrationTypeDesc] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationTypeDoc_MapMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationTypeDoc_MapMaster](
	[RegistrationTypeId] [uniqueidentifier] NOT NULL,
	[DocumentTypeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RegistrationTypeDoc_MapMaster] PRIMARY KEY CLUSTERED 
(
	[RegistrationTypeId] ASC,
	[DocumentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationType_LKP]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationType_LKP](
	[RegistrationTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_RegistrationType_LKP] PRIMARY KEY CLUSTERED 
(
	[RegistrationTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordRegister](
	[FileName] [nvarchar](50) NULL,
	[FileNo] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QueriesInspection]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QueriesInspection](
	[QueryId] [numeric](18, 0) NOT NULL,
	[Query] [ntext] NULL,
	[Received] [bit] NULL,
	[Remarks] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedAt] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_QueriesInspection] PRIMARY KEY CLUSTERED 
(
	[QueryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QualificationMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QualificationMaster](
	[QualificationID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_QualificationMaster] PRIMARY KEY CLUSTERED 
(
	[QualificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Offices](
	[OfficeId] [uniqueidentifier] NOT NULL,
	[OfficeName] [nvarchar](256) NOT NULL,
	[OfficeTypeId] [uniqueidentifier] NULL,
	[Description] [nvarchar](256) NULL,
	[DistrictCode] [int] NULL,
	[TalukaCode] [int] NULL,
	[VillageCode] [int] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[EmailID] [nvarchar](50) NULL,
	[PhoneNo] [varchar](50) NULL,
 CONSTRAINT [PK_Igrss_Offices] PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostalDeliveryType_LKP]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalDeliveryType_LKP](
	[PostalDeliveryType_Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_PostalDeliveryType_LKP] PRIMARY KEY CLUSTERED 
(
	[PostalDeliveryType_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PIO]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PIO](
	[FileNo] [int] NULL,
	[ApplicantName] [nvarchar](200) NULL,
	[ApplicationDate] [datetime] NULL,
	[FileClosureDate] [datetime] NULL,
	[AppealNoFirstAppeal] [int] NULL,
	[AppealDateFirstAppeal] [datetime] NULL,
	[FileClosureDateFirstAppeal] [datetime] NULL,
	[AppealNoSecondAppeal] [int] NULL,
	[AppealDateSecondAppeal] [datetime] NULL,
	[FileClosureDateSecondAppeal] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayBill]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayBill](
	[Billno] [int] NULL,
	[Date] [datetime] NULL,
	[Billparticular] [nvarchar](50) NULL,
	[Billamt] [int] NULL,
	[grossamt] [int] NULL,
	[Deduction] [int] NULL,
	[Netamt] [int] NULL,
	[dt_initial_gazet_officer] [nchar](10) NULL,
	[Present_date] [datetime] NULL,
	[amt_treasure] [int] NULL,
	[Sign_dt] [datetime] NULL,
	[dt_receipt_treasure] [datetime] NULL,
	[dt_entry_cashbk] [datetime] NULL,
	[Remarks] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutwardRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutwardRegister](
	[OutwardNo] [int] NOT NULL,
	[OutwardDate] [datetime] NULL,
	[LetterNo] [int] NULL,
	[documentfrombranch] [nchar](10) NULL,
	[Description] [nvarchar](max) NULL,
	[SentTo] [nchar](10) NULL,
	[Address] [nvarchar](max) NULL,
	[CopyTo] [nchar](10) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_OutwardRegister] PRIMARY KEY CLUSTERED 
(
	[OutwardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeTypes_LKP]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeTypes_LKP](
	[OfficeTypeId] [uniqueidentifier] NOT NULL,
	[OfficeTypeName] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[OfficeProcess] [xml] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_OfficeType_LkpTb] PRIMARY KEY CLUSTERED 
(
	[OfficeTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostalStampDenomMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalStampDenomMaster](
	[StampDenomId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[Amount] [money] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_DenominationMaster] PRIMARY KEY CLUSTERED 
(
	[StampDenomId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionTypeMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionTypeMaster](
	[InspectionTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionTypeMaster] PRIMARY KEY CLUSTERED 
(
	[InspectionTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstanceState]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstanceState](
	[uidInstanceID] [uniqueidentifier] NOT NULL,
	[state] [image] NULL,
	[status] [int] NULL,
	[unlocked] [int] NULL,
	[blocked] [int] NULL,
	[info] [ntext] NULL,
	[modified] [datetime] NOT NULL,
	[ownerID] [uniqueidentifier] NULL,
	[ownedUntil] [datetime] NULL,
	[nextTimer] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionYearlyShedule]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionYearlyShedule](
	[ScheduleId] [uniqueidentifier] NOT NULL,
	[OfficerId] [uniqueidentifier] NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[Year] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionYearlyShedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionMemoAction]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionMemoAction](
	[InspectionMemoId] [uniqueidentifier] NOT NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[ActionTakenDate] [datetime] NULL,
 CONSTRAINT [PK_InspectionMemoAction] PRIMARY KEY CLUSTERED 
(
	[InspectionMemoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionMemo]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionMemo](
	[InspectionMemoId] [uniqueidentifier] NOT NULL,
	[InspectionId] [uniqueidentifier] NULL,
	[Subject] [nvarchar](50) NULL,
	[MemoBody] [nvarchar](50) NULL,
	[MemoDate] [datetime] NULL,
 CONSTRAINT [PK_InspectionMemo_1] PRIMARY KEY CLUSTERED 
(
	[InspectionMemoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoRecordCertificateregister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoRecordCertificateregister](
	[SrNo] [int] NOT NULL,
	[ApplicantName] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[ApplicationDate] [datetime] NULL,
	[Purpose] [nchar](10) NULL,
	[SignOfMarriageSubRegistrat] [nchar](10) NULL,
	[ApplicationDisposalDate] [datetime] NULL,
	[SignOfOfficer] [nchar](10) NULL,
 CONSTRAINT [PK_NoRecordCertificateregister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MLA]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MLA](
	[InwardNo] [int] NULL,
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
	[Remarks] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarriageVolumeListRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarriageVolumeListRegister](
	[SrNo] [int] NOT NULL,
	[VolumeNo] [int] NULL,
	[DateToDate] [datetime] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_MarriageVolumeListRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarriageCertificate]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarriageCertificate](
	[Bridegroom_name] [nvarchar](500) NULL,
	[Bridegroom_father_name] [nvarchar](500) NULL,
	[Bride_name] [nvarchar](500) NULL,
	[Bride_father_name] [nvarchar](500) NULL,
	[MarriageDate] [datetime] NULL,
	[MarriagePlace] [nchar](10) NULL,
	[Village_church_name] [nvarchar](50) NULL,
	[Talk] [nchar](10) NULL,
	[District] [nchar](10) NULL,
	[ApplicationNo] [int] NULL,
	[ApplicationDate] [datetime] NULL,
	[NoOfCopies] [int] NULL,
	[ReceiptNo] [int] NULL,
	[Fees] [int] NULL,
	[CopiesFurnished] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MahekamRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MahekamRegister](
	[DesigDetail] [nvarchar](max) NULL,
	[SrNo] [int] NOT NULL,
	[Desig] [nvarchar](50) NULL,
	[Grade] [nchar](10) NULL,
	[Res_dist] [nvarchar](50) NULL,
	[Curr_offc] [nvarchar](max) NULL,
	[DatetoDate] [datetime] NULL,
 CONSTRAINT [PK_MahekamRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LekhanSamagriRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LekhanSamagriRegister](
	[SrNo] [int] NOT NULL,
	[Article_desc] [nvarchar](max) NULL,
	[Purchaseauthorityname] [nvarchar](200) NULL,
	[PurchaseDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[ArticlePrice] [int] NULL,
	[EmployeeReceivingDate] [datetime] NULL,
	[ArticleCompletiobDate] [datetime] NULL,
	[EmployeeSign] [nchar](10) NULL,
	[Officersign] [nchar](10) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_LekhanSamagriRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jantri]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jantri](
	[distcd] [int] NOT NULL,
	[talcd] [int] NOT NULL,
	[villcd] [int] NOT NULL,
	[TpNo] [nvarchar](50) NULL,
	[TPSchemeName] [nchar](10) NULL,
	[CitySurveyNo] [numeric](18, 0) NULL,
	[RevenueSurveyNo] [numeric](18, 0) NULL,
	[surveynumber1] [text] NULL,
	[surveynumberext1] [text] NULL,
	[surveynumber2] [text] NULL,
	[surveynumberext2] [nchar](10) NULL,
	[rate] [int] NULL,
	[rate_Comm] [int] NULL,
	[rate_ind] [int] NULL,
	[SheetNo] [text] NULL,
	[village] [int] NULL,
	[REMDESC] [text] NULL,
	[RemDESC1] [text] NULL,
	[RemDESC2] [text] NULL,
	[RemDESC3] [text] NULL,
	[RemDESC4] [text] NULL,
	[rate_plot] [int] NULL,
	[APrate] [int] NULL,
	[ANPrate] [int] NULL,
	[NA_Res_Rate] [int] NULL,
	[NA_Comm_Rate] [int] NULL,
	[NA_Ind_Rate] [int] NULL,
	[NA_Prate] [int] NULL,
	[NA_NPrate] [int] NULL,
 CONSTRAINT [PK_Jantri] PRIMARY KEY CLUSTERED 
(
	[distcd] ASC,
	[talcd] ASC,
	[villcd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InwardRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InwardRegister](
	[SrNo] [int] IDENTITY(1,1) NOT NULL,
	[InwardNo] [varchar](50) NOT NULL,
	[InwardDate] [datetime] NULL,
	[Description] [nvarchar](300) NULL,
	[ApplicantName] [varchar](100) NULL,
	[ApplicationDate] [datetime] NULL,
	[SentTo] [uniqueidentifier] NULL,
	[Remarks] [nvarchar](500) NULL,
	[ApplicantAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK_InwardRegister] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InspectionYearlyScheduleDetail]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionYearlyScheduleDetail](
	[DetailScheduleId] [uniqueidentifier] NOT NULL,
	[ScheduleId] [uniqueidentifier] NOT NULL,
	[Month] [decimal](2, 0) NULL,
	[Remarks] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionYearlyScheduleDetail] PRIMARY KEY CLUSTERED 
(
	[DetailScheduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inward_OutwardRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inward_OutwardRegister](
	[Inward_outwardId] [uniqueidentifier] NOT NULL,
	[InwardNo] [int] NULL,
	[RegisterType] [char](1) NULL,
	[DocumentNo] [nvarchar](30) NULL,
	[InOutDate] [datetime] NULL,
	[DocType] [uniqueidentifier] NULL,
	[ApplicantName] [varchar](200) NULL,
	[ApplicantAddress] [varchar](max) NULL,
	[ApplicationDate] [datetime] NULL,
	[SentOfficeID] [uniqueidentifier] NULL,
	[ReceivingOfficeID] [uniqueidentifier] NULL,
	[DocumentSentFrom] [nvarchar](50) NULL,
	[DocumentSentTo] [nvarchar](50) NULL,
	[Description] [nvarchar](120) NULL,
	[StampValueAffixed] [money] NULL,
	[DeliveryType] [uniqueidentifier] NULL,
	[Remarks] [nchar](150) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Inward_OutwardRegister] PRIMARY KEY CLUSTERED 
(
	[Inward_outwardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'I for In and O for Out' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inward_OutwardRegister', @level2type=N'COLUMN',@level2name=N'RegisterType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MLA/Minister/Govt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inward_OutwardRegister', @level2type=N'COLUMN',@level2name=N'DocType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Postal / Courier / By Hand' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inward_OutwardRegister', @level2type=N'COLUMN',@level2name=N'DeliveryType'
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Description] [nvarchar](50) NULL,
	[UomID] [uniqueidentifier] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[ItemType] [nvarchar](50) NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionItenary]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionItenary](
	[ItenaryId] [uniqueidentifier] NOT NULL,
	[ScheduleId] [uniqueidentifier] NULL,
	[Month] [datetime] NULL,
	[InspectingDate] [datetime] NULL,
	[InspectingOfficeId] [uniqueidentifier] NULL,
	[EndDate] [datetime] NULL,
	[ItenaryDetails] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionItenary] PRIMARY KEY CLUSTERED 
(
	[ItenaryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionCheckListMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionCheckListMaster](
	[CheckListId] [uniqueidentifier] NOT NULL,
	[InspectionTypeId] [uniqueidentifier] NULL,
	[Description] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionCheckListMaster_1] PRIMARY KEY CLUSTERED 
(
	[CheckListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostalStampDayStock]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalStampDayStock](
	[DayStockId] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[OpeningBalance] [money] NULL,
	[PurchaseValue] [money] NULL,
	[UsedValue] [money] NULL,
 CONSTRAINT [PK_PostalStampDayStock] PRIMARY KEY CLUSTERED 
(
	[DayStockId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseApplication]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseApplication](
	[LicenseApplicationId] [uniqueidentifier] NOT NULL,
	[ApplnNumber] [nvarchar](30) NULL,
	[NameOfApplicant] [nvarchar](50) NULL,
	[PresentAddress] [nvarchar](150) NULL,
	[PermanentAddress] [nvarchar](150) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[ApplicationDate] [datetime] NULL,
	[Qualification] [nvarchar](50) NULL,
	[Experience] [decimal](4, 2) NULL,
	[Caste] [nvarchar](50) NULL,
	[BusinessAddress] [nvarchar](150) NULL,
	[BusinessPhone] [nvarchar](50) NULL,
	[TotalInvestmentAmount] [decimal](10, 2) NULL,
	[NameAndAddressOfReferer] [xml] NULL,
	[SubmissionOfficeId] [uniqueidentifier] NULL,
	[IssuedDate] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[Status] [nchar](2) NULL,
	[Remarks] [nvarchar](250) NULL,
	[WfInstanceId] [uniqueidentifier] NULL,
	[WfInfo] [xml] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_LicenseApplication] PRIMARY KEY CLUSTERED 
(
	[LicenseApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficesCommunication_LKP]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficesCommunication_LKP](
	[OfficeId] [uniqueidentifier] NOT NULL,
	[CommunicationKey] [nvarchar](15) NOT NULL,
	[CommunicatingOffice] [uniqueidentifier] NULL,
	[Description] [ntext] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Communicating Offices] PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC,
	[CommunicationKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeProcess_LKP]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OfficeProcess_LKP](
	[OfficeId] [uniqueidentifier] NOT NULL,
	[ProcessId] [char](3) NOT NULL,
	[Data] [xml] NULL,
	[Remarks] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_OfficeProcess_LKP] PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC,
	[ProcessId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NoticeDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeDetails](
	[NoticeId] [uniqueidentifier] NOT NULL,
	[NoticeTypeId] [uniqueidentifier] NULL,
	[Type] [nchar](3) NULL,
	[ReferenceId] [uniqueidentifier] NULL,
	[IssuedDate] [datetime] NULL,
	[SentBy] [nvarchar](25) NULL,
 CONSTRAINT [PK_NoticeDetails] PRIMARY KEY CLUSTERED 
(
	[NoticeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document_RegTypeMapingMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document_RegTypeMapingMaster](
	[RegistrationTypeId] [uniqueidentifier] NOT NULL,
	[DocumentTypeId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Document_RegTypeMapingMaster] PRIMARY KEY CLUSTERED 
(
	[RegistrationTypeId] ASC,
	[DocumentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppealApplication]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppealApplication](
	[AppealApplicationId] [uniqueidentifier] NOT NULL,
	[AppealPrefix] [nchar](4) NULL,
	[AppealSlNo] [numeric](5, 0) NULL,
	[AppealYear] [numeric](4, 0) NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[RegistrationNo] [nvarchar](25) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[TypeOfAppeal] [nchar](1) NULL,
	[CalculatedAmount] [float] NULL,
	[DepositAmount] [float] NULL,
	[FeeReceiptNo] [ntext] NULL,
	[Amount] [float] NULL,
	[InwardDate] [datetime] NULL,
	[IsPaidAppealFee] [bit] NULL,
	[AppealInTime] [bit] NULL,
	[PaperFromTo] [nvarchar](25) NULL,
	[CourtFeeTicket] [bit] NULL,
	[AppealRemarks] [ntext] NULL,
	[AppealStatus] [char](10) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
	[WfInstanceId] [uniqueidentifier] NULL,
	[Info] [xml] NULL,
	[DocumentNo] [nvarchar](5) NULL,
	[OriginalSRO] [uniqueidentifier] NULL,
	[DocumentDate] [datetime] NULL,
 CONSTRAINT [PK_AppealApplication] PRIMARY KEY CLUSTERED 
(
	[AppealApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[EmployeeNo] [nvarchar](15) NULL,
	[FirstName] [nvarchar](25) NULL,
	[MiddleName] [nvarchar](25) NULL,
	[LastName] [nvarchar](25) NULL,
	[PostalAddress] [nvarchar](120) NULL,
	[PermanentAddress] [nvarchar](120) NULL,
	[DateOfBirth] [datetime] NULL,
	[FatherName] [nvarchar](50) NULL,
	[Height] [decimal](3, 2) NULL,
	[VisibleMarks] [nvarchar](120) NULL,
	[OfficeID] [uniqueidentifier] NULL,
	[DepartmentID] [uniqueidentifier] NULL,
	[DesignationID] [uniqueidentifier] NULL,
	[Salary] [money] NULL,
	[Allowances] [money] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdjudicationFeeDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdjudicationFeeDetails](
	[AdjudicationId] [uniqueidentifier] NOT NULL,
	[FeeId] [uniqueidentifier] NOT NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_AdjudicationFeeDetails] PRIMARY KEY CLUSTERED 
(
	[AdjudicationId] ASC,
	[FeeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationSheet]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationSheet](
	[AdjudicationId] [uniqueidentifier] NOT NULL,
	[ValuationFormId] [uniqueidentifier] NOT NULL,
	[DistrictCode] [int] NULL,
	[TalukaCode] [int] NULL,
	[VillageCode] [int] NULL,
	[SchemeType] [nvarchar](50) NULL,
	[EstimatedPrice] [money] NULL,
	[IsConstructedProperty] [bit] NULL,
	[SchemeNo] [nvarchar](25) NULL,
	[PlotNo] [nvarchar](50) NULL,
	[AreaOfPlot] [numeric](18, 2) NULL,
	[AreaOfConstruction] [numeric](18, 2) NULL,
	[TypeOfLand] [nvarchar](50) NULL,
	[InternalElectrificationRate] [numeric](18, 2) NULL,
	[DevelopmentRate] [numeric](18, 2) NULL,
	[OtherFeeRate] [numeric](18, 2) NULL,
	[SpecialDeductionRate] [numeric](18, 2) NULL,
	[YearOfConstruction] [int] NULL,
	[LiftExpense] [money] NULL,
	[LandRate] [money] NULL,
	[ValueOfLand] [money] NULL,
	[InternalElectrificationExpense] [money] NULL,
	[DevelopmentExpense] [money] NULL,
	[OtherFees] [money] NULL,
	[SpecialDeduction] [money] NULL,
	[ValuationDate] [datetime] NULL,
	[EstimatedPriceOfConstruction] [money] NULL,
	[LifeOfConstruction] [numeric](18, 2) NULL,
	[Depreciation] [money] NULL,
	[NetPrice] [money] NULL,
	[ValueOfConstruction] [money] NULL,
	[ValuationOfConstruction] [money] NULL,
	[StampDuty] [money] NULL,
	[StampDutyRate] [numeric](18, 2) NULL,
	[Remarks] [nvarchar](50) NULL,
 CONSTRAINT [PK_ValuationSheet] PRIMARY KEY CLUSTERED 
(
	[AdjudicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationForm]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ValuationForm](
	[ValuationFormId] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[RegistrationTypeId] [uniqueidentifier] NULL,
	[Village_CityName] [nvarchar](50) NULL,
	[TPSchemeNo] [nvarchar](20) NULL,
	[TPSchemeName] [nvarchar](50) NULL,
	[FinalPlotNo] [nvarchar](20) NULL,
	[CitySurveyNo] [nvarchar](20) NULL,
	[RevenueSurveyNo] [nvarchar](20) NULL,
	[Ward_SubWardNo] [nvarchar](20) NULL,
	[NameOfOwner] [nvarchar](50) NULL,
	[AddressOfOwner] [nvarchar](150) NULL,
	[NameOfClaimingParty] [nvarchar](50) NULL,
	[AddressOfClaimingParty] [nvarchar](150) NULL,
	[AreaOfPlot] [decimal](8, 2) NULL,
	[AreaOfConstruction] [decimal](8, 2) NULL,
	[YearOfConstruction] [int] NULL,
	[NoOfFloors] [smallint] NULL,
	[TypeOfProperty] [char](1) NULL,
	[HeightOfCeiling] [decimal](3, 2) NULL,
	[TypeOfTiles] [uniqueidentifier] NULL,
	[WallFurnishing] [nvarchar](50) NULL,
	[NoOfBathrooms] [smallint] NULL,
	[BathroomTilesHeight] [numeric](3, 2) NULL,
	[NoOfToilets] [smallint] NOT NULL,
	[ToiletTilesHeight] [numeric](3, 2) NULL,
	[Parking] [bit] NULL,
	[DescOfProperty] [nvarchar](150) NULL,
	[ShopsOnGroundFloor] [bit] NULL,
	[IsPropertyInCommercial] [bit] NULL,
	[TypeOfElectricfication] [uniqueidentifier] NULL,
	[CompoundWallType] [uniqueidentifier] NULL,
	[IsLightsOnCompoundWall] [bit] NULL,
	[WaterStorageFacility] [bit] NULL,
	[DrainageSystem] [bit] NULL,
	[NoOfLifts] [smallint] NULL,
	[AreaOfEachLift] [decimal](5, 2) NULL,
	[InternalRoad] [bit] NULL,
	[ValuatedBefore] [bit] NULL,
	[WorkFlowInstanceId] [uniqueidentifier] NULL,
	[WorkFlowTrace] [xml] NULL,
	[ValuationReport] [xml] NULL,
	[ValuationStatus] [int] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_ValuationForm] PRIMARY KEY CLUSTERED 
(
	[ValuationFormId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersInOfficeRoles]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInOfficeRoles](
	[Username] [nvarchar](25) NOT NULL,
	[DesignationID] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NOT NULL,
	[Comments] [ntext] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_UsersInOfficeRoles] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[DesignationID] ASC,
	[OfficeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostalStampPurchaseReq]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostalStampPurchaseReq](
	[PurRequestId] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[RequestDate] [datetime] NULL,
	[TotalValue] [money] NULL,
	[Status] [char](1) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_PostalStampPurchaseReq] PRIMARY KEY CLUSTERED 
(
	[PurRequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostalStampPurchaseReqDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalStampPurchaseReqDetails](
	[PurRequestId] [uniqueidentifier] NOT NULL,
	[StampDenomId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[Value] [money] NULL,
 CONSTRAINT [PK_PostalStampPurchaseReqDetails] PRIMARY KEY CLUSTERED 
(
	[PurRequestId] ASC,
	[StampDenomId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelephoneRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelephoneRegister](
	[TelephoneRegID] [uniqueidentifier] NOT NULL,
	[CallDate] [datetime] NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[CalledEmpID] [uniqueidentifier] NULL,
	[CalledPerson] [nvarchar](50) NULL,
	[DialledNo] [nvarchar](30) NULL,
	[Remarks] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_TelephoneRegister] PRIMARY KEY CLUSTERED 
(
	[TelephoneRegID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRegister](
	[ServiceID] [uniqueidentifier] NOT NULL,
	[ServiceNo] [nvarchar](50) NULL,
	[VendorID] [uniqueidentifier] NULL,
	[ServiceDate] [datetime] NULL,
	[InChargeEmpID] [uniqueidentifier] NULL,
	[InstrumentRepaired] [nvarchar](50) NULL,
	[Remarks] [nvarchar](150) NULL,
	[Status] [nchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_ServiceRegister] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RenewLicense]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RenewLicense](
	[RenewalId] [uniqueidentifier] NOT NULL,
	[LicenseApplicationId] [uniqueidentifier] NULL,
	[RenewApplicationDate] [datetime] NULL,
	[RenewedDate] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[Remarks] [nvarchar](50) NULL,
	[Status] [nchar](2) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_RenewLicense_1] PRIMARY KEY CLUSTERED 
(
	[RenewalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplainDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplainDetails](
	[ComplainId] [uniqueidentifier] NOT NULL,
	[ComplaintNo] [nvarchar](10) NULL,
	[ComplaintType] [uniqueidentifier] NULL,
	[AgainstEmpID] [uniqueidentifier] NULL,
	[ComplainingEmpID] [uniqueidentifier] NULL,
	[ComplainantName] [nvarchar](50) NULL,
	[ComplainantAddress] [nvarchar](150) NULL,
	[ComplaintDate] [datetime] NULL,
	[ReceivingOfficeId] [uniqueidentifier] NULL,
	[Subject] [nvarchar](250) NULL,
	[Detail] [nvarchar](500) NULL,
	[InvestigatingOfficer] [uniqueidentifier] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Report] [nvarchar](500) NULL,
	[Remarks] [nvarchar](150) NULL,
	[Status] [uniqueidentifier] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[WfInstanceId] [uniqueidentifier] NULL,
	[WfInfo] [xml] NULL,
 CONSTRAINT [PK_ComplainDetails_1] PRIMARY KEY CLUSTERED 
(
	[ComplainId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'External then Accept Complaint Name & Address/ Internal accept ComplainingEmpID / Department' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ComplainDetails', @level2type=N'COLUMN',@level2name=N'ComplaintType'
GO
/****** Object:  Table [dbo].[AppealHearing]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppealHearing](
	[HearingID] [uniqueidentifier] NOT NULL,
	[AppealApplicationId] [uniqueidentifier] NOT NULL,
	[HearingDate] [datetime] NULL,
	[Remarks] [ntext] NULL,
	[IsJudgement] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedAt] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedAt] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeQualifications]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeQualifications](
	[EmployeeQualiID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[QualificationID] [uniqueidentifier] NULL,
	[Details] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_EmployeeQualifications] PRIMARY KEY CLUSTERED 
(
	[EmployeeQualiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentChecklistTable]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentChecklistTable](
	[ValuationFormId] [uniqueidentifier] NOT NULL,
	[DocumentTypeId] [uniqueidentifier] NOT NULL,
	[Submitted] [bit] NULL,
	[NotApplicable] [bit] NULL,
	[DocumentNumber] [nvarchar](30) NULL,
	[Remarks] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_DocumentChecklistTable] PRIMARY KEY CLUSTERED 
(
	[ValuationFormId] ASC,
	[DocumentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppealActsApplicable]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppealActsApplicable](
	[AppealApplicationId] [uniqueidentifier] NOT NULL,
	[ActId] [uniqueidentifier] NOT NULL,
	[Checked] [bit] NULL,
	[Remarks] [nvarchar](150) NULL,
 CONSTRAINT [PK_AppealActsApplicable] PRIMARY KEY CLUSTERED 
(
	[AppealApplicationId] ASC,
	[ActId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseRegHeader]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseRegHeader](
	[PurchaseID] [uniqueidentifier] NOT NULL,
	[PurRequsitionNo] [nvarchar](50) NULL,
	[VendorID] [uniqueidentifier] NULL,
	[PurchaseDate] [datetime] NULL,
	[ReqByEmpID] [uniqueidentifier] NULL,
	[RequestDate] [datetime] NULL,
	[Status] [nchar](1) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_PurchaseRegHeader] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionYearlyScheduleMonthwise]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionYearlyScheduleMonthwise](
	[MonthlyScheduleId] [uniqueidentifier] NOT NULL,
	[DetailScheduleId] [uniqueidentifier] NOT NULL,
	[InspectingOfficeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_InspectionYeralyScheduleMonthwise] PRIMARY KEY CLUSTERED 
(
	[MonthlyScheduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputSheet]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputSheet](
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[RegistrationTypeId] [uniqueidentifier] NULL,
	[ValuationFormId] [uniqueidentifier] NULL,
	[FilePrefix] [nchar](4) NULL,
	[FileSlNo] [numeric](5, 0) NULL,
	[FileYear] [numeric](4, 0) NULL,
	[ApplnDate] [datetime] NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[ApplnAddress] [nvarchar](150) NULL,
	[PropertyValue] [money] NULL,
	[IsRented] [bit] NULL,
	[LeasePeriodFrom] [datetime] NULL,
	[LeasePeriodTo] [datetime] NULL,
	[DepositAmount] [money] NULL,
	[Tax] [money] NULL,
	[YearlyRent] [money] NULL,
	[StampDutyUsed] [money] NULL,
	[Status] [nchar](2) NULL,
	[AddlnInfo] [xml] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_InputSheet] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseMaster]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseMaster](
	[LicenseApplicationId] [uniqueidentifier] NOT NULL,
	[LicenseNo] [nvarchar](25) NULL,
	[IssuedDate] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[IsCancelled] [bit] NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[CancelledBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_LicenseMaster_1] PRIMARY KEY CLUSTERED 
(
	[LicenseApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRegister]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRegister](
	[LeaveRegID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NULL,
	[ApplnDate] [datetime] NULL,
	[ApplicableRules] [nvarchar](150) NULL,
	[LeaveType] [uniqueidentifier] NULL,
	[LeaveFrom] [datetime] NULL,
	[LeaveTo] [datetime] NULL,
	[WorkingDays] [decimal](2, 1) NULL,
	[Reason] [nvarchar](150) NULL,
	[ResumedDutyOn] [datetime] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_LeaveRegister] PRIMARY KEY CLUSTERED 
(
	[LeaveRegID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investigation]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investigation](
	[InvestigationID] [uniqueidentifier] NOT NULL,
	[ComplainId] [uniqueidentifier] NOT NULL,
	[InvDate] [datetime] NULL,
	[InvDetails] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Investigation] PRIMARY KEY CLUSTERED 
(
	[InvestigationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionDetails](
	[InspectionId] [uniqueidentifier] NOT NULL,
	[InspectionTypeId] [uniqueidentifier] NULL,
	[InspectingOfficerId] [uniqueidentifier] NULL,
	[InspectedOfficeId] [uniqueidentifier] NULL,
	[LicenseId] [uniqueidentifier] NULL,
	[InspectorOfficeName] [nvarchar](50) NULL,
	[IsDiscrepancyFound] [bit] NULL,
	[Remarks] [ntext] NULL,
	[InspectionOfficeSI] [uniqueidentifier] NULL,
	[InspectorDCName] [nchar](10) NULL,
	[InspectionSIJoiningDate] [datetime] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionDetails] PRIMARY KEY CLUSTERED 
(
	[InspectionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inspecting Officer Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InspectionDetails', @level2type=N'COLUMN',@level2name=N'InspectingOfficerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Office Inspected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InspectionDetails', @level2type=N'COLUMN',@level2name=N'InspectedOfficeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inspecting Officer Office Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InspectionDetails', @level2type=N'COLUMN',@level2name=N'InspectorOfficeName'
GO
/****** Object:  Table [dbo].[PurchaseRegDetail]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseRegDetail](
	[DetailID] [uniqueidentifier] NOT NULL,
	[PurchaseID] [uniqueidentifier] NULL,
	[ItemID] [uniqueidentifier] NULL,
	[PackType] [nchar](1) NULL,
	[Quantity] [decimal](3, 2) NULL,
	[Price] [money] NULL,
	[Value] [money] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_PurchaseRegDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefundApplication]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RefundApplication](
	[RefundApplicationId] [uniqueidentifier] NOT NULL,
	[OfficeId] [uniqueidentifier] NULL,
	[RegistrationNo] [uniqueidentifier] NULL,
	[RefundPrefix] [nchar](4) NULL,
	[RefundSlNo] [numeric](5, 0) NULL,
	[RefundYear] [numeric](4, 0) NULL,
	[TypeOfRefund] [char](1) NULL,
	[ApplicationDate] [datetime] NULL,
	[VendorLicenseId] [uniqueidentifier] NULL,
	[PurchasedDate] [datetime] NULL,
	[TotalValueOfStamps] [ntext] NULL,
	[ReasonForNotUsing] [nvarchar](250) NULL,
	[ApplicantName] [nvarchar](50) NULL,
	[ApplicantAddress] [nvarchar](150) NULL,
	[City] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[PinCode] [nvarchar](7) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Remarks] [nvarchar](250) NULL,
	[Status] [nchar](2) NULL,
	[PenaltyAmount] [decimal](18, 0) NULL,
	[RefundAmount] [decimal](18, 0) NULL,
	[RefundOrderId] [nvarchar](50) NULL,
	[DateOfOrder] [datetime] NULL,
	[Info] [xml] NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
	[WfInstanceId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_RefundApplication_1] PRIMARY KEY CLUSTERED 
(
	[RefundApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistrationPartyDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistrationPartyDetails](
	[PartyID] [uniqueidentifier] NOT NULL,
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[PartyType] [char](1) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Age] [decimal](3, 0) NULL,
	[Gender] [char](1) NULL,
	[Religion] [uniqueidentifier] NULL,
	[Occupation] [nvarchar](50) NULL,
	[PAN] [nvarchar](50) NULL,
	[info] [xml] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_RegistrationPartyDetails] PRIMARY KEY CLUSTERED 
(
	[PartyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RefundStampDetails]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefundStampDetails](
	[RefundApplicationId] [uniqueidentifier] NOT NULL,
	[RevenueStampId] [uniqueidentifier] NOT NULL,
	[ReturnedQty] [nchar](10) NULL,
	[StampNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_RefundStampDetails] PRIMARY KEY CLUSTERED 
(
	[RefundApplicationId] ASC,
	[RevenueStampId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefundActsApplicable]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefundActsApplicable](
	[RefundApplicationId] [uniqueidentifier] NOT NULL,
	[ActId] [uniqueidentifier] NOT NULL,
	[Checked] [bit] NULL,
	[Remarks] [nvarchar](150) NULL,
 CONSTRAINT [PK_RefundActApplicable] PRIMARY KEY CLUSTERED 
(
	[RefundApplicationId] ASC,
	[ActId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionQueries]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionQueries](
	[QueryId] [uniqueidentifier] NOT NULL,
	[InspectionId] [uniqueidentifier] NULL,
	[CheckListId] [uniqueidentifier] NULL,
	[Query] [nvarchar](750) NULL,
	[Received] [bit] NULL,
	[Remarks] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [nvarchar](25) NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_InspectionQueries] PRIMARY KEY CLUSTERED 
(
	[QueryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckListInspection]    Script Date: 10/10/2012 22:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckListInspection](
	[InspectionId] [uniqueidentifier] NOT NULL,
	[InspectionCheckListId] [uniqueidentifier] NOT NULL,
	[Checked] [bit] NULL,
	[Remarks] [nvarchar](150) NULL,
	[CreatedBy] [nvarchar](25) NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedBy] [nvarchar](25) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_CheckListInspection_1] PRIMARY KEY CLUSTERED 
(
	[InspectionId] ASC,
	[InspectionCheckListId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_AdjudicationRequest_PhysicalVerification]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AdjudicationRequest] ADD  CONSTRAINT [DF_AdjudicationRequest_PhysicalVerification]  DEFAULT ((0)) FOR [PhysicalVerification]
GO
/****** Object:  Default [DF_FileManagementMaster_FileSerialNo]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[FileManagementMaster] ADD  CONSTRAINT [DF_FileManagementMaster_FileSerialNo]  DEFAULT ((0)) FOR [FileSerialNo]
GO
/****** Object:  Default [DF_InspectionCheckListMaster_IsActive]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionCheckListMaster] ADD  CONSTRAINT [DF_InspectionCheckListMaster_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
/****** Object:  Default [DF_LicenseMaster_IsCancelled]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[LicenseMaster] ADD  CONSTRAINT [DF_LicenseMaster_IsCancelled]  DEFAULT ((0)) FOR [IsCancelled]
GO
/****** Object:  Default [DF_Offices_IsDeleted]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[Offices] ADD  CONSTRAINT [DF_Offices_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  ForeignKey [FK_AdjudicationFeeDetails_AdjudicationRequest]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AdjudicationFeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdjudicationFeeDetails_AdjudicationRequest] FOREIGN KEY([AdjudicationId])
REFERENCES [dbo].[AdjudicationRequest] ([AdjudicationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdjudicationFeeDetails] CHECK CONSTRAINT [FK_AdjudicationFeeDetails_AdjudicationRequest]
GO
/****** Object:  ForeignKey [FK_AdjudicationFeeDetails_FeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AdjudicationFeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_AdjudicationFeeDetails_FeeMaster] FOREIGN KEY([FeeId])
REFERENCES [dbo].[FeeMaster] ([FeeId])
GO
ALTER TABLE [dbo].[AdjudicationFeeDetails] CHECK CONSTRAINT [FK_AdjudicationFeeDetails_FeeMaster]
GO
/****** Object:  ForeignKey [FK_AppealActsApplicable_ActMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AppealActsApplicable]  WITH CHECK ADD  CONSTRAINT [FK_AppealActsApplicable_ActMaster] FOREIGN KEY([ActId])
REFERENCES [dbo].[ActMaster] ([ActId])
GO
ALTER TABLE [dbo].[AppealActsApplicable] CHECK CONSTRAINT [FK_AppealActsApplicable_ActMaster]
GO
/****** Object:  ForeignKey [FK_AppealActsApplicable_AppealApplication]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AppealActsApplicable]  WITH CHECK ADD  CONSTRAINT [FK_AppealActsApplicable_AppealApplication] FOREIGN KEY([AppealApplicationId])
REFERENCES [dbo].[AppealApplication] ([AppealApplicationId])
GO
ALTER TABLE [dbo].[AppealActsApplicable] CHECK CONSTRAINT [FK_AppealActsApplicable_AppealApplication]
GO
/****** Object:  ForeignKey [FK_AppealApplication_AppealTypeMaster1]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AppealApplication]  WITH CHECK ADD  CONSTRAINT [FK_AppealApplication_AppealTypeMaster1] FOREIGN KEY([TypeOfAppeal])
REFERENCES [dbo].[AppealTypeMaster] ([AppealTypeId])
GO
ALTER TABLE [dbo].[AppealApplication] CHECK CONSTRAINT [FK_AppealApplication_AppealTypeMaster1]
GO
/****** Object:  ForeignKey [FK_AppealApplication_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AppealApplication]  WITH CHECK ADD  CONSTRAINT [FK_AppealApplication_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[AppealApplication] CHECK CONSTRAINT [FK_AppealApplication_Offices]
GO
/****** Object:  ForeignKey [FK_AppealHearing_AppealApplication]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[AppealHearing]  WITH CHECK ADD  CONSTRAINT [FK_AppealHearing_AppealApplication] FOREIGN KEY([AppealApplicationId])
REFERENCES [dbo].[AppealApplication] ([AppealApplicationId])
GO
ALTER TABLE [dbo].[AppealHearing] CHECK CONSTRAINT [FK_AppealHearing_AppealApplication]
GO
/****** Object:  ForeignKey [FK_CheckListInspection_InspectionCheckListMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[CheckListInspection]  WITH CHECK ADD  CONSTRAINT [FK_CheckListInspection_InspectionCheckListMaster] FOREIGN KEY([InspectionCheckListId])
REFERENCES [dbo].[InspectionCheckListMaster] ([CheckListId])
GO
ALTER TABLE [dbo].[CheckListInspection] CHECK CONSTRAINT [FK_CheckListInspection_InspectionCheckListMaster]
GO
/****** Object:  ForeignKey [FK_CheckListInspection_InspectionDetails]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[CheckListInspection]  WITH CHECK ADD  CONSTRAINT [FK_CheckListInspection_InspectionDetails] FOREIGN KEY([InspectionId])
REFERENCES [dbo].[InspectionDetails] ([InspectionId])
GO
ALTER TABLE [dbo].[CheckListInspection] CHECK CONSTRAINT [FK_CheckListInspection_InspectionDetails]
GO
/****** Object:  ForeignKey [FK_ComplainDetails_EmployeeMaster3]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ComplainDetails]  WITH CHECK ADD  CONSTRAINT [FK_ComplainDetails_EmployeeMaster3] FOREIGN KEY([InvestigatingOfficer])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[ComplainDetails] CHECK CONSTRAINT [FK_ComplainDetails_EmployeeMaster3]
GO
/****** Object:  ForeignKey [FK_ComplainDetails_EmployeeMaster5]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ComplainDetails]  WITH CHECK ADD  CONSTRAINT [FK_ComplainDetails_EmployeeMaster5] FOREIGN KEY([AgainstEmpID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[ComplainDetails] CHECK CONSTRAINT [FK_ComplainDetails_EmployeeMaster5]
GO
/****** Object:  ForeignKey [FK_ComplainDetails_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ComplainDetails]  WITH CHECK ADD  CONSTRAINT [FK_ComplainDetails_Offices] FOREIGN KEY([ReceivingOfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[ComplainDetails] CHECK CONSTRAINT [FK_ComplainDetails_Offices]
GO
/****** Object:  ForeignKey [FK_Document_RegTypeMapingMaster_DocumentMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[Document_RegTypeMapingMaster]  WITH CHECK ADD  CONSTRAINT [FK_Document_RegTypeMapingMaster_DocumentMaster] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentMaster] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Document_RegTypeMapingMaster] CHECK CONSTRAINT [FK_Document_RegTypeMapingMaster_DocumentMaster]
GO
/****** Object:  ForeignKey [FK_Document_RegTypeMapingMaster_RegistrationType_LKP]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[Document_RegTypeMapingMaster]  WITH CHECK ADD  CONSTRAINT [FK_Document_RegTypeMapingMaster_RegistrationType_LKP] FOREIGN KEY([RegistrationTypeId])
REFERENCES [dbo].[RegistrationType_LKP] ([RegistrationTypeId])
GO
ALTER TABLE [dbo].[Document_RegTypeMapingMaster] CHECK CONSTRAINT [FK_Document_RegTypeMapingMaster_RegistrationType_LKP]
GO
/****** Object:  ForeignKey [FK_DocumentChecklistTable_DocumentMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[DocumentChecklistTable]  WITH CHECK ADD  CONSTRAINT [FK_DocumentChecklistTable_DocumentMaster] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentMaster] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[DocumentChecklistTable] CHECK CONSTRAINT [FK_DocumentChecklistTable_DocumentMaster]
GO
/****** Object:  ForeignKey [FK_DocumentChecklistTable_ValuationForm]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[DocumentChecklistTable]  WITH CHECK ADD  CONSTRAINT [FK_DocumentChecklistTable_ValuationForm] FOREIGN KEY([ValuationFormId])
REFERENCES [dbo].[ValuationForm] ([ValuationFormId])
GO
ALTER TABLE [dbo].[DocumentChecklistTable] CHECK CONSTRAINT [FK_DocumentChecklistTable_ValuationForm]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_DepartmentMaster1]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_DepartmentMaster1] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DepartmentMaster] ([DepartmentID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_DepartmentMaster1]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_DesignationMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_DesignationMaster] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[DesignationMaster] ([DesignationID])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_DesignationMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeMaster_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_Offices]
GO
/****** Object:  ForeignKey [FK_EmployeeQualifications_EmployeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[EmployeeQualifications]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualifications_EmployeeMaster] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeQualifications] CHECK CONSTRAINT [FK_EmployeeQualifications_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_EmployeeQualifications_QualificationMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[EmployeeQualifications]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeQualifications_QualificationMaster] FOREIGN KEY([QualificationID])
REFERENCES [dbo].[QualificationMaster] ([QualificationID])
GO
ALTER TABLE [dbo].[EmployeeQualifications] CHECK CONSTRAINT [FK_EmployeeQualifications_QualificationMaster]
GO
/****** Object:  ForeignKey [FK_InputSheet_ValuationForm]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InputSheet]  WITH CHECK ADD  CONSTRAINT [FK_InputSheet_ValuationForm] FOREIGN KEY([ValuationFormId])
REFERENCES [dbo].[ValuationForm] ([ValuationFormId])
GO
ALTER TABLE [dbo].[InputSheet] CHECK CONSTRAINT [FK_InputSheet_ValuationForm]
GO
/****** Object:  ForeignKey [FK_InspectionCheckListMaster_InspectionTypeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionCheckListMaster]  WITH CHECK ADD  CONSTRAINT [FK_InspectionCheckListMaster_InspectionTypeMaster] FOREIGN KEY([InspectionTypeId])
REFERENCES [dbo].[InspectionTypeMaster] ([InspectionTypeId])
GO
ALTER TABLE [dbo].[InspectionCheckListMaster] CHECK CONSTRAINT [FK_InspectionCheckListMaster_InspectionTypeMaster]
GO
/****** Object:  ForeignKey [FK_InspectionDetails_InspectionTypeMaster1]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionDetails]  WITH CHECK ADD  CONSTRAINT [FK_InspectionDetails_InspectionTypeMaster1] FOREIGN KEY([InspectionTypeId])
REFERENCES [dbo].[InspectionTypeMaster] ([InspectionTypeId])
GO
ALTER TABLE [dbo].[InspectionDetails] CHECK CONSTRAINT [FK_InspectionDetails_InspectionTypeMaster1]
GO
/****** Object:  ForeignKey [FK_InspectionDetails_LicenseMaster1]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionDetails]  WITH CHECK ADD  CONSTRAINT [FK_InspectionDetails_LicenseMaster1] FOREIGN KEY([LicenseId])
REFERENCES [dbo].[LicenseMaster] ([LicenseApplicationId])
GO
ALTER TABLE [dbo].[InspectionDetails] CHECK CONSTRAINT [FK_InspectionDetails_LicenseMaster1]
GO
/****** Object:  ForeignKey [FK_InspectionDetails_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionDetails]  WITH CHECK ADD  CONSTRAINT [FK_InspectionDetails_Offices] FOREIGN KEY([InspectedOfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[InspectionDetails] CHECK CONSTRAINT [FK_InspectionDetails_Offices]
GO
/****** Object:  ForeignKey [FK_InspectionItenary_InspectionYearlyShedule]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionItenary]  WITH CHECK ADD  CONSTRAINT [FK_InspectionItenary_InspectionYearlyShedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[InspectionYearlyShedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[InspectionItenary] CHECK CONSTRAINT [FK_InspectionItenary_InspectionYearlyShedule]
GO
/****** Object:  ForeignKey [FK_InspectionQueries_InspectionDetails]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionQueries]  WITH CHECK ADD  CONSTRAINT [FK_InspectionQueries_InspectionDetails] FOREIGN KEY([InspectionId])
REFERENCES [dbo].[InspectionDetails] ([InspectionId])
GO
ALTER TABLE [dbo].[InspectionQueries] CHECK CONSTRAINT [FK_InspectionQueries_InspectionDetails]
GO
/****** Object:  ForeignKey [FK_InspectionYearlyScheduleDetail_InspectionYearlyShedule]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionYearlyScheduleDetail]  WITH CHECK ADD  CONSTRAINT [FK_InspectionYearlyScheduleDetail_InspectionYearlyShedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[InspectionYearlyShedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[InspectionYearlyScheduleDetail] CHECK CONSTRAINT [FK_InspectionYearlyScheduleDetail_InspectionYearlyShedule]
GO
/****** Object:  ForeignKey [FK_InspectionYearlyScheduleMonthwise_InspectionYearlyScheduleDetail]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[InspectionYearlyScheduleMonthwise]  WITH CHECK ADD  CONSTRAINT [FK_InspectionYearlyScheduleMonthwise_InspectionYearlyScheduleDetail] FOREIGN KEY([DetailScheduleId])
REFERENCES [dbo].[InspectionYearlyScheduleDetail] ([DetailScheduleId])
GO
ALTER TABLE [dbo].[InspectionYearlyScheduleMonthwise] CHECK CONSTRAINT [FK_InspectionYearlyScheduleMonthwise_InspectionYearlyScheduleDetail]
GO
/****** Object:  ForeignKey [FK_Investigation_ComplainDetails]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[Investigation]  WITH CHECK ADD  CONSTRAINT [FK_Investigation_ComplainDetails] FOREIGN KEY([ComplainId])
REFERENCES [dbo].[ComplainDetails] ([ComplainId])
GO
ALTER TABLE [dbo].[Investigation] CHECK CONSTRAINT [FK_Investigation_ComplainDetails]
GO
/****** Object:  ForeignKey [FK_Inward_OutwardRegister_DocumentMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[Inward_OutwardRegister]  WITH CHECK ADD  CONSTRAINT [FK_Inward_OutwardRegister_DocumentMaster] FOREIGN KEY([DocType])
REFERENCES [dbo].[DocumentMaster] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Inward_OutwardRegister] CHECK CONSTRAINT [FK_Inward_OutwardRegister_DocumentMaster]
GO
/****** Object:  ForeignKey [FK_Inward_OutwardRegister_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[Inward_OutwardRegister]  WITH CHECK ADD  CONSTRAINT [FK_Inward_OutwardRegister_Offices] FOREIGN KEY([SentOfficeID])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[Inward_OutwardRegister] CHECK CONSTRAINT [FK_Inward_OutwardRegister_Offices]
GO
/****** Object:  ForeignKey [FK_ItemMaster_UOMMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_ItemMaster_UOMMaster] FOREIGN KEY([UomID])
REFERENCES [dbo].[UOMMaster] ([UomID])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_ItemMaster_UOMMaster]
GO
/****** Object:  ForeignKey [FK_LeaveRegister_EmployeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[LeaveRegister]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRegister_EmployeeMaster] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[LeaveRegister] CHECK CONSTRAINT [FK_LeaveRegister_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_LicenseApplication_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[LicenseApplication]  WITH CHECK ADD  CONSTRAINT [FK_LicenseApplication_Offices] FOREIGN KEY([SubmissionOfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[LicenseApplication] CHECK CONSTRAINT [FK_LicenseApplication_Offices]
GO
/****** Object:  ForeignKey [FK_LicenseMaster_LicenseApplication]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[LicenseMaster]  WITH CHECK ADD  CONSTRAINT [FK_LicenseMaster_LicenseApplication] FOREIGN KEY([LicenseApplicationId])
REFERENCES [dbo].[LicenseApplication] ([LicenseApplicationId])
GO
ALTER TABLE [dbo].[LicenseMaster] CHECK CONSTRAINT [FK_LicenseMaster_LicenseApplication]
GO
/****** Object:  ForeignKey [FK_NoticeDetails_NoticeType_LKP]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[NoticeDetails]  WITH CHECK ADD  CONSTRAINT [FK_NoticeDetails_NoticeType_LKP] FOREIGN KEY([NoticeTypeId])
REFERENCES [dbo].[DEL_NoticeType_LKP] ([NoticeTypeId])
GO
ALTER TABLE [dbo].[NoticeDetails] CHECK CONSTRAINT [FK_NoticeDetails_NoticeType_LKP]
GO
/****** Object:  ForeignKey [FK_OfficeProcess_LKP_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[OfficeProcess_LKP]  WITH CHECK ADD  CONSTRAINT [FK_OfficeProcess_LKP_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[OfficeProcess_LKP] CHECK CONSTRAINT [FK_OfficeProcess_LKP_Offices]
GO
/****** Object:  ForeignKey [FK_OfficesCommunication_LKP_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[OfficesCommunication_LKP]  WITH CHECK ADD  CONSTRAINT [FK_OfficesCommunication_LKP_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[OfficesCommunication_LKP] CHECK CONSTRAINT [FK_OfficesCommunication_LKP_Offices]
GO
/****** Object:  ForeignKey [FK_PostalStampDayStock_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PostalStampDayStock]  WITH CHECK ADD  CONSTRAINT [FK_PostalStampDayStock_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[PostalStampDayStock] CHECK CONSTRAINT [FK_PostalStampDayStock_Offices]
GO
/****** Object:  ForeignKey [FK_PostalStampPurchaseReq_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PostalStampPurchaseReq]  WITH CHECK ADD  CONSTRAINT [FK_PostalStampPurchaseReq_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[PostalStampPurchaseReq] CHECK CONSTRAINT [FK_PostalStampPurchaseReq_Offices]
GO
/****** Object:  ForeignKey [FK_PostalStampPurchaseReqDetails_PostalStampDenomMaster1]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PostalStampPurchaseReqDetails]  WITH CHECK ADD  CONSTRAINT [FK_PostalStampPurchaseReqDetails_PostalStampDenomMaster1] FOREIGN KEY([StampDenomId])
REFERENCES [dbo].[PostalStampDenomMaster] ([StampDenomId])
GO
ALTER TABLE [dbo].[PostalStampPurchaseReqDetails] CHECK CONSTRAINT [FK_PostalStampPurchaseReqDetails_PostalStampDenomMaster1]
GO
/****** Object:  ForeignKey [FK_PostalStampPurchaseReqDetails_PostalStampPurchaseReq]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PostalStampPurchaseReqDetails]  WITH CHECK ADD  CONSTRAINT [FK_PostalStampPurchaseReqDetails_PostalStampPurchaseReq] FOREIGN KEY([PurRequestId])
REFERENCES [dbo].[PostalStampPurchaseReq] ([PurRequestId])
GO
ALTER TABLE [dbo].[PostalStampPurchaseReqDetails] CHECK CONSTRAINT [FK_PostalStampPurchaseReqDetails_PostalStampPurchaseReq]
GO
/****** Object:  ForeignKey [FK_PurchaseRegDetail_ItemMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PurchaseRegDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseRegDetail_ItemMaster] FOREIGN KEY([ItemID])
REFERENCES [dbo].[ItemMaster] ([ItemID])
GO
ALTER TABLE [dbo].[PurchaseRegDetail] CHECK CONSTRAINT [FK_PurchaseRegDetail_ItemMaster]
GO
/****** Object:  ForeignKey [FK_PurchaseRegDetail_PurchaseRegHeader]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PurchaseRegDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseRegDetail_PurchaseRegHeader] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[PurchaseRegHeader] ([PurchaseID])
GO
ALTER TABLE [dbo].[PurchaseRegDetail] CHECK CONSTRAINT [FK_PurchaseRegDetail_PurchaseRegHeader]
GO
/****** Object:  ForeignKey [FK_PurchaseRegHeader_EmployeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PurchaseRegHeader]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseRegHeader_EmployeeMaster] FOREIGN KEY([ReqByEmpID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[PurchaseRegHeader] CHECK CONSTRAINT [FK_PurchaseRegHeader_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_PurchaseRegHeader_VendorMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[PurchaseRegHeader]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseRegHeader_VendorMaster] FOREIGN KEY([VendorID])
REFERENCES [dbo].[VendorMaster] ([VendorID])
GO
ALTER TABLE [dbo].[PurchaseRegHeader] CHECK CONSTRAINT [FK_PurchaseRegHeader_VendorMaster]
GO
/****** Object:  ForeignKey [FK_RefundActApplicable_ActMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RefundActsApplicable]  WITH CHECK ADD  CONSTRAINT [FK_RefundActApplicable_ActMaster] FOREIGN KEY([ActId])
REFERENCES [dbo].[ActMaster] ([ActId])
GO
ALTER TABLE [dbo].[RefundActsApplicable] CHECK CONSTRAINT [FK_RefundActApplicable_ActMaster]
GO
/****** Object:  ForeignKey [FK_RefundActApplicable_RefundApplication]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RefundActsApplicable]  WITH CHECK ADD  CONSTRAINT [FK_RefundActApplicable_RefundApplication] FOREIGN KEY([RefundApplicationId])
REFERENCES [dbo].[RefundApplication] ([RefundApplicationId])
GO
ALTER TABLE [dbo].[RefundActsApplicable] CHECK CONSTRAINT [FK_RefundActApplicable_RefundApplication]
GO
/****** Object:  ForeignKey [FK_RefundApplication_LicenseMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RefundApplication]  WITH CHECK ADD  CONSTRAINT [FK_RefundApplication_LicenseMaster] FOREIGN KEY([VendorLicenseId])
REFERENCES [dbo].[LicenseMaster] ([LicenseApplicationId])
GO
ALTER TABLE [dbo].[RefundApplication] CHECK CONSTRAINT [FK_RefundApplication_LicenseMaster]
GO
/****** Object:  ForeignKey [FK_RefundStampDetails_RefundApplication]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RefundStampDetails]  WITH CHECK ADD  CONSTRAINT [FK_RefundStampDetails_RefundApplication] FOREIGN KEY([RefundApplicationId])
REFERENCES [dbo].[RefundApplication] ([RefundApplicationId])
GO
ALTER TABLE [dbo].[RefundStampDetails] CHECK CONSTRAINT [FK_RefundStampDetails_RefundApplication]
GO
/****** Object:  ForeignKey [FK_RefundStampDetails_RevenueStampMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RefundStampDetails]  WITH CHECK ADD  CONSTRAINT [FK_RefundStampDetails_RevenueStampMaster] FOREIGN KEY([RevenueStampId])
REFERENCES [dbo].[RevenueStampMaster] ([RevenueStampId])
GO
ALTER TABLE [dbo].[RefundStampDetails] CHECK CONSTRAINT [FK_RefundStampDetails_RevenueStampMaster]
GO
/****** Object:  ForeignKey [FK_RegistrationPartyDetails_InputSheet]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RegistrationPartyDetails]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationPartyDetails_InputSheet] FOREIGN KEY([RegistrationId])
REFERENCES [dbo].[InputSheet] ([RegistrationId])
GO
ALTER TABLE [dbo].[RegistrationPartyDetails] CHECK CONSTRAINT [FK_RegistrationPartyDetails_InputSheet]
GO
/****** Object:  ForeignKey [FK_RenewLicense_LicenseApplication]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[RenewLicense]  WITH CHECK ADD  CONSTRAINT [FK_RenewLicense_LicenseApplication] FOREIGN KEY([LicenseApplicationId])
REFERENCES [dbo].[LicenseApplication] ([LicenseApplicationId])
GO
ALTER TABLE [dbo].[RenewLicense] CHECK CONSTRAINT [FK_RenewLicense_LicenseApplication]
GO
/****** Object:  ForeignKey [FK_ServiceRegister_EmployeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ServiceRegister]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRegister_EmployeeMaster] FOREIGN KEY([InChargeEmpID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[ServiceRegister] CHECK CONSTRAINT [FK_ServiceRegister_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_ServiceRegister_VendorMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ServiceRegister]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRegister_VendorMaster] FOREIGN KEY([VendorID])
REFERENCES [dbo].[VendorMaster] ([VendorID])
GO
ALTER TABLE [dbo].[ServiceRegister] CHECK CONSTRAINT [FK_ServiceRegister_VendorMaster]
GO
/****** Object:  ForeignKey [FK_TelephoneRegister_EmployeeMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[TelephoneRegister]  WITH CHECK ADD  CONSTRAINT [FK_TelephoneRegister_EmployeeMaster] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[TelephoneRegister] CHECK CONSTRAINT [FK_TelephoneRegister_EmployeeMaster]
GO
/****** Object:  ForeignKey [FK_TelephoneRegister_EmployeeMaster1]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[TelephoneRegister]  WITH CHECK ADD  CONSTRAINT [FK_TelephoneRegister_EmployeeMaster1] FOREIGN KEY([CalledEmpID])
REFERENCES [dbo].[EmployeeMaster] ([EmployeeID])
GO
ALTER TABLE [dbo].[TelephoneRegister] CHECK CONSTRAINT [FK_TelephoneRegister_EmployeeMaster1]
GO
/****** Object:  ForeignKey [FK_Igrss_UsersInRole_Igrss_Offices]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[UsersInOfficeRoles]  WITH CHECK ADD  CONSTRAINT [FK_Igrss_UsersInRole_Igrss_Offices] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Offices] ([OfficeId])
GO
ALTER TABLE [dbo].[UsersInOfficeRoles] CHECK CONSTRAINT [FK_Igrss_UsersInRole_Igrss_Offices]
GO
/****** Object:  ForeignKey [FK_UsersInOfficeRoles_DesignationMaster]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[UsersInOfficeRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersInOfficeRoles_DesignationMaster] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[DesignationMaster] ([DesignationID])
GO
ALTER TABLE [dbo].[UsersInOfficeRoles] CHECK CONSTRAINT [FK_UsersInOfficeRoles_DesignationMaster]
GO
/****** Object:  ForeignKey [FK_ValuationForm_RegistrationType_LKP]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ValuationForm]  WITH CHECK ADD  CONSTRAINT [FK_ValuationForm_RegistrationType_LKP] FOREIGN KEY([RegistrationTypeId])
REFERENCES [dbo].[RegistrationType_LKP] ([RegistrationTypeId])
GO
ALTER TABLE [dbo].[ValuationForm] CHECK CONSTRAINT [FK_ValuationForm_RegistrationType_LKP]
GO
/****** Object:  ForeignKey [FK_ValuationSheet_AdjudicationRequest]    Script Date: 10/10/2012 22:27:16 ******/
ALTER TABLE [dbo].[ValuationSheet]  WITH CHECK ADD  CONSTRAINT [FK_ValuationSheet_AdjudicationRequest] FOREIGN KEY([AdjudicationId])
REFERENCES [dbo].[AdjudicationRequest] ([AdjudicationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ValuationSheet] CHECK CONSTRAINT [FK_ValuationSheet_AdjudicationRequest]
GO
