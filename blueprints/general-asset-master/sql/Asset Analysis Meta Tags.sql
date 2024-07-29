SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
 [IsActiveInApp] [bit] NULL,
 [IsActiveInRec] [bit] NULL,
 CONSTRAINT [PK_AA_Asset] PRIMARY KEY CLUSTERED 
(
 [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO