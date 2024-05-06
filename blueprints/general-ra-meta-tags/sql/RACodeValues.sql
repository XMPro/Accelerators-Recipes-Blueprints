/****** Object:  Table [dbo].[RACodeValues]    Script Date: 03/05/2024 11:53:44 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RACodeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Value] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__RACodeVa__A25C5AA66109640E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Unique_CodeValue] UNIQUE NONCLUSTERED 
(
	[Code] ASC,
	[Value] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RACodeValues] ADD  CONSTRAINT [DF_RACodeValues_isActive]  DEFAULT ((1)) FOR [IsActive]
GO

