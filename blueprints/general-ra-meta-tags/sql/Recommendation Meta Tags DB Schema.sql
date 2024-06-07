/****** Object:  Table [dbo].[RACodes]    Script Date: 5/24/2024 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RACodes](
	[Code] [nvarchar](50) NOT NULL,
	[Label] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Label] UNIQUE NONCLUSTERED 
(
	[Label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RACodeValues]    Script Date: 5/24/2024 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RACodeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Value] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_RACodeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_CodeValue] UNIQUE NONCLUSTERED 
(
	[Code] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RARecommendation]    Script Date: 5/24/2024 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RARecommendation](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RARecommendationData]    Script Date: 5/24/2024 1:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RARecommendationData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecommendationId] [int] NULL,
	[RCodeValueId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_RARecommendationData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RACodeValues] ADD  CONSTRAINT [DF_RACodeValues_isActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RARecommendation] ADD  CONSTRAINT [DF_isActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RARecommendationData] ADD  CONSTRAINT [DF_RARecommendationData_isActive_1]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RACodeValues]  WITH CHECK ADD  CONSTRAINT [FK_RACodeValues_RACodes] FOREIGN KEY([Code])
REFERENCES [dbo].[RACodes] ([Code])
GO
ALTER TABLE [dbo].[RACodeValues] CHECK CONSTRAINT [FK_RACodeValues_RACodes]
GO
ALTER TABLE [dbo].[RARecommendationData]  WITH CHECK ADD  CONSTRAINT [FK_RARecommendationData_RACodeValues] FOREIGN KEY([RCodeValueId])
REFERENCES [dbo].[RACodeValues] ([Id])
GO
ALTER TABLE [dbo].[RARecommendationData] CHECK CONSTRAINT [FK_RARecommendationData_RACodeValues]
GO
ALTER TABLE [dbo].[RARecommendationData]  WITH CHECK ADD  CONSTRAINT [FK_RARecommendationData_RARecommendation] FOREIGN KEY([RecommendationId])
REFERENCES [dbo].[RARecommendation] ([Id])
GO
ALTER TABLE [dbo].[RARecommendationData] CHECK CONSTRAINT [FK_RARecommendationData_RARecommendation]
GO
