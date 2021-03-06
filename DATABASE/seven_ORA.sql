USE [DB]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccount]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Proc [dbo].[DeleteAccount]
	@AID int,
	@Account nvarchar(20),
	@Reason varchar(100),
	@DrawIP varchar(15)
As
Set NoCount On
Begin Tran
	Begin
		Insert Into [dbo].[UserInfo_UN]
		Select *
		From [dbo].[UserInfo]
		Where AID = @AID
	End
	Begin
		Insert Into [dbo].[UserInfo_UN_Reason](Account, DrawDate, DrawReason, DrawIP)
			Values(@Account, Default, @Reason, @DrawIP)
	End
	Begin
		Delete From [dbo].[UserInfo]
		Where AID = @AID
	End
Commit Tran




GO
/****** Object:  StoredProcedure [dbo].[InsertAccount]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE Proc [dbo].[InsertAccount]
	@Account nvarchar(20),
	@MD5Password varchar(32),
	@FirstName nvarchar(32),
	@Address nvarchar(128),
	@ZipCode varchar(8),
	@EMail varchar(32),
	@MailOpt char(3),
	@Tel varchar(16),
	@Nation varchar(30),
	@Gender char(1),
	@BirthDay char(8),
	@AscPassWord varchar(16),
	@NickName nvarchar(20)
As
Set NoCount On

Begin
	Insert Into [dbo].[UserInfo](
		Account, MD5Password,
		FirstName,
		Address, ZipCode,
		EMail, MailOpt,
		Tel,
		Nation,
		RegDate,
		Gender, BirthDay,
		[Right],
		AscPassWord, MailIsConfirm,
		NickName)
	Values(
		@Account, @MD5Password,
		@FirstName,
		@Address, @ZipCode,
		@EMail, @MailOpt,
		@Tel,
		@Nation,
		Default,
		@Gender, @BirthDay,
		Default,
		@AscPassWord, 1,
		@NickName)
End


GO
/****** Object:  StoredProcedure [dbo].[MakeTestAccount]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakeTestAccount] 
@Account char(20),
@count int
AS

DECLARE @MyCnt int
SET @MyCnt =1

WHILE(@MyCnt<@count)
BEGIN
INSERT INTO UserInfo(Account,MD5Password,[Right])
 VALUES('t'+CAST(@MyCnt AS char(4)),
'b59c67bf196a4758191e42f76670ceba',
512)
SET @MyCnt = @MyCnt+1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_NICKNAME_RE_REG]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[SP_NICKNAME_RE_REG] 
	@ACCOUNT VARCHAR(20),
	@NICKNAME VARCHAR(50),
	@RESULT CHAR(1) OUTPUT,
	@AID INT OUTPUT
AS
BEGIN
	IF EXISTS(SELECT NICKNAME FROM USERINFO WHERE NICKNAME=@NICKNAME)
	BEGIN
		SET @RESULT = 0
	END
	ELSE
	BEGIN
		UPDATE USERINFO SET  NICKNAME=@NICKNAME WHERE ACCOUNT=@ACCOUNT
		SELECT @AID = AID FROM USERINFO WHERE ACCOUNT = @ACCOUNT
		SET @RESULT = 1
	END
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateUserInfo]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[UpdateUserInfo]
	@AID int,
	@MD5Password varchar(32),
	@Address nvarchar(128),
	@ZipCode varchar(7),
	@EMail varchar(32),
	@MailOpt char(3),
	@Tel varchar(16),
	@AscPassWord varchar(16)
As
Set NoCount On

Begin
	Update UserInfo Set
		MD5Password = @MD5Password,
		Address = @Address,
		ZipCode = @ZipCode,
		EMail = @EMail,
		MailOpt = @MailOpt,
		Tel = @Tel,
		AscPassWord = @AscPassWord
	Where AID = @AID
End




GO
/****** Object:  StoredProcedure [dbo].[UserAuthenticate]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Proc [dbo].[UserAuthenticate]
	@Account nvarchar(20)
AS
Set NoCount On

	Select [Right], MD5Password, LastConnect, BlockStart, BlockEnd, Gender, MailIsConfirm
	From UserInfo
	Where Account = @Account




GO
/****** Object:  Table [dbo].[blocklog]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[blocklog](
	[log_num] [int] NOT NULL,
	[comment] [text] NULL,
	[account] [varchar](20) NOT NULL,
	[subject] [varchar](100) NULL,
	[addedfile] [varchar](50) NULL,
	[udatetime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[testID]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testID](
	[TL_ID] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](35) NOT NULL,
	[MD5Password] [varchar](32) NOT NULL,
	[AllowBeta] [char](1) NULL,
	[MotherLName] [nvarchar](32) NULL,
	[FirstName] [nvarchar](32) NULL,
	[MiddleName] [nvarchar](32) NULL,
	[LastName] [nvarchar](32) NULL,
	[Address] [nvarchar](128) NULL,
	[City] [nvarchar](20) NULL,
	[ZipCode] [varchar](8) NULL,
	[EMail] [varchar](32) NULL,
	[MailOpt] [char](3) NULL,
	[Tel] [varchar](16) NULL,
	[Nation] [varchar](30) NULL,
	[RegDate] [datetime] NULL,
	[Gender] [char](1) NULL,
	[BirthDay] [char](8) NULL,
	[LastConnect] [int] NULL,
	[Right] [smallint] NULL,
	[BlockStart] [int] NULL,
	[BlockEnd] [int] NULL,
	[AscPassWord] [varchar](16) NULL,
	[BlockStart_Web] [datetime] NULL,
	[BlockEnd_Web] [datetime] NULL,
	[MailIsConfirm] [tinyint] NULL,
	[NickName] [nvarchar](20) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo_UN]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo_UN](
	[AID] [int] NOT NULL,
	[Account] [nvarchar](20) NOT NULL,
	[MD5Password] [varchar](32) NULL,
	[AllowBeta] [char](1) NULL,
	[MotherLName] [nvarchar](32) NULL,
	[FirstName] [nvarchar](32) NULL,
	[MiddleName] [nvarchar](32) NULL,
	[LastName] [nvarchar](32) NULL,
	[Address] [nvarchar](128) NULL,
	[City] [nvarchar](20) NULL,
	[ZipCode] [varchar](8) NULL,
	[EMail] [varchar](32) NULL,
	[MailOpt] [char](3) NULL,
	[Tel] [varchar](16) NULL,
	[Nation] [varchar](30) NULL,
	[RegDate] [datetime] NULL,
	[Gender] [char](1) NULL,
	[BirthDay] [char](8) NULL,
	[LastConnect] [int] NULL,
	[Right] [smallint] NOT NULL,
	[BlockStart] [int] NULL,
	[BlockEnd] [int] NULL,
	[AscPassWord] [varchar](16) NOT NULL,
	[BlockStart_Web] [datetime] NULL,
	[BlockEnd_Web] [datetime] NULL,
	[MailIsConfirm] [tinyint] NULL,
	[NickName] [nvarchar](20) NULL,
 CONSTRAINT [IX_UserInfo_UN_1] UNIQUE NONCLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo_UN_Reason]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo_UN_Reason](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](20) NOT NULL,
	[DrawDate] [datetime] NULL,
	[DrawReason] [nvarchar](100) NULL,
	[DrawIP] [varchar](15) NULL,
 CONSTRAINT [PK_UserInfo_UN_Reason] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WEB_ROSE_Game_Subscription_StartEnd]    Script Date: 3/10/2012 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WEB_ROSE_Game_Subscription_StartEnd](
	[idx] [int] IDENTITY(1,1) NOT NULL,
	[GameAccountID] [varchar](14) NOT NULL,
	[SubscriptionStartDate] [datetime] NULL,
	[SubscriptionEndDate] [datetime] NULL,
 CONSTRAINT [PK_WEB_ROSE_Game_Subscription_StartEnd] PRIMARY KEY CLUSTERED 
(
	[idx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_MD5Password]  DEFAULT ('b59c67bf196a4758191e42f76670ceba') FOR [MD5Password]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_LastConnect]  DEFAULT (0) FOR [LastConnect]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Right]  DEFAULT (0) FOR [Right]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_BlockStart]  DEFAULT (0) FOR [BlockStart]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_BlockEnd]  DEFAULT (0) FOR [BlockEnd]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_BlockStart_Web]  DEFAULT (0) FOR [BlockStart_Web]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_BlockEnd_Web]  DEFAULT (0) FOR [BlockEnd_Web]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Mailisconfirm]  DEFAULT (1) FOR [MailIsConfirm]
GO
ALTER TABLE [dbo].[UserInfo_UN_Reason] ADD  CONSTRAINT [DF_UserInfo_UN_Reason_DrawDate]  DEFAULT (getdate()) FOR [DrawDate]
GO
