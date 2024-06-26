/****** Cannot script Unresolved Entities : Server[@Name='xcs-dev-sqlserver-a43zk3ahnzkrm']/Database[@Name='MD']/UnresolvedEntity[@Name='inserted'] ******/
GO
/****** Cannot script Unresolved Entities : Server[@Name='xcs-dev-sqlserver-a43zk3ahnzkrm']/Database[@Name='MD']/UnresolvedEntity[@Name='deleted'] ******/
GO
/****** Object:  Table [dbo].[AssetMaster]    Script Date: 6/26/2024 11:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssetMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AssetMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Asset] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
	[IsActiveInApp] [bit] NULL,
	[Site] [varchar](100) NULL,
	[Area] [varchar](100) NULL,
	[System] [varchar](100) NULL,
	[Subsystem] [varchar](100) NULL,
	[Equipment] [varchar](100) NULL,
	[Criticality] [int] NULL,
	[IsActiveInRec] [bit] NULL,
 CONSTRAINT [PK_AA_Asset] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShutdownAssets]    Script Date: 6/26/2024 11:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShutdownAssets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShutdownAssets](
	[AssetID] [varchar](max) NOT NULL,
	[ShutdownID] [int] NOT NULL,
 CONSTRAINT [PK_ShutdownAssets] PRIMARY KEY CLUSTERED 
(
	[ShutdownID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShutdownMaster]    Script Date: 6/26/2024 11:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShutdownMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShutdownMaster](
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Site] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[ModifiedStartTime] [datetime] NULL,
	[ModifiedEndTime] [datetime] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ShutdownNotificationList]    Script Date: 6/26/2024 11:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShutdownNotificationList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShutdownNotificationList](
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Site] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AssetMetaTagMapping]    Script Date: 6/26/2024 11:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssetMetaTagMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AssetMetaTagMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssetId] [int] NULL,
	[MetaTagValueId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_AssetMetaTagMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MetaTagValue]    Script Date: 6/26/2024 11:28:54 AM ******/
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
/****** Object:  Table [dbo].[MetaTag]    Script Date: 6/26/2024 11:28:54 AM ******/
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
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AA_AssetMetaTagMapping_isActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AssetMetaTagMapping] ADD  CONSTRAINT [DF_AA_AssetMetaTagMapping_isActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AA_MetaTagLabel_isActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MetaTagValue] ADD  CONSTRAINT [DF_AA_MetaTagLabel_isActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShutdownAssets_ShutdownMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShutdownAssets]'))
ALTER TABLE [dbo].[ShutdownAssets]  WITH CHECK ADD  CONSTRAINT [FK_ShutdownAssets_ShutdownMaster] FOREIGN KEY([ShutdownID])
REFERENCES [dbo].[ShutdownMaster] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShutdownAssets_ShutdownMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShutdownAssets]'))
ALTER TABLE [dbo].[ShutdownAssets] CHECK CONSTRAINT [FK_ShutdownAssets_ShutdownMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetMetaTagMapping]'))
ALTER TABLE [dbo].[AssetMetaTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_AssetID] FOREIGN KEY([AssetId])
REFERENCES [dbo].[AssetMaster] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetMetaTagMapping]'))
ALTER TABLE [dbo].[AssetMetaTagMapping] CHECK CONSTRAINT [FK_AssetID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetMetaTagValue_MetaTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetMetaTagMapping]'))
ALTER TABLE [dbo].[AssetMetaTagMapping]  WITH CHECK ADD  CONSTRAINT [FK_AssetMetaTagValue_MetaTag] FOREIGN KEY([MetaTagValueId])
REFERENCES [dbo].[MetaTagValue] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetMetaTagValue_MetaTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetMetaTagMapping]'))
ALTER TABLE [dbo].[AssetMetaTagMapping] CHECK CONSTRAINT [FK_AssetMetaTagValue_MetaTag]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetaTagValue_MetaTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetaTagValue]'))
ALTER TABLE [dbo].[MetaTagValue]  WITH NOCHECK ADD  CONSTRAINT [FK_MetaTagValue_MetaTag] FOREIGN KEY([MetaTagID])
REFERENCES [dbo].[MetaTag] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MetaTagValue_MetaTag]') AND parent_object_id = OBJECT_ID(N'[dbo].[MetaTagValue]'))
ALTER TABLE [dbo].[MetaTagValue] CHECK CONSTRAINT [FK_MetaTagValue_MetaTag]
GO
/****** Object:  Trigger [dbo].[TG_AA_Asset_Delete]    Script Date: 6/26/2024 11:28:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TG_AA_Asset_Delete]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER [dbo].[TG_AA_Asset_Delete]
   ON  [dbo].[AssetMaster]
   AFTER DELETE
AS 
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[AssetMetaTagMapping]
    WHERE Id IN (SELECT Id FROM deleted);

END
' 
GO
ALTER TABLE [dbo].[AssetMaster] ENABLE TRIGGER [TG_AA_Asset_Delete]
GO
/****** Object:  Trigger [dbo].[TG_MetaTag]    Script Date: 6/26/2024 11:28:54 AM ******/
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
