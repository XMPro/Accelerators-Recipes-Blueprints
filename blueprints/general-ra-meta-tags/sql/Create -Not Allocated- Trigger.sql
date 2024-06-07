/****** Object:  Trigger [dbo].[TG_RACodes]    Script Date: 5/31/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TG_RACodes]
   ON  [dbo].[RACodes]
   AFTER INSERT
AS 
BEGIN
	

	INSERT INTO [dbo].[RACodeValues]
           ([Code]
           ,[Value]
           ,[IsActive])
     VALUES
           (
		   (SELECT Code From inserted)
           ,'Not Allocated'
           ,1)

END
