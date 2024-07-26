/****** Cannot script Unresolved Entities : Server[@Name='xcs-dev-sqlserver-a43zk3ahnzkrm']/Database[@Name='MD']/UnresolvedEntity[@Name='inserted'] ******/
GO
/****** Object:  Table [dbo].[MetaTag]    Script Date: 6/26/2024 11:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetaTag]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetaTag](
	[MetaTag] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MetaTagType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_MetaTag] UNIQUE NONCLUSTERED 
(
	[MetaTag] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MetaTagType]    Script Date: 6/26/2024 11:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetaTagType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetaTagType](
	[MetaTagType] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MetaTagValue]    Script Date: 6/26/2024 11:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetaTagValue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetaTagValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MetaTagID] [int] NULL,
	[MetaTagValue] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MetaTagLabel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_MetaTagLabel] UNIQUE NONCLUSTERED 
(
	[MetaTagID] ASC,
	[MetaTagValue] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RecommendationMaster]    Script Date: 6/26/2024 11:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RecommendationMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RecommendationMaster](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RecommendationMetaTagMapping]    Script Date: 6/26/2024 11:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RecommendationMetaTagMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RecommendationMetaTagMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecommendationId] [int] NULL,
	[MetaTagValueId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_RecommendationData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AA_MetaTagLabel_isActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MetaTagValue] ADD  CONSTRAINT [DF_AA_MetaTagLabel_isActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_isActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RecommendationMaster] ADD  CONSTRAINT [DF_isActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RARecommendationData_isActive_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RecommendationMetaTagMapping] ADD  CONSTRAINT [DF_RARecommendationData_isActive_1]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetaTagValue_MetaTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetaTagValue]'))
ALTER TABLE [dbo].[MetaTagValue]  WITH NOCHECK ADD  CONSTRAINT [FK_MetaTagValue_MetaTag] FOREIGN KEY([MetaTagID])
REFERENCES [dbo].[MetaTag] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetaTagValue_MetaTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetaTagValue]'))
ALTER TABLE [dbo].[MetaTagValue] CHECK CONSTRAINT [FK_MetaTagValue_MetaTag]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetaTagValueID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecommendationMetaTagMapping]'))
ALTER TABLE [dbo].[RecommendationMetaTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_MetaTagValueID] FOREIGN KEY([MetaTagValueId])
REFERENCES [dbo].[MetaTagValue] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetaTagValueID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecommendationMetaTagMapping]'))
ALTER TABLE [dbo].[RecommendationMetaTagMapping] CHECK CONSTRAINT [FK_MetaTagValueID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RecommendationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecommendationMetaTagMapping]'))
ALTER TABLE [dbo].[RecommendationMetaTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_RecommendationID] FOREIGN KEY([RecommendationId])
REFERENCES [dbo].[RecommendationMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RecommendationID]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecommendationMetaTagMapping]'))
ALTER TABLE [dbo].[RecommendationMetaTagMapping] CHECK CONSTRAINT [FK_RecommendationID]
GO
/****** Object:  Trigger [dbo].[TG_MetaTag]    Script Date: 6/26/2024 11:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_MetaTag]'))
EXEC dbo.sp_executesql @statement = N'

CREATE TRIGGER [dbo].[TG_MetaTag]
   ON  [dbo].[MetaTag]
   AFTER INSERT
AS 
BEGIN
	

	INSERT INTO [dbo].[MetaTagValue]
           ([MetaTagID]
           ,[MetaTagValue]
           ,[IsActive])
     VALUES
           (
		   (SELECT ID From inserted)
           ,''Not Allocated''
           ,1)

END
' 
GO
ALTER TABLE [dbo].[MetaTag] ENABLE TRIGGER [TG_MetaTag]
GO
