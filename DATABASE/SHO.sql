USE [SHO]
GO
/****** Object:  StoredProcedure [dbo].[AddChangeAbility]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[AddChangeAbility] 
	@intCharID int , 
	@Account nvarchar( 20 ),
	@CharName nvarchar(30),
	@AbilityType smallint,
	@UsedPoint smallint,
	@IP char(15),
	@Location varchar(30),
	@LocX int , 
	@LocY int 
AS

Insert GS_ChangeAbility ( Account, CharID, CharName, AbilityType, UsedPoint, BonusPoint, IP, 
Location, LocX, LocY ) 
Values ( @Account, @intCharID, @CharName, @AbilityType, @UsedPoint, 0, @IP, @Location, @LocX, @LocY)




GO
/****** Object:  StoredProcedure [dbo].[AddCharacterLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





Create Proc [dbo].[AddCharacterLog]
	@AccountName nvarchar(20),
	@CharName nvarchar(30),
	@DelAdd tinyint
AS

Insert Into GS_CharacterLog(
	dateREG,
	AccountName, CharName, DelAdd)
Values (Default,
	@AccountName, @CharName, @DelAdd)





GO
/****** Object:  StoredProcedure [dbo].[AddCheatLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[AddCheatLog] 
	@Account nvarchar(20),
	@CharName nvarchar(30),
	@ChannelNo tinyint,
	@CheatCode nvarchar(55)
AS

Insert Into WS_CheatLog (Account, CharName, ChannelNo, CheatCode)
Values(@Account, @CharName, @ChannelNo, @CheatCode)




GO
/****** Object:  StoredProcedure [dbo].[AddClanLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE Proc [dbo].[AddClanLog]
	@CharName nvarchar(32),
	@ClanName nvarchar(20),
	@ClanLevel smallint,
	@Point int,
	@Success tinyint,
	@Location varchar(24),
	@LocX int,
	@LocY int
As

	Insert Into WS_ClanLog (dateREG,
		CharName,
		ClanName, ClanLevel, Point, Success,
		Location, LocX, LocY)
	Values (Default,
		@CharName,
		@ClanName, @ClanLevel, @Point, @Success,
		@Location, @LocX, @LocY)



GO
/****** Object:  StoredProcedure [dbo].[AddCreateLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





Create Proc [dbo].[AddCreateLog]
	@CharID int,
	@CharName nvarchar(30),
	@ItemID varchar(10),
	@ItemName varchar(50),
	@Stuff1 varchar(24),
	@Stuff2 varchar(24),
	@Stuff3 varchar(24),
	@Stuff4 varchar(24),
	@Making tinyint,
	@Success tinyint,
	@Location varchar(24),
	@LocX int,
	@LocY int
AS

Insert Into GS_CreateLog (
	dateREG,
	CharID, CharName,
	ItemID, ItemName,
	Stuff1, Stuff2, Stuff3, Stuff4,
	Making, Success,
	Location, LocX, LocY)
Values (	Default,
	@CharID, @CharName,
	@ItemID, @ItemName,
	@Stuff1, @Stuff2, @Stuff3, @Stuff4,
	@Making, @Success,
	@Location, @LocX, @LocY )





GO
/****** Object:  StoredProcedure [dbo].[AddDieLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Proc [dbo].[AddDieLog]
	@CharName varchar(32),
	@Money bigint,
	@KillPos varchar(24),
	@CharLevel smallint,
	@Exp int,
	@PosX int,
	@PosY int,
	@ObjectName varchar(32)
As

	Insert Into GS_DieLog (dateREG,
		CharName,
		[Money], CharLevel, [Exp],
		KillPos, PosX, PosY,
		ObjectName)
	Values(Default,
		@CharName,
		@Money, @CharLevel, @Exp,
		@KillPos, @PosX, @PosY,
		@ObjectName)



GO
/****** Object:  StoredProcedure [dbo].[AddGemmingLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[AddGemmingLog]
	@CharID int,
	@CharName nvarchar(30),
	@ItemID varchar(10),
	@ItemName varchar(50),
	@JewelID varchar(10),
	@JewelName varchar(24),
	@Gemming tinyint,
	@Success tinyint,
	@Location varchar(24),
	@LocX int,
	@LocY int
AS

Insert Into GS_GemmingLog (
	dateREG,
	CharID, CharName,
	ItemID, ItemName, JewelID, JewelName,
	Gemming, Success,
	Location, LocX, LocY)
Values (	Default,
	@CharID, @CharName,
	@ItemID, @ItemName, @JewelID, @JewelName,
	@Gemming, @Success,
	@Location, @LocX, @LocY)




GO
/****** Object:  StoredProcedure [dbo].[AddItemLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




--[GS_ItemLog] Table
-- ItemOpt smallint NULL, Default(0) 추가
-- AddItemLog SP 수정

CREATE Proc [dbo].[AddItemLog]
	@Action int,
	@SbjAccount nvarchar(20),
	@SbjCharID int,
	@SbjCharName nvarchar(30),
	@ItemID varchar(10),
	@ItemName varchar(50),
	@ItemCount smallint,
	@ItemSN bigint,
	-- @ItemOpt smallint, 
	@Money bigint,
	@Location varchar(24),
	@LocX int,
	@LocY int,
	@ObjAccount nvarchar(20),
	@ObjCharID int,
	@ObjCharName nvarchar(30),
	@SbjIP varchar(15),
	@ObjIP varchar(15)
AS

DECLARE @ItemOpt bigint
set @ItemOpt = 0

Insert Into GS_ItemLog (
	dateREG,
	[Action],
	SbjAccount, SbjCharID, SbjCharName,
	ItemID, ItemName, ItemCount, ItemSN,
	ItemOpt, [Money],
	Location, LocX, LocY,
	ObjAccount, ObjCharID, ObjCharName,
	SbjIP, ObjIP)
Values (Default,
	@Action,
	@SbjAccount, @SbjCharID, @SbjCharName,
	@ItemID, @ItemName, @ItemCount, @ItemSN,
	@ItemOpt, @Money,
	@Location, @LocX, @LocY,
	@ObjAccount, @ObjCharID, @ObjCharName,
	@SbjIP, @ObjIP)

GO
/****** Object:  StoredProcedure [dbo].[AddLevelUpLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





Create Proc [dbo].[AddLevelUpLog]
	@CharID int,
	@CharName nvarchar(30),
	@toLevel smallint,
	@BPoint smallint,
	@SPoint smallint,
	@Location varchar(24),
	@LocX int,
	@LocY int
AS

Insert Into GS_LevelUpLog (
	dateREG,
	CharID, CharName,
	toLevel, BPoint, SPoint,
	Location, LocX, LocY)
Values (Default,
	@CharID, @CharName,
	@toLevel, @BPoint, @SPoint,
	@Location, @LocX, @LocY)





GO
/****** Object:  StoredProcedure [dbo].[AddLoginLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[AddLoginLog]
	@Login tinyint,
	@CharName nvarchar(30),
	@Channel tinyint,
	@CharLevel smallint,
	@Money bigint,
	@Location varchar(24),
	@LocX int,
	@LocY int,
	@LoginIP varchar(15)
AS

Insert Into WS_LoginLog(
	dateREG,
	Login,
	CharName,
	Channel,
	CharLevel, [Money],
	Location, LocX, LocY,
	LoginIP)
Values (Default,
	@Login,
	@CharName, 
	@Channel,
	@CharLevel, @Money,
	@Location, @LocX, @LocY,
	@LoginIP)




GO
/****** Object:  StoredProcedure [dbo].[AddPeriodicCHARLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







Create Proc [dbo].[AddPeriodicCHARLog]
	@CharName varchar(32),
	@Channel tinyint,
	@CharLevel smallint,
	@Money bigint,
	@Exp int,
	@BPoint smallint,
	@SPoint smallint,
	@Location varchar(24),
	@LocX int,
	@LocY int
As

	Insert Into GS_PeriodicCHARLog(dateREG,
		CharName,
		Channel,
		CharLevel, [Money], [Exp], BPoint, SPoint,
		Location, LocX, LocY)
	Values (Default,
		@CharName,
		@Channel,
		@CharLevel, @Money, @Exp, @BPoint, @SPoint,
		@Location, @LocX, @LocY)






GO
/****** Object:  StoredProcedure [dbo].[AddQuestLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





Create Proc [dbo].[AddQuestLog]
	@CharID int,
	@CharName nvarchar(30),
	@QuestID int,
	@QuestDo tinyint
AS

Insert Into GS_QuestLog(
	dateREG,
	CharID, CharName,
	QuestID, QuestDo)
Values (Default,
	@CharID, @CharName,
	@QuestID, @QuestDo)





GO
/****** Object:  StoredProcedure [dbo].[AddSkillLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





Create Proc [dbo].[AddSkillLog]
	@CharID int,
	@CharName nvarchar(30),
	@SkillID int,
	@SkillName varchar(24),
	@SkillLevel smallint,
	@SPoint smallint,
	@Location varchar(24),
	@LocX int,
	@LocY int
AS

Insert Into GS_SkillLog(
	dateREG,
	CharID, CharName,
	SkillID, SkillName, SkillLevel, SPoint,
	Location, LocX, LocY)
Values (Default,
	@CharID, @CharName,
	@SkillID, @SkillName, @SkillLevel, @SPoint,
	@Location, @LocX, @LocY)





GO
/****** Object:  StoredProcedure [dbo].[AddUnionLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Proc [dbo].[AddUnionLog]
	@iCharID int,
	@szCharName nvarchar(30),
	@nAction smallint,
	@nCurUnion smallint,
	@iCurPoint int,
	@nAfterUnion smallint,
	@iAfterPoint int,
	@szLocation varchar(50),
	@iLocX int,
	@iLocY int
AS

Insert Into GS_UnionLog (
	dateREG,
	iCharID, szCharName,
	nAction, 
	nCurUnion, iCurPoint, 
	nAfterUnion, iAfterPoint,
	szLocation, iLocX, iLocY)
Values (Default,
	@iCharID, @szCharName,
	@nAction, 
	@nCurUnion, @iCurPoint,
	@nAfterUnion, @iAfterPoint,
	@szLocation, @iLocX, @iLocY)




GO
/****** Object:  StoredProcedure [dbo].[AddUpgradeLog]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





Create Proc [dbo].[AddUpgradeLog]
	@CharID int,
	@CharName nvarchar(30),
	@ItemID varchar(10),
	@ItemName varchar(50),
	@UpLevel smallint,
	@Success tinyint,
	@Location varchar(24),
	@LocX int,
	@LocY int
AS

Insert Into GS_UpgradeLog(
	dateREG,
	CharID, CharName,
	ItemID, ItemName,
	UpLevel, Success,
	Location, LocX, LocY)
Values  ( Default,
	@CharID, @CharName,
	@ItemID, @ItemName,
	@UpLevel, @Success,
	@Location, @LocX, @LocY)





GO
/****** Object:  StoredProcedure [dbo].[GetItemLIST]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[GetItemLIST]
	@szAccount	nvarchar(30),
	@biStartID	bigint
AS
	SELECT top 48 intID, nItemTYPE,nItemNO,nDupCNT,txtFromCHAR,txtToCHAR,txtDESC,txtFromIP  from tblCART where txtACCOUNT = @szAccount and intID > @biStartID



GO
/****** Object:  StoredProcedure [dbo].[GiveITEM]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



-- 리턴값은 남은 아이템 갯수...
CREATE PROCEDURE [dbo].[GiveITEM]  
	@biItemID		bigint,
	@szFromAccount	nvarchar(30),
	@szFromChar		nvarchar(30),
	@szToAccount		nvarchar(30),
	@szToChar		nvarchar(30),
	@szDesc		nvarchar(80),
	@szUserIP		nvarchar(20),
	@szServerIP		nvarchar(20),
	@nGiveCnt		smallint
AS
	DECLARE @nItemType int, @nItemNo int, @nDupCnt  int

	SELECT  @nItemType=nItemTYPE, @nItemNo=nItemNO, @nDupCnt=nDupCNT from tblCART where intID = @biItemID and txtAccount = @szFromAccount;
	IF @@ROWCOUNT <= 0
		RETURN -1;

	-- 분할 전달이 안될경우...
	IF @nDupCnt <= @nGiveCnt
	BEGIN
		-- 레코드 통채로 변경
		BEGIN TRAN
		UPDATE tblCART SET 	txtACCOUNT=@szToAccount,
				            	txtFromACC=@szFromAccount,
					txtFromCHAR=@szFromChar,
					txtToCHAR=@szToChar,
					txtDesc=@szDesc,
					txtFromIP=@szServerIP
					WHERE intID=@biItemID and txtACCOUNT=@szFromAccount
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			RETURN -1;
		END
	
		COMMIT TRAN
	
		-- 선물한 로그...
		INSERT ItemStorageHistory_T ( UserID,CharName,UserIP,ServerIP,Mallidx,ItemType,ItemNo,ItemCount,RecvUserID,RecvCharName,btLogType ) 
			VALUES ( @szFromAccount,@szFromChar,@szUserIP,@szServerIP,@biItemID, @nItemType,@nItemNo,@nDupCnt, @szToAccount,@szToChar,1 );
	
		RETURN 0;
	END


	BEGIN TRAN
	-- 아이템 @nGiveCn개짜리 추가...
	INSERT tblCART ( txtACCOUNT,nItemTYPE,nItemNO,nDupCNT,txtFromACC,txtFromCHAR,txtToCHAR,txtDesc,txtFromIP) VALUES
		 ( @szToAccount, @nItemType, @nItemNo, @nGiveCnt, @szFromAccount, @szFromChar, @szToChar, @szDesc, @szServerIP );
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1;
	END

	-- 기존꺼에서 갯수 감소.	
	UPDATE tblCART SET	nDupCNT=@nDupCnt-@nGiveCnt WHERE intID=@biItemID and txtACCOUNT=@szFromAccount
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1;
	END

	COMMIT TRAN

	-- 선물한 로그...
	INSERT ItemStorageHistory_T ( UserID,CharName,UserIP,ServerIP,Mallidx,ItemType,ItemNo,ItemCount,RecvUserID,RecvCharName,btLogType ) 
		VALUES ( @szFromAccount,@szFromChar,@szUserIP,@szServerIP,@biItemID, @nItemType,@nItemNo,@nGiveCnt, @szToAccount,@szToChar,1 );

	RETURN @nDupCnt-@nGiveCnt;



GO
/****** Object:  StoredProcedure [dbo].[gs_SelectBANK]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[gs_SelectBANK]
	@szAccount  nvarchar(30)
AS
	SELECT * FROM tblGS_BANK WHERE txtACCOUNT=@szAccount








GO
/****** Object:  StoredProcedure [dbo].[gs_SelectCHAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[gs_SelectCHAR]
	@szCharName	nvarchar(30)
AS
	SELECT * FROM tblGS_AVATAR WHERE txtNAME=@szCharName








GO
/****** Object:  StoredProcedure [dbo].[InsertITEM]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertITEM]
	@szAccount	nvarchar(30),
	@nItemType	smallint,
	@nItemNo	smallint,
	@nDupCnt	smallint
AS
	IF @nItemType >= 10 AND @nItemType < 14
	BEGIN
		-- 중복갯수 적용되는 아이템 :: 중복갯수는 최대 999개씩으로 끊어서...
		BEGIN TRAN ins_item
		WHILE @nDupCnt > 999
		BEGIN
			SET @nDupCnt = @nDupCnt - 999
			INSERT tblCART ( txtACCOUNT,nItemTYPE,nItemNO,nDupCNT ) VALUES ( @szAccount,@nItemType,@nItemNo,999 );
			IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRAN ins_item
				RETURN 0;
			END
		END
		
		IF @nDupCnt > 0 
		BEGIN
			INSERT tblCART ( txtACCOUNT,nItemTYPE,nItemNO,nDupCNT ) VALUES ( @szAccount,@nItemType,@nItemNo,@nDupCnt );
		END
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN ins_item
			RETURN 0;
		END
	
		COMMIT TRAN ins_item
		RETURN 1;
	END

	BEGIN TRAN ins_item
	-- 장비 아이템..
	WHILE @nDupCnt > 0
	BEGIN
		SET @nDupCnt = @nDupCnt - 1

		INSERT tblCART ( txtACCOUNT,nItemTYPE,nItemNO,nDupCNT ) VALUES ( @szAccount,@nItemType,@nItemNo,1 );
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN ins_item
			RETURN 0;
		END
	END

	COMMIT TRAN ins_item
	RETURN 1;



GO
/****** Object:  StoredProcedure [dbo].[InsertITEM2]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE PROCEDURE [dbo].[InsertITEM2] 
	@szAccount	nvarchar(30),
	@nItemType	smallint,
	@nItemNo	smallint,
	@nDupCnt	smallint
AS
	IF @nItemType >= 10 AND @nItemType < 14
	BEGIN
		-- 중복갯수 적용되는 아이템
		BEGIN TRAN ins_item
		INSERT tblCART ( txtACCOUNT,nItemTYPE,nItemNO,nDupCNT ) VALUES ( @szAccount,@nItemType,@nItemNo,@nDupCnt );
	
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN ins_item
			RETURN 0;
		END
	
		COMMIT TRAN ins_item
		RETURN 1;
	END

	BEGIN TRAN ins_item
	-- 장비 아이템..
	WHILE @nDupCnt > 0
	BEGIN

		SET @nDupCnt = @nDupCnt - 1
		INSERT tblCART ( txtACCOUNT,nItemTYPE,nItemNO,nDupCNT ) VALUES ( @szAccount,@nItemType,@nItemNo,1 );
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN ins_item
			RETURN 0;
		END
	END

	COMMIT TRAN ins_item
	RETURN 1;



GO
/****** Object:  StoredProcedure [dbo].[PickOutITEM]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PickOutITEM]
	@szAccount	nvarchar(30),
	@szCharName	nvarchar(30),
	@szUserIP	nvarchar(20),
	@szServerIP	nvarchar(20),
	@biSqlID	bigint,
	@nPickOutCnt	smallint 
AS
	DECLARE @nItemType int, @nItemNo int, @nDupCnt  int, @nRemainCount int

	SELECT  @nItemType=nItemTYPE, @nItemNo=nItemNO, @nDupCnt=nDupCNT from tblCART where intID = @biSqlID and txtAccount = @szAccount;
	IF @@ROWCOUNT <= 0
		RETURN 0;

	BEGIN TRAN

	IF @nDupCnt > @nPickOutCnt
	BEGIN
		-- 기존 레코드의 nDupCnt를 @nPickOutCnt만큼... 감소
		set @nRemainCount = @nDupCnt - @nPickOutCnt;
		update tblCART set nDupCNT=@nRemainCount where intID = @biSqlID and txtAccount = @szAccount;
		IF @@ERROR = 0
		BEGIN
			COMMIT TRAN
			-- 아이템 꺼내간 로그 남길곳....
			INSERT ItemStorageHistory_T ( UserID,CharName,UserIP,ServerIP,Mallidx,ItemType,ItemNo,ItemCount ) VALUES ( @szAccount,@szCharName,@szUserIP,@szServerIP,@biSqlID, @nItemType,@nItemNo,@nPickOutCnt );

			SELECT @nItemType, @nItemNo, @nPickOutCnt, @nRemainCount;
			RETURN 1;
		END
	END
	ELSE
	BEGIN
		DELETE from tblCART where intID = @biSqlID and txtAccount = @szAccount;
		IF @@ERROR = 0
		BEGIN
			COMMIT TRAN
			-- 아이템 꺼내간 로그 남길곳....
			INSERT ItemStorageHistory_T ( UserID,CharName,UserIP,ServerIP,Mallidx,ItemType,ItemNo,ItemCount ) VALUES ( @szAccount,@szCharName,@szUserIP,@szServerIP,@biSqlID, @nItemType,@nItemNo,@nDupCnt );

			SELECT @nItemType, @nItemNo, @nDupCnt, 0;
			RETURN 1;
		END
	END

	ROLLBACK TRAN
	RETURN 0;



GO
/****** Object:  StoredProcedure [dbo].[rws_BackupBank]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_BackupBank] 
@txtACCOUNT nvarchar(30)
AS

DECLARE @blobITEMS binary(2250),
@intREWARD money,
@txtPASSWORD nvarchar(20)

select 
@txtACCOUNT=txtACCOUNT,
@blobITEMS=blobITEMS,
@intREWARD=intREWARD,
@txtPASSWORD=txtPASSWORD 
from tblGS_BANK where txtACCOUNT=@txtACCOUNT

IF @@ROWCOUNT > 0
BEGIN

insert tblGS_BANK_Moved (
txtACCOUNT,
blobITEMS,
intREWARD,
txtPASSWORD  ) 
values 
(
@txtACCOUNT,
@blobITEMS,
@intREWARD,
@txtPASSWORD
)

END




GO
/****** Object:  StoredProcedure [dbo].[rws_CheckBackupTable]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_CheckBackupTable] AS

DECLARE @cnt int

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblGS_AVATAR_Moved]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	return 1

return 0






GO
/****** Object:  StoredProcedure [dbo].[rws_CopyChar]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[rws_CopyChar] 
@txtACCOUNT	nvarchar(20),
@txtNAME	nvarchar(30),
@btLEVEL	smallint ,
@intMoney	bigint,
@dwRIGHT	int,
@binBasicE	binary(96),
@binBasicI	binary(32),
@binBasicA	binary(48),
@binGrowA	binary(384),
@binSkillA	binary(384),
@blobQUEST	binary(1024)=null,
@blobINV	binary(2048),
@binHotICON	binary(64)=null,
@dwDelTIME	int,
@binWishLIST	binary(256)=null,
@dwOPTION	int,
@intJOB	int,
@dwRegTIME	int,
@dwItemSN	int,
@intDataVER	int,
@source_server_id	int,
@intOutCharID int out

AS


DECLARE @intCharID int
DECLARE @character_count int
DECLARE @ret int
declare @outDelRET int

-- default value for output variable
set @intOutCharID=0 

IF @binBasicE is NULL  OR  @binBasicI is NULL OR   @binBasicA is NULL 
	OR  @binGrowA is NULL OR  @binSkillA is NULL OR @blobINV is NULL
BEGIN
	set @ret = 107
	return @ret
END

SELECT @character_count=count(*) from tblGS_AVATAR where txtNAME=@txtNAME
IF @character_count > 0 
BEGIN
	set @ret = 101
	return @ret  -- same character exits
END

BEGIN TRAN 

INSERT tblGS_AVATAR ( txtACCOUNT, txtNAME, btLEVEL, intMoney, dwRIGHT, binBasicE, binBasicI, binBasicA, binGrowA, 
	binSkillA, blobQUEST, blobINV, binHotICON, dwDelTIME, binWishLIST, dwOPTION, intJOB, dwRegTIME, 
	dwItemSN, intDataVER
) VALUES( 
	@txtACCOUNT, @txtNAME, @btLEVEL, @intMoney, @dwRIGHT, @binBasicE, @binBasicI, @binBasicA, @binGrowA, 
	@binSkillA, @blobQUEST, @blobINV, @binHotICON, @dwDelTIME, @binWishLIST, @dwOPTION, @intJOB, @dwRegTIME, 
	@dwItemSN, @intDataVER )

IF @@ERROR = 0 
BEGIN
	select @intCharID=intCharID from tblGS_AVATAR where txtNAME=@txtNAME
	set @intOutCharID=@intCharID

	COMMIT TRAN 
	return 0
END
ELSE
BEGIN
	set @ret = 105
END

ROLLBACK TRAN 

-- return value :  0 =  success , 101 = same character exits , 105 = insert failure , 106= backup proc error, @ret >= 300 = failure of deleting remote character, 
--  @intOutCharID = Inserted ID of character ,

return @ret


GO
/****** Object:  StoredProcedure [dbo].[rws_CopyChar_WithRemoteCall]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_CopyChar_WithRemoteCall] 
@txtACCOUNT	nvarchar(20),
@txtNAME	nvarchar(30),
@btLEVEL	smallint ,
@intMoney	bigint,
@dwRIGHT	int,
@binBasicE	binary(96),
@binBasicI	binary(32),
@binBasicA	binary(48),
@binGrowA	binary(384),
@binSkillA	binary(384),
@blobQUEST	binary(1024)=null,
@blobINV	binary(2048),
@binHotICON	binary(64)=null,
@dwDelTIME	int,
@binWishLIST	binary(256)=null,
@dwOPTION	int,
@intJOB	int,
@dwRegTIME	int,
@dwItemSN	int,
@intDataVER	int,
@source_server_id	int,
@intOutCharID int out

AS


DECLARE @intCharID int
DECLARE @character_count int
DECLARE @ret int
declare @outDelRET int

-- default value for output variable
set @intOutCharID=0

SELECT @character_count=count(*) from tblGS_AVATAR where txtNAME=@txtNAME
IF @character_count > 0 
BEGIN
	return 101  -- same character exits
END

BEGIN TRAN 

INSERT tblGS_AVATAR ( txtACCOUNT, txtNAME, btLEVEL, intMoney, dwRIGHT, binBasicE, binBasicI, binBasicA, binGrowA, 
	binSkillA, blobQUEST, blobINV, binHotICON, dwDelTIME, binWishLIST, dwOPTION, intJOB, dwRegTIME, 
	dwItemSN, intDataVER
) VALUES( 
	@txtACCOUNT, @txtNAME, @btLEVEL, @intMoney, @dwRIGHT, @binBasicE, @binBasicI, @binBasicA, @binGrowA, 
	@binSkillA, @blobQUEST, @blobINV, @binHotICON, @dwDelTIME, @binWishLIST, @dwOPTION, @intJOB, @dwRegTIME, 
	@dwItemSN, @intDataVER )

IF @@ERROR = 0 
BEGIN
	select @intCharID=intCharID from tblGS_AVATAR where txtNAME=@txtNAME
	set @intOutCharID=@intCharID

	-- delelete source characte of remove DB
	-- exec @outDelRET=rws_remote_DeleteAvatar @txtACCOUNT,@txtNAME, @source_server_id

	-- start of remote call


	declare @remote_proc_call nvarchar( 120 )
	declare @parameter_def nvarchar( 120 )
	declare @outDeledRET int
	declare @retOUT int
	declare @intxtACCOUNT nvarchar(30)
	declare @intxtNAME nvarchar(20)
	
	set @remote_proc_call = 'exec SHO_W' + cast(@source_server_id as varchar) + '.SHO.DBO.rws_DeleteAvatar @intxtACCOUNT , @intxtNAME, @retOUT OUTPUT'
	set @parameter_def = '@intxtACCOUNT nvarchar(30) , @intxtNAME nvarchar(20), @retOUT int OUTPUT'
	
	
	exec sp_executesql @remote_proc_call, @parameter_def	, @intxtACCOUNT=@txtACCOUNT,  @intxtNAME=@txtNAME,  @retOUT=@outDelRET OUTPUT
	
	-- end of remote call
	
	IF @outDelRET = 0
	BEGIN
		COMMIT TRAN 
		return 0
	END
	ELSE
		set @ret=@outDelRET	
END
ELSE
BEGIN
	set @ret = 105
END

ROLLBACK TRAN 

-- return value :  0 =  success , 101 = same character exits , 105 = insert failure , 106= backup proc error, @ret >= 300 = failure of deleting remote character, 
--  @intOutCharID = Inserted ID of character ,

return @ret



GO
/****** Object:  StoredProcedure [dbo].[rws_CopyChar_WithRemoteCall2]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_CopyChar_WithRemoteCall2] 
@txtACCOUNT	nvarchar(20),
@txtNAME	nvarchar(30),
@btLEVEL	smallint ,
@intMoney	bigint,
@dwRIGHT	int,
@binBasicE	binary(96),
@binBasicI	binary(32),
@binBasicA	binary(48),
@binGrowA	binary(384),
@binSkillA	binary(384),
@blobQUEST	binary(1024)=null,
@blobINV	binary(2048),
@binHotICON	binary(64)=null,
@dwDelTIME	int,
@binWishLIST	binary(256)=null,
@dwOPTION	int,
@intJOB	int,
@dwRegTIME	int,
@dwItemSN	int,
@intDataVER	int,
@source_server_id	int,
@intOutCharID int out

AS


DECLARE @intCharID int
DECLARE @character_count int
DECLARE @ret int
declare @outDelRET int

-- default value for output variable
set @intOutCharID=0

SELECT @character_count=count(*) from tblGS_AVATAR where txtNAME=@txtNAME
IF @character_count > 0 
BEGIN
	return 101  -- same character exits
END

BEGIN TRAN 

INSERT tblGS_AVATAR ( txtACCOUNT, txtNAME, btLEVEL, intMoney, dwRIGHT, binBasicE, binBasicI, binBasicA, binGrowA, 
	binSkillA, blobQUEST, blobINV, binHotICON, dwDelTIME, binWishLIST, dwOPTION, intJOB, dwRegTIME, 
	dwItemSN, intDataVER
) VALUES( 
	@txtACCOUNT, @txtNAME, @btLEVEL, @intMoney, @dwRIGHT, @binBasicE, @binBasicI, @binBasicA, @binGrowA, 
	@binSkillA, @blobQUEST, @blobINV, @binHotICON, @dwDelTIME, @binWishLIST, @dwOPTION, @intJOB, @dwRegTIME, 
	@dwItemSN, @intDataVER )

IF @@ERROR = 0 
BEGIN
	select @intCharID=intCharID from tblGS_AVATAR where txtNAME=@txtNAME
	set @intOutCharID=@intCharID

	-- delelete source characte of remove DB
	exec @outDelRET=rws_remote_DeleteAvatar @txtACCOUNT,@txtNAME, @source_server_id
	IF @outDelRET = 0
	BEGIN
		COMMIT TRAN
		return 0
	END
	ELSE
		set @ret=@outDelRET
END
ELSE
BEGIN
	set @ret = 105
END

ROLLBACK TRAN 

-- return value :  0 =  success , 101 = same character exits , 105 = insert failure , 106= backup proc error, @ret >= 300 = failure of deleting remote character, 
--  @intOutCharID = Inserted ID of character ,

return @ret



GO
/****** Object:  StoredProcedure [dbo].[rws_CopyClan]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_CopyClan] 

@txtNAME 	nvarchar(20),
@txtDESC 	nvarchar(255),
@intMarkIDX1 	smallint,
@intMarkIDX2 	smallint,
@intLEVEL 	smallint, 
@intClanPOINT 	int, 
@intAlliedID	int, 
@intRATE	smallint, 
@intMoney	bigint, 
@binDATA	binary(1024) = null, 
@txtMSG	nvarchar(368) ,

@txtCharNAME nvarchar(30),  
@intCharPOINT	int, 
@intPOS 	int

AS

-- 새로 생성된 클랜 ID
DECLARE @intClanID int
DECLARE @ret int
DECLARE @iclan_count int

select @iclan_count=count(*) from tblWS_Clan where txtNAME=@txtNAME
IF @iclan_count > 0 
BEGIN
	delete from tblGS_AVATAR where txtNAME=@txtCharNAME
	return 200 -- same clan name exits
END

BEGIN TRAN
insert tblWS_Clan(  txtNAME, txtDESC, intMarkIDX1, intMarkIDX2, intLEVEL, intPOINT, intAlliedID, intRATE, intMoney, binDATA, txtMSG ) values 
(
@txtNAME, 
@txtDESC, 
@intMarkIDX1, 
@intMarkIDX2, 
@intLEVEL, 
@intClanPOINT, 
@intAlliedID, 
@intRATE, 
@intMoney, 
@binDATA, 
@txtMSG 
)

IF @@ERROR = 0
	BEGIN
		select @intClanID=intID from tblWS_Clan where txtNAME=@txtNAME
		
		insert tblWS_ClanCHAR( txtCharNAME, intClanID, intPOINT, intPOS ) values (@txtCharNAME, @intClanID, @intCharPOINT, @intPOS )
		IF @@ERROR = 0
		BEGIN
			COMMIT TRAN
			return 0
		END
		ELSE
		BEGIN
			set @ret = 201
		EnD
	
	END
ELSE
	BEGIN
		set @ret = 202
	END

ROLLBACK TRAN

delete from tblGS_AVATAR where txtNAME=@txtCharNAME

return @ret

-- return :  0 = success , 200= same clan name exits, 201 = failure of insert clan master , 202 = failure of insert clan


GO
/****** Object:  StoredProcedure [dbo].[rws_CreateBackupTable]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_CreateBackupTable] AS


CREATE TABLE [dbo].[tblGS_AVATAR_Moved] (
	[intCharID] [int] IDENTITY (1, 1) NOT NULL ,
	[txtACCOUNT] [nvarchar] (20) COLLATE Korean_Wansung_CI_AS NOT NULL ,
	[txtNAME] [nvarchar] (30) COLLATE Korean_Wansung_CI_AS NOT NULL ,
	[btLEVEL] [smallint] NULL ,
	[intMoney] [bigint] NULL ,
	[dwRIGHT] [int] NULL ,
	[binBasicE] [binary] (96) NOT NULL ,
	[binBasicI] [binary] (32) NOT NULL ,
	[binBasicA] [binary] (48) NOT NULL ,
	[binGrowA] [binary] (384) NOT NULL ,
	[binSkillA] [binary] (384) NOT NULL ,
	[blobQUEST] [binary] (1024) NULL ,
	[blobINV] [binary] (2048) NOT NULL ,
	[binHotICON] [binary] (64) NULL ,
	[dwDelTIME] [int] NULL ,
	[binWishLIST] [binary] (256) NULL ,
	[dwOPTION] [int] NULL ,
	[intJOB] [smallint] NOT NULL ,
	[dwRegTIME] [int] NOT NULL ,
	[dwPartyIDX] [int] NULL ,
	[dwItemSN] [int] NULL ,
	[intDataVER] [smallint] NOT NULL ,
	[regDate] [datetime] NULL 
) ON [PRIMARY]




GO
/****** Object:  StoredProcedure [dbo].[rws_CreateTempClan]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[rws_CreateTempClan] 
@txtCharNAME nvarchar( 20 ) , 
@newClanName nvarchar( 60 )
AS

declare @intCount int
select @intCount=count(*) from tblWS_ClanCHAR where txtCharName=@txtCharNAME

IF @intCount > 0
BEGIN
	select @txtCharNAME + ' exists in tblWS_ClanCHAR already'
	return
END

select @intCount=count(*) from tblWS_Clan where txtName=@newClanName

IF @intCount > 0
BEGIN
	select @newClanName + ' exists in tblWS_Clan already'
	return
END

declare @intID		int
declare @txtNAME	nchar(40)
declare @txtDESC	nchar(510)
declare @intMarkIDX1	smallint
declare @intMarkIDX2	smallint
declare @intLEVEL	smallint
declare @intPOINT	int
declare @intAlliedID	int
declare @intRATE	smallint
declare @intMoney	bigint
declare @binDATA	binary( 1024 )
declare @txtMSG	nvarchar( 736 )

set @txtNAME = @newClanName

select top 1 @intID=intID,
-- @txtNAME=txtNAME,
@txtDESC=txtDESC,
@intMarkIDX1=intMarkIDX1,
@intMarkIDX2=intMarkIDX2,
@intLEVEL=intLEVEL,
@intPOINT=intPOINT,
@intAlliedID=intAlliedID,
@intRATE=intRATE,
@intMoney=intMoney,
@binDATA=binDATA,
@txtMSG=txtMSG 
from tblWS_CLAN where intLEVEL > 1

IF @@ROWCOUNT > 0 
BEGIN
	insert tblWS_CLAN (  txtNAME, txtDESC, intMarkIDX1, intMarkIDX2, intLEVEL, intPOINT, intAlliedID, intRATE, intMoney, binDATA, txtMSG ) 
	values (  @newClanName, @txtDESC, @intMarkIDX1, @intMarkIDX2, @intLEVEL, @intPOINT, @intAlliedID, @intRATE, @intMoney, @binDATA, @txtMSG ) 
	IF @@ROWCOUNT <= 0
	BEGIN
		select @newClanName + ' extists already'
		return
	END

	select @intID=intID from tblWS_CLAN where txtNAME=@txtNAME
	IF @@ROWCOUNT > 0 and @@ERROR = 0
	BEGIN
		insert tblWS_ClanCHAR ( txtCharNAME , intClanID , intPOINT , intPOS ) values ( @txtCharNAME , @intID , 3 , 6 ) 
		return
	END

	select @newClanName + ' was made , but cant insert master '
	return
END

select 'Cant find any clan'


GO
/****** Object:  StoredProcedure [dbo].[rws_DeleteAvatar]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_DeleteAvatar] 
	@txtACCOUNT nvarchar(30),
	@txtNAME	nvarchar(20), 
	@retOUT		int				output
AS

DECLARE @intCharID		int	
DECLARE @btLEVEL		smallint
DECLARE @intMoney		bigint
DECLARE @dwRIGHT		int
DECLARE @binBasicE		binary(96)
DECLARE @binBasicI		binary(32)
DECLARE @binBasicA		binary(48)
DECLARE @binGrowA		binary(384)
DECLARE @binSkillA		binary(384)
DECLARE @blobQUEST		binary(1024)
DECLARE @blobINV		binary(2048)
DECLARE @binHotICON		binary(64)
DECLARE @dwDelTIME		int
DECLARE @binWishLIST	binary(256)
DECLARE @dwOPTION		int
DECLARE @intJOB			smallint
DECLARE @dwRegTIME		int
DECLARE @dwPartyIDX		int
DECLARE @dwItemSN		int
DECLARE @intDataVER		smallint



select 
@intCharID		= intCharID,
@btLEVEL		= btLEVEL,
@intMoney		= intMoney,
@dwRIGHT		= dwRIGHT,
@binBasicE		= binBasicE,
@binBasicI		= binBasicI,
@binBasicA		= binBasicA,
@binGrowA		= binGrowA,
@binSkillA		= binSkillA,
@blobQUEST		= blobQUEST,
@blobINV		= blobINV,
@binHotICON		= binHotICON,
@dwDelTIME		= dwDelTIME,
@binWishLIST	= binWishLIST,
@dwOPTION		= dwOPTION,
@intJOB			= intJOB,
@dwRegTIME		= dwRegTIME,
@dwPartyIDX		= dwPartyIDX,
@dwItemSN		= dwItemSN,
@intDataVER		= intDataVER
from tblGS_AVATAR where txtACCOUNT=@txtACCOUNT and txtNAME=@txtNAME

DECLARE @select_count int 
set @select_count = @@ROWCOUNT

BEGIN TRAN
IF  @select_count > 0
BEGIN

	insert tblGS_AVATAR_Moved 
	( 
	intCharID,
	txtACCOUNT,
	txtNAME,
	btLEVEL,
	intMoney,
	dwRIGHT,
	binBasicE,
	binBasicI,
	binBasicA,
	binGrowA,
	binSkillA,
	blobQUEST,
	blobINV,
	binHotICON,
	dwDelTIME,
	binWishLIST,
	dwOPTION,
	intJOB,
	dwRegTIME,
	dwPartyIDX,
	dwItemSN,
	intDataVER 
	) values (
	@intCharID	,
	@txtACCOUNT	,
	@txtNAME	,
	@btLEVEL	,
	@intMoney	,
	@dwRIGHT	,
	@binBasicE	,
	@binBasicI	,
	@binBasicA	,
	@binGrowA	,
	@binSkillA	,
	@blobQUEST	,
	@blobINV	,
	@binHotICON	,
	@dwDelTIME	,
	@binWishLIST,
	@dwOPTION	,
	@intJOB		,
	@dwRegTIME	,
	@dwPartyIDX	,
	@dwItemSN	,
	@intDataVER	
	)

	IF @@ERROR = 0
	BEGIN
		delete from tblGS_AVATAR  where txtACCOUNT=@txtACCOUNT and txtNAME=@txtNAME
		
		-- delete his friendlist 
		delete from tblWS_FRIEND where intCharID=@intCharID
		
		-- remove him from Clan List , if he is not clan master
		delete from tblWS_ClanCHAR where txtCharNAME=@txtNAME and intPOS < 6

		IF @@ERROR = 0
		BEGIN
			COMMIT TRAN
			set @retOUT = 0
			return
		END
		ELSE
			set @retOUT=300
	END	
	ELSE
		set @retOUT=301
END

ROLLBACK TRAN 

set @retOUT = 302

-- output :  0 = success , 300 = can't delete character , 301=can't insert into backup table , 302 = avatar don't exists


GO
/****** Object:  StoredProcedure [dbo].[rws_FindClan]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[rws_FindClan] 

@txtACCOUNT nvarchar(30)

AS

declare @intClanID int
declare @txtNAME nvarchar(30)


declare  avatar_cursor  CURSOR  for 
select txtname from tblgs_avatar where txtaccount=@txtACCOUNT

open avatar_cursor 

FETCH NEXT FROM avatar_cursor into @txtNAME 

while @@FETCH_STATUS=0
BEGIN
	select @intClanID=intClanID  from tblWS_ClanChar where txtCharNAME=@txtNAME
	IF @@ROWCOUNT > 0 
	BEGIN
		select * from tblWS_Clan where intID=@intClanID
	END
	
	FETCH NEXT FROM avatar_cursor into @txtNAME 
ENd

Close  avatar_cursor
deallocate avatar_cursor


GO
/****** Object:  StoredProcedure [dbo].[rws_GetCharacter]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[rws_GetCharacter] 
@txtACCOUNT nvarchar(20), 
@txtNAME nvarchar(30)
AS

DECLARE @iClanID int 
DECLARE @iPOS int

select intCharID, txtACCOUNT, txtNAME, btLEVEL, intMoney, dwRIGHT, 
	binBasicE, binBasicI, binBasicA, binGrowA, binSkillA, blobQUEST, blobINV, 
	binHotICON, dwDelTIME, binWishLIST, dwOPTION, intJOB, dwRegTIME, dwPartyIDX, 
	dwItemSN, intDataVER from tblGS_AVATAR where txtACCOUNT= @txtACCOUNT and txtNAME= @txtNAME

IF @@ROWCOUNT > 0 
BEGIN
	select @iClanID=intClanID, @iPOS=intPOS from tblWS_ClanCHAR where txtCharNAME=@txtNAME

	IF @@ROWCOUNT > 0  and @iPOS >= 6
	BEGIN
		select intID , txtNAME, txtDESC, intMarkIDX1, intMarkIDX2, intLEVEL, intPOINT, intAlliedID, intRATE, intMoney, binDATA, txtMSG from tblWS_Clan where intID=@iClanID
		select txtCharNAME, intClanID, intPOINT, intPOS from tblWS_ClanCHAR where txtCharNAME=@txtNAME
	END
END



GO
/****** Object:  StoredProcedure [dbo].[rws_HasClan]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[rws_HasClan] 
@txtACCOUNT nvarchar( 30 )
AS

declare avatar_cursor cursor for
select txtNAME from tblGS_AVATAR where txtACCOUNT=@txtACCOUNT

declare @txtCharNAME nvarchar( 20 )
declare @intClanID int
declare @ClanName nvarchar( 60 )

open  avatar_cursor

FETCH NEXT FROM avatar_cursor into @txtCharNAME

while @@FETCH_STATUS = 0
BEGIN
	select @intClanID=intClanID from tblWS_ClanCHAR where txtCharNAME=@txtCharNAME and intPOS=6
	IF @@ROWCOUNT > 0 
	BEGIN
		select @ClanName=txtNAME from tblWS_CLAN where intID=@intClanID
		select @ClanNAME ,  @txtCharNAME	
	END
	FETCH NEXT FROM avatar_cursor into @txtCharNAME
END

close avatar_cursor
deallocate avatar_cursor


GO
/****** Object:  StoredProcedure [dbo].[rws_remote_DeleteAvatar]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_remote_DeleteAvatar] 
@txtACCOUNT nvarchar(30),
@txtNAME nvarchar(20),
@server_id int
AS

declare @remote_proc_call nvarchar( 120 )
declare @parameter_def nvarchar( 120 )
declare @outDeledRET int
declare @retOUT int
declare @intxtACCOUNT nvarchar(30)
declare @intxtNAME nvarchar(20)

set @remote_proc_call = 'exec SHO_W' + cast(@server_id as varchar) + '.SHO.DBO.rws_DeleteAvatar @intxtACCOUNT , @intxtNAME, @retOUT OUTPUT'
set @parameter_def = '@intxtACCOUNT nvarchar(30) , @intxtNAME nvarchar(20), @retOUT int OUTPUT'


exec sp_executesql @remote_proc_call, @parameter_def
	, @intxtACCOUNT=@txtACCOUNT,  @intxtNAME=@txtNAME,  @retOUT=@outDeledRET OUTPUT


return @outDeledRET



GO
/****** Object:  StoredProcedure [dbo].[rws_ShowCharInfo]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[rws_ShowCharInfo] 
@txtACCOUNT nvarchar( 30 )
AS

if exists (select * from dbo.sysobjects where id = object_id(N'[rws_tbl_CharInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	drop table rws_tbl_CharInfo
END

if exists (select * from dbo.sysobjects where id = object_id(N'[rws_tbl_ClanFellow]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	drop table rws_tbl_ClanFellow
END

create table DBO.rws_tbl_CharInfo ( txtNAME nvarchar( 20 ) , txtClanNAME nvarchar( 30 ) )
create table DBO.rws_tbl_ClanFellow ( txtClanNAME nvarchar( 30 ) , txtCharName nvarchar( 30 ) )

DECLARE @txtNAME nvarchar(30)
DECLARE @intCharID int
declare @intClanID int

DECLARE @clanchar_count int
DECLARE @intClanOpt int
DECLARE @txtClanNAME nvarchar ( 30 )



DECLARE tblGS_AVATAR_cursor CURSOR FOR
select  txtNAME, intCharID from tblGS_AVATAR where txtACCOUNT=@txtACCOUNT

OPEN tblGS_AVATAR_cursor 

FETCH NEXT FROM tblGS_AVATAR_cursor INTO @txtNAME, @intCharID
WHILE @@FETCH_STATUS = 0
BEGIN
	select @clanchar_count=count(*)  from tblWS_CLANCHAR where txtCharNAME=@txtNAME and intPOS=6

	IF @clanchar_count > 0 
	BEGIN
		select @intClanID=intClanID from tblWS_ClanCHAR where txtCharNAME=@txtNAME
		select @txtClanNAME=txtNAME from tblWS_Clan where intID=@intClanID
		insert rws_tbl_CharInfo ( txtNAME,  txtClanNAME ) values (@txtNAME,  @txtClanNAME)

		DECLARE clanfellow_cursor cursor for 
		select txtCharNAME from tblWS_ClanChar where intClanID=@intClanID
		
		open clanfellow_cursor
	END
	ELSE
	BEGIN
		set @txtClanNAME = ''
		insert rws_tbl_CharInfo ( txtNAME,  txtClanNAME ) values (@txtNAME,  @txtClanNAME)
	END

	FETCH NEXT FROM tblGS_AVATAR_cursor INTO @txtNAME, @intCharID
END

CLOSE tblGS_AVATAR_cursor
DEALLOCATE tblGS_AVATAR_cursor

select * from rws_tbl_CharInfo

drop table rws_tbl_CharInfo
drop table rws_tbl_ClanFellow


GO
/****** Object:  StoredProcedure [dbo].[rws_UpdateBank]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[rws_UpdateBank] 
@txtACCOUNT nvarchar( 20 ) , 
@blobITEMS binary(2250), 
@intREWARD bigint,
@txtPASSWORD nvarchar(10)
AS

DECLARE @bankcount int
DECLARE @err_code int

BEGIN TRAN

select @bankcount=count(*) from tblGS_BANK where txtACCOUNT=@txtACCOUNT

IF @bankcount > 0 
BEGIN
	set @err_code = 403
	update tblGS_BANK set blobITEMS=@blobITEMS where txtACCOUNT=@txtACCOUNT	
END

ELSE

BEGIN
	set @err_code = 402
	insert tblGS_BANK ( txtACCOUNT, blobITEMS, intREWARD, txtPASSWORD ) values 
	(
	@txtACCOUNT , @blobITEMS, @intREWARD, @txtPASSWORD
	)
END

IF @@ERROR = 0
BEGIN
	COMMIT TRAN
	return 0
END

ROLLBACK TRAN
return @err_code

-- return 0 = success , 403=can't update , 402=can't insert



GO
/****** Object:  StoredProcedure [dbo].[usp_card_getcode]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : JoyPark
 @程序名稱   : usp_card_getcardcode
 @目的簡述   : 產生19碼密碼
 @傳入參數   :
 @傳回參數   : CardCode
 @錯誤代碼   :
 @author         : 吳東儒 (darren wu)
 @date            : 2002-11-14
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_card_getcode]
(
@card_code char(8) output
)
AS
declare @AllWord char(36), @i int, @tmpChr nvarchar(8)
set @AllWord = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
set @tmpChr = ''
set @i=0
while @i<8
	begin
		set @tmpChr = @tmpChr + substring(@AllWord,CAST((rand()*36+1) as int),1)
		set @i = @i + 1
	end
set @card_code = @tmpChr



GO
/****** Object:  StoredProcedure [dbo].[usp_charge_by_minute_count]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_charge_by_minute_count
 @目的簡述   : 計算會員目前在線上並以"以分登入"的遊戲帳號之總數
 @傳入參數   : @account_no
 @傳回參數   : @count
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-12-19
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_charge_by_minute_count] 
(
@account_no int,
@count int output 
)
AS
select 	@count = count(distinct player_no)
from 	v_player_login
where 	account_no = @account_no and 
	charge_type = 9



GO
/****** Object:  StoredProcedure [dbo].[usp_delete_player_login]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_delete_player_login
 @目的簡述   : 刪除Player_Login裡的游戲帳號
 @傳入參數   : @player_no, @o_year, @o_month, @o_day, @o_hour, @o_min, @o_sec, @process_state
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-01-07
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_delete_player_login] 
(
@player_no int, 
@o_year int, 
@o_month int, 
@o_day int, 
@o_hour int, 
@o_min int, 
@o_sec int, 
@process_state tinyint 
)
AS
delete   	Player_Login
where 	player_no = @player_no  and
	datepart(yy,logout_time) = @o_year and
	datepart(mm,logout_time) = @o_month and 
	datepart(dd,logout_time) = @o_day and 
	datepart(hh,logout_time) = @o_hour and 
	datepart(mi,logout_time) = @o_min and 
	datepart(ss,logout_time) = @o_sec and
	process_state = @process_state



GO
/****** Object:  StoredProcedure [dbo].[usp_get_products_desc]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_get_products_desc
 @目的簡述   : 取得產品促銷內容
 @傳入參數   : 
 @傳回參數   : @products_desc
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-11-17
 @註 : 當玩家快到期,且點數不夠下次扣點用時,即顯示此訊息
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_get_products_desc]
AS
select  promotion_desc
from Products_Promotion



GO
/****** Object:  StoredProcedure [dbo].[usp_insert_login]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_insert_login
 @目的簡述   : 新增遊戲帳號到Player_Login
 @傳入參數   : @player_no, @login_time, @game_server_ip, @game_server_port, @login_server_name, @isp_id, @charge_type ,@game_server_id, @charge_multiple_flag,@ip_dup_flag int
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-05-14
 @註 : 用來解決index time_out造成dead lock問題
           多傳一個flag表示是否做ip dup檢查
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_insert_login]
(
@player_no int, 
@login_time datetime, 
@game_server_ip int, 
@game_server_port int, 
@login_server_name varchar(50), 
@isp_id int, @user_ip int,
@charge_type tinyint,
@game_server_id int,
@charge_multiple_flag int,
@ip_dup_flag int
)
AS
declare @count int
if (@ip_dup_flag = 1)
	begin
		select @count = count(user_ip)  from Player_Login where user_ip = @user_ip and logout_time = '1900/1/1'
		if @count <> 0	
			return -1		
	end
INSERT INTO Player_Login([player_no], [login_time], [game_server_ip], [game_server_port], [login_server_name], [isp_id], [user_ip], [charge_type],[game_server_id], [charge_multiple_flag])
VALUES(@player_no, @login_time, @game_server_ip, @game_server_port, @login_server_name, @isp_id, @user_ip, @charge_type,@game_server_id, @charge_multiple_flag)
if @@error != 0
	begin
		rollback tran
		return -2
	end
else	
	return 0



GO
/****** Object:  StoredProcedure [dbo].[usp_insert_login_and_member_main]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_insert_login_and_member_main
 @目的簡述   : 新增遊戲帳號到Player_Login(FOR以分計費)
 @傳入參數   : @player_no, @login_time, @game_server_ip, @game_server_port, @login_server_name, @isp_id, @charge_type ,@game_server_id, @charge_multiple_flag
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-05-15
 @註 : 用來解決index time_out造成dead lock問題
           多傳一個flag表示是否做ip dup檢查
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_insert_login_and_member_main]
(
@player_no int ,
@account_no int, 
@login_time datetime, 
@game_server_ip int,
@game_server_port int, 
@login_server_name varchar(50) , 
@isp_id int, 
@user_ip int,
@charge_type tinyint,
@game_server_id int,
@charge_multiple int,
@ip_dup_flag int 
)
AS
declare @count int
if (@ip_dup_flag = 1)
	begin
		select @count = count(user_ip)  from Player_Login where user_ip = @user_ip and logout_time = '1900/1/1'
		if @count <> 0	
			return -1		
	end
begin tran
	INSERT INTO Player_Login([player_no], [login_time], [game_server_ip], [game_server_port], [login_server_name], [isp_id], [user_ip], [charge_type],[game_server_id], [charge_multiple_flag])
	VALUES(@player_no, @login_time, @game_server_ip, @game_server_port, @login_server_name, @isp_id, @user_ip, @charge_type,@game_server_id, @charge_multiple)
	if @@error != 0
		begin
			rollback tran
			return -2
		end
	update Member_Main set charge_multiple = @charge_multiple where account_no = @account_no
	if @@error  != 0
		begin
			rollback tran
			return -3
		end			
	else
		begin
			commit tran
			return 0
		end



GO
/****** Object:  StoredProcedure [dbo].[usp_joypass_rosecb]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/****** 物件:  預存程序 dbo.usp_joypass_rosecb    指令碼日期: 94/4/19 上午 11:24:58 ******/
/**********************************************************************
 @專案名稱   : JOYPASS
 @程序名稱   : usp_joypass_rosecb
 @目的簡述   : 將分給朋友的帳號的account_no設成99999的記號
 @傳入參數   : 
 @傳回參數   :成功:@player_no       失敗:0
 @錯誤代碼   :
 @author     : 胡舜慈
 @date       : 2005-4-22
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_joypass_rosecb] AS
declare @player_no int
	begin	
		select  top 1  @player_no =player_no  from player_data where (player_id between 'ROSETEST428631' and 'ROSETEST458630') and account_no ='0'
		if @player_no is not null 
			begin
				update player_data set account_no = '99999' where player_no = @player_no
				return @player_no
			end
		else
			return 0
			
	end



GO
/****** Object:  StoredProcedure [dbo].[usp_login_server_release_login_data]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_login_server_release_login_data
 @目的簡述   : 修改Player_Login裡遊戲帳號之登出時間
 @傳入參數   : @in_time, @server_name 
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-11-25
 註:2003.05.20修改-原update v_player_login改為update Player_Login
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_login_server_release_login_data]  
(
@in_time datetime, 
@server_name varchar(50) 
)
AS
update 	Player_Login
set 	logout_time = @in_time
where 	login_server_name = @server_name and
	logout_time = '1900/01/01'



GO
/****** Object:  StoredProcedure [dbo].[usp_login_server_release_login_data2]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_login_server_release_login_data2
 @目的簡述   : 將Player_Login裡遊戲帳號之process_state修改為2
 @傳入參數   : @server_name
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-11-25
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_login_server_release_login_data2]  
(
@server_name  varchar(50) 
)
AS
update 	Player_Login
set 	process_state = 2
where 	login_server_name = @server_name and 
	process_state = 1



GO
/****** Object:  StoredProcedure [dbo].[usp_logined_count]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_logined_count
 @目的簡述   : 計算目前在線上的遊戲帳號總數
 @傳入參數   : @player_no
 @傳回參數   : @result 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-11-25
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_logined_count]  
(
@player_no int, 
@result int output 
)
AS
SELECT @result = count(player_no)
FROM 	  Player_Login
WHERE  player_no = @player_no  and 
	  logout_time = '1900/01/01'



GO
/****** Object:  StoredProcedure [dbo].[usp_playaccount_create]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : JoyPark
 @程序名稱   : usp_playaccount_create
 @目的簡述   : 發帳號
 @傳入參數   : none
 @傳回參數   : @MemberMessage
 @錯誤代碼   : @@error
 @author         : 楊昌易
 @date            : 2002-11-21
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_playaccount_create]
AS
declare @i int, @account varchar(8)
declare @account_head char(4), @quantity int, @account_code varchar(8)
begin transaction
set @account_head='SWSG'
set @quantity=1500
                Set @i = 0
	while (@i <= @quantity - 1)
	begin
		
		Set @account = @account_head + right(Replace(str(@i),' ','0'),4)
		--Set @card_no = @card_game + @card_category + @card_number
		exec usp_card_getcode @account_code output
		--insert into Member_main(user_id , user_password) values(@account,@account_code)
		-- 設定試玩制為12 並加7天
	                insert into Player_Data (account_no,player_id,[password],charge_type,time_bound) 
		values (0,@account,@account_code,12,getdate()) 
		if @@error <> 0
		begin
			--close authors_cursor
			--deallocate authors_cursor
			goto errhandle
		end
		Set @i = @i + 1
	end
	--update Card_Category set isbuilt = 1 where category_id = @category_id
	--fetch next from authors_cursor into @category_id,@card_game,@card_category, @card_version, @quantity
commit transaction
--select @CardMessage = '成功'
return 0
errhandle:
rollback transaction
--select @CardMessage = '失敗'
return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_player_data]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_player_data
 @目的簡述   : 取出遊戲帳號資料
 @傳入參數   : @player_id
 @傳回參數   : 所有資料項
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-4-23
 @附註     : 本來是一項一項取出,改為取出所有field
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_player_data]
(
@player_id  varchar(50)
/*@player_id_output varchar(50) output,
@player_no int output, 
@account_no int output,
@password varchar(28) output, 
@charge_type tinyint output, 
@time_bound datetime output,
@login_state int output,
@point float output, 
@last_save_point int output,
@charge_multiple int output,
@total_time datetime output, 
@logout_time datetime output
*/
)
AS
--SELECT @player_no = player_no, @account_no = account_no,@password = password, @charge_type = charge_type, @time_bound = time_bound,@login_state = login_state,@point = point, @last_save_point = last_save_point,@charge_multiple = charge_multiple,@total_time = total_time, @logout_time = logout_time ,@player_id_output = player_id
SELECT *
FROM v_player_data
WHERE player_id = @player_id



GO
/****** Object:  StoredProcedure [dbo].[usp_player_logouted]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_player_logouted
 @目的簡述   : 取出目前在線上的遊戲帳號
 @傳入參數   : @player_id 
 @傳回參數   : @player_no, @user_ip, @isp_id, @player_ip 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-01-10
 @註: 2003-11-19修改:多判斷一個game server id
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_player_logouted]  
(
@player_id  char(50) ,
@game_server_id int, 
@player_no int output,
@user_ip int output, 
@isp_id int output, 
@player_ip int output
)
AS
select 	@player_no = player_no,@user_ip =user_ip, @isp_id = isp_id, @player_ip = user_ip
from 	v_player_login
where 	player_id = @player_id and
	game_server_id = @game_server_id and
	logout_time = '1900/1/1'



GO
/****** Object:  StoredProcedure [dbo].[usp_subtract_charge_multiple]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_subtract_charge_multiple
 @目的簡述   : 將會員帳號的charge_multiple - 1(用於當以分計費遊戲帳號登出時)
 @傳入參數   : @account_no
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-9
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_subtract_charge_multiple] 
(
@account_no int
)
AS
update 	Member_Main
set 	charge_multiple = charge_multiple - 1
where 	account_no = @account_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_last_logout_time]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_last_logout_time
 @目的簡述   : 修改遊戲帳號上次登出時間
 @傳入參數   : @player_no, @in_time
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-7
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_last_logout_time]
(
@player_no int,
@in_time datetime 
)
AS
update 	Player_Data
set 	last_logout_time = @in_time
where 	player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_login_failed]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_login_failed
 @目的簡述   : 修改遊戲帳號登入失敗的次數(將登入失敗次數 + 1)
 @傳入參數   : @player_no
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-11-25
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_login_failed]  
(
@player_no int 
)
AS
update 	Player_Data
set     	login_failed_number = login_failed_number + 1
where 	player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_login_time_and_multiple_flag]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_login_time_and_multiple_flag
 @目的簡述   : 修改遊戲帳號登入時間及charge_multiple_flag
 @傳入參數   : @player_no, @in_time, @charge_multiple_flag 
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-9
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_login_time_and_multiple_flag]  
(
@player_no int,
@in_time datetime,
@charge_multiple_flag int 
)
AS
update 	Player_Login
set	login_time = @in_time,
	charge_multiple_flag = @charge_multiple_flag
where 	player_no = @player_no and 
	logout_time = '1900/1/1'



GO
/****** Object:  StoredProcedure [dbo].[usp_update_logout_time]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_logout_time
 @目的簡述   : 修改遊戲帳號登出時間
 @傳入參數   : @game_server_id, @in_time, @player_no 
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-11-25
 註:2003.05.20修改-原update v_player_login改成update Player_Login
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_logout_time]  
(
@game_server_id int, 
@in_time datetime, 
@player_no int 
)
AS
update 	Player_Login
set 	logout_time = @in_time    
where 	game_server_id = @game_server_id and 
	logout_time = '1900/1/1' and 
	player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_logout_time_by_serverID]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_logout_time_by_serverID
 @目的簡述   : 修改遊戲帳號登出時間(所有從此game server登入的遊戲帳號 )
 @傳入參數   : @in_time, @game_server_id, 
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2002-11-25
 註:2003.05.20修改-原update v_player_login改為update Player_Login
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_logout_time_by_serverID]  
(
@in_time datetime,
@game_server_id int  
)
AS
update 	Player_Login
set 	logout_time = @in_time
where 	game_server_id = @game_server_id and
	logout_time = '1900/01/01'



GO
/****** Object:  StoredProcedure [dbo].[usp_update_member_main_point]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_member_main_point
 @目的簡述   : 修改遊戲帳號點數
 @傳入參數   : @account_no, @point 
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-7
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_member_main_point] 
(
@account_no int, 
@point float 
)
AS
update 	Member_Main
set 	point = @point
where 	account_no = @account_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_member_main_point_and_multiple]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_member_main_point_and_multiple
 @目的簡述   : 修改遊戲帳號點數及charge_multiple - 1
 @傳入參數   : @account_no, @point 
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-15
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_member_main_point_and_multiple] 
(
@account_no int, 
@point float 
)
AS
update 	Member_Main
set 	point = @point, 
	charge_multiple = charge_multiple - 1
where 	account_no = @account_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_point]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_point
 @目的簡述   : 將遊戲帳號的point 加上 last_save_point ,並傳出last_save_point值(寫log用)
 @傳入參數   : @account_no
 @傳回參數   : @last_save_point
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-6
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_point] 
(
@account_no int, 
@last_save_point float output 
)
AS
select 	@last_save_point = last_save_point
from 	Member_Main
where 	account_no = @account_no
update	Member_Main 
set 	point = point + last_save_point,
	last_save_point = 0
where 	account_no = @account_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_process_state]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_process_state
 @目的簡述   : 修改遊戲帳號的process_state(process_state用來判斷遊戲帳號的狀態)
 @傳入參數   : @player_no, @process_state, @o_year, @o_month, @o_day, @o_hour, @o_min, @o_sec
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-7
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_process_state] 
(
@player_no int, 
@process_state tinyint, 
@o_year int, 
@o_month int, 
@o_day int, 
@o_hour int, 
@o_min int, 
@o_sec int 
)
AS
update	Player_Login
set  	process_state = @process_state
where	player_no = @player_no and
	datepart(yy,logout_time) = @o_year and
	datepart(mm,logout_time) = @o_month and 
	datepart(dd,logout_time) = @o_day and 
	datepart(hh,logout_time) = @o_hour and 
	datepart(mi,logout_time) = @o_min and 
	datepart(ss,logout_time) = @o_sec



GO
/****** Object:  StoredProcedure [dbo].[usp_update_process_state_for_login]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_process_state_for_login
 @目的簡述   : 修改遊戲帳號的process state
 @傳入參數   : @player_no, @process_state
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-5-19
 註:2003.05.19新增此store procdeure.目地用於Login server改變遊戲帳號的process_state
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_process_state_for_login] 
(
@player_no int, 
@process_state int 
)
AS
update 	Player_Login
set 	process_state = @process_state
where 	player_no = @player_no and logout_time = '1900/1/1'



GO
/****** Object:  StoredProcedure [dbo].[usp_update_time_bound]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_time_bound
 @目的簡述   : 修改遊戲帳號的time_bound
 @傳入參數   : @player_no, @time_bound
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-7
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_time_bound] @player_no int, @time_bound datetime  AS
update 	Player_Data
set 	time_bound = @time_bound
where 	player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_update_total_time]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_update_total_time
 @目的簡述   : 修改遊戲帳號的total_time(for大陸)
 @傳入參數   : @player_no, @total_time
 @傳回參數   : 
 @錯誤代碼   :
 @author    : 黃莉雯
 @date      : 2003-1-7
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_update_total_time] 
(
@player_no int,
@total_time DateTime 
)
AS
update 	Player_Data
set 	total_time = @total_time
where 	player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_web_add_day]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   :AccountDB
 @程序名稱   : usp_web_add_day
 @目的簡述   : 針對player作扣點加天的動作
 @傳入參數   :  @play_no
 @傳回參數   : 
 @錯誤代碼   : 1無此帳號, 2非天數制, 3 --剩餘點數不足
 @author    : 吳東儒
 @date      : 2003-03-03
 @update    : 回傳碼改成正值 2003-04-01
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_add_day]
(
@player_no int
)
AS
declare @account_no int, @charge_type tinyint, @last_save_point int, @time_bound datetime
declare @add_days int, @point_lower_bound int
Select @account_no=account_no, @charge_type=charge_type, @time_bound = time_bound
from Player_Data where player_no = @player_no
if @account_no is null 
	return 1 --無此帳號
else
	begin
		Select @add_days=add_days, @point_lower_bound = point_lower_bound
		from Charge_Type_Rule where charge_type = @charge_type
		if (@add_days is null) or (@add_days=0)
			return 2 --非天數制
		else 
			begin
				Select @last_save_point=last_save_point from Member_Main where account_no = @account_no
				if @last_save_point < @point_lower_bound
					return 3 --剩餘點數不足
				else
					begin
						begin transaction
						Update Member_Main Set @last_save_point = last_save_point - @point_lower_bound 
						where account_no = @account_no 
						if @@error != 0 
							goto errhandle
						if @time_bound < getdate()
							begin
								Update Player_Data Set @time_bound = DATEADD(day,@add_days,getdate())
								where player_no = @player_no
								if @@error != 0 
									goto errhandle
							end
						else
							begin
								Update Player_Data Set @time_bound = DATEADD(day,@add_days,time_bound)
								where player_no = @player_no
								if @@error != 0 
									goto errhandle
							end
						commit transaction
						return 0
					end
			end
	end
errhandle:
	rollback transaction
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_adopt_player]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_adopt_player
 @目的簡述   : 認養帳號，修改Player_Date之account_no
 @傳入參數   : account_no, player_id, password
 @傳回參數   : 
 @錯誤代碼   : 1遊戲帳號密碼錯誤，2該帳號已有人認養(不為0), 3超出50個
 @author     : 楊昌易 (jay yang)
 @date       : 2003-02-18
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_adopt_player]
(
@account_no int,
@player_id varchar(50),
@password varchar(28),
@player_no int output
)
AS
--檢查主檔有無資料  沒有則新增
Exec usp_web_member_add @account_no
declare @total_player int
Select @total_player = count(*) from Player_Data where account_no = @account_no
if @total_player > 49 
	return 3 --超出50個遊戲帳號
declare @account_no1 int,@charge_type tinyint
declare @player_id1 varchar(50)
Select @account_no1=account_no,@player_no=player_no ,@charge_type=charge_type
from Player_Data where player_id=@player_id and [password]=dbo.udf_get_encrypt_pass(@player_id, @password)
if (@account_no1 is null) 
	return 1		  --遊戲帳號密碼錯誤
else
	Begin
		if @account_no1=0
			begin
				UPDATE Player_Data SET account_no =@account_no ,update_time=getdate()
				WHERE player_id=@player_id
				return 0   --認養成功
			end 
		else
			return 2  --帳號已有人認養
	End



GO
/****** Object:  StoredProcedure [dbo].[usp_web_boundle_cardopen]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : 各遊戲Account
 @程序名稱   : usp_web_boundle_cardopen
 @目的簡述   : 1.取出與傳入之charge_type對應的天數及點數 2.扣除Member_Main中的點數
	      3.檢查玩家到期日是否到期，尚未到期的就直接time_bound+天數，已經到期的就直接以今天的日期+天數
	      4.加入對應的天數
 @傳入參數   : @account_no, @play_no, @charge_type
 @傳回參數   : 
 @錯誤代碼   : 1：無此charge_type, 2：無此player_no, @@error
 @author    : 孫楚鈞
 @date      : 2003-2-24
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_boundle_cardopen]
(
@account_no int,
@player_no int,
@card_point int,
@add_day int,
@charge_type int
)
AS
declare  @time_bound varchar(25), @check_update int
Select @add_day=add_days from charge_type_rule where charge_type = @charge_type and online = 0
--判斷該charge_type是否有在charge_type_rule中
if (@add_day is null)
begin
	return 1 --無此charge_type
end
else
begin
	begin transaction
	--扣除Member_Main中相對應的點數
	update Member_Main set last_save_point = last_save_point - @card_point where account_no = @account_no
	if @@error <> 0
	begin
		goto errhandle
	end
	--select出該帳號的到期日
	select @time_bound=time_bound from player_data where player_no = @player_no
	if (@time_bound is null)
	begin
		return 2 --無此player_no
	end
	else
	begin
		--判斷到期日是否到期
		if (datediff(second,getdate(),cast(@time_bound as datetime)) > 0)
		begin
			set @time_bound = cast(@time_bound as datetime) + @add_day
		end
		else
		begin
			set @time_bound = getdate() + @add_day
		end
	end
	--加入對應的天數
	update player_data set time_bound = @time_bound where player_no = @player_no
	if @@error <> 0
	begin
		goto errhandle
	end
	--更改該玩家的制別
	Exec @check_update = usp_web_chargetype_update @player_no,@charge_type
	if (@check_update <> 0)
	begin
		goto errhandle
	end
	commit transaction
	
end
return 0 --成功
errhandle:
	if (@check_update <> 0)
	begin
		if (@check_update = -1)
		begin
			return -2 --無此player_no
		end
		else
		begin
			return @@error
		end
	end
	rollback transaction
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_charge_type]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_charge_type
 @目的簡述   : Select Charge_Type_Rule 之所有欄位供網頁使用
 @傳入參數   :
 @傳回參數   : 
 @錯誤代碼   :
 @author     : 吳東儒 (darren wu)
 @date       : 2003-02-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_charge_type]
AS
Select * from Charge_Type_Rule where online = 1



GO
/****** Object:  StoredProcedure [dbo].[usp_web_chargetype_update]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : 各遊戲Account
 @程序名稱   : usp_web_chargetype_update
 @目的簡述   : 1.更改玩家制別
 @傳入參數   : @play_no, @charge_type
 @傳回參數   : 
 @錯誤代碼   : 1：無此player_no, @@error
 @author    : 孫楚鈞 吳東儒
 @date      : 2003-2-25
 @修改: 寫入Player_Data_Log 由trigger替代
 	將試玩制 charge_type = 12的time_bound設為 getdate()  darren 2003-03-20
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_chargetype_update]
(
@player_no int,
@charge_type tinyint
)
AS
--判斷該player_no是否有在player_data中
declare @old_charge_type tinyint
Select @old_charge_type= charge_type from Player_Data where player_no = @player_no
if (@old_charge_type is not null)
begin
	--更改該玩家的制別 若是試玩制就直接改time_bound
	if @old_charge_type = 12 
		update Player_Data set charge_type=@charge_type,time_bound=getdate() where player_no = @player_no			
	else
		update Player_Data set charge_type=@charge_type where player_no=@player_no
	return 0 --成功	
end
else
	return 1 --無此player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_web_daily_process_suspended]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB 
 @程序名稱   : usp_web_daily_process_suspended
 @目的簡述   : 復權遊戲帳號
 @傳入參數   : player_no
 @傳回參數   : 0成功,1停權資料不存在
 @錯誤代碼   :
 @author     : 楊昌易 (jay yang)
 @date       : 2003-02-18
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_daily_process_suspended]
AS
if exists(Select * from v_process_daily_suspended)
begin
	Begin transaction		
	--修改玩家資訊 
	update v_process_daily_suspended set charge_type=v_suspend_type
	if @@error<>0
		goto NeedRollBack
	delete Suspended_User where player_no in (Select player_no from v_process_daily_suspended)
	if @@error<>0
		goto NeedRollBack
	COMMIT TRANSACTION
	Return 0
NeedRollBack:
	ROLLBACK TRANSACTION
	return @@error
end
return 0



GO
/****** Object:  StoredProcedure [dbo].[usp_web_dfdivert_addpoint]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   :AccountDB
 @程序名稱   : usp_web_dfdivert_addpoint
 @目的簡述   : 將df移轉過來的點數累加
 @傳入參數   :  @account_no
 @傳回參數   : 
 @錯誤代碼   : 無此會員帳號,@@error
 @author    : 孫楚鈞
 @date      : 2004-03-25
 @update    : none
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_dfdivert_addpoint]
(
@account_no int,
@last_save_point int
)
AS
declare @account_id int
Select @account_id=account_no from member_main where account_no = @account_no
if @account_id is null 
	begin
	return 1 --無此會員帳號
	end
else
	begin
	begin transaction
	update member_main set last_save_point = last_save_point + @last_save_point where account_no = @account_no
	if @@error <> 0 
	begin
		goto errhandle
	end
	commit transaction
	return 0
	end
errhandle:
	rollback transaction
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_isonline]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_isonline
 @目的簡述   : 判別玩家是否在線上
 @傳入參數   : player_no
 @傳回參數   : 
 @錯誤代碼   : 1 在線上 
 @author     : 吳東儒 (darren wu)
 @date       : 2003-04-16
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_isonline]
(
@player_no int
)
AS
if exists (Select * from Player_Login where player_no = @player_no and logout_time='1900-01-01')
	return 1 --在線上
else
	return 0



GO
/****** Object:  StoredProcedure [dbo].[usp_web_member]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_member
 @目的簡述   : Select Member_Main 之所有欄位
 @傳入參數   : account_no
 @傳回參數   : 
 @錯誤代碼   :
 @author     : 吳東儒 (darren wu)
 @date       : 2003-02-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_member]
(
@account_no int
)AS
Select * from Member_Main where account_no = @account_no



GO
/****** Object:  StoredProcedure [dbo].[usp_web_member_add]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_member_add
 @目的簡述   : 新增會員帳號，檢查有無存在，若不存在則自動新增
 @傳入參數   : account_no
 @傳回參數   : 0 帳號已存在，不需新增；1帳號不存在，並已經自動加入
 @錯誤代碼   :
 @author     : 楊昌易 (jay yang)
 @date       : 2003-02-18
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_member_add]
(
@account_no int
)
AS
if exists (Select * from Member_Main where account_no=@account_no)  
	return 0 --帳號已存在
else
	Begin
		--無資料,新增會員帳號
		insert into Member_Main(account_no,create_time)
		values (@account_no,getdate())
  		return 1
	End



GO
/****** Object:  StoredProcedure [dbo].[usp_web_member_player]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_member_player
 @目的簡述   : Select 會員之所有游戲帳號 之相關欄位
 @傳入參數   : account_no
 @傳回參數   : 
 @錯誤代碼   :
 @author     : 吳東儒 (darren wu)
 @date       : 2003-02-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_member_player] 
(
@account_no int
)
AS
SELECT         dbo.Player_Data.player_no, dbo.Player_Data.account_no, 
                          dbo.Player_Data.player_id, dbo.Player_Data.[password], 
                          dbo.Player_Data.charge_type, dbo.Charge_Type_Rule.[type_name], 
                          dbo.Player_Data.last_logout_time, dbo.Player_Data.time_bound, 
                          dbo.Player_Data_Email.player_email
FROM             dbo.Player_Data INNER JOIN
                          dbo.Charge_Type_Rule ON 
                          dbo.Player_Data.charge_type = dbo.Charge_Type_Rule.charge_type LEFT OUTER
                           JOIN
                          dbo.Player_Data_Email ON 
                          dbo.Player_Data.player_no = dbo.Player_Data_Email.player_no
Where dbo.Player_Data.account_no = @account_no



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_player
 @目的簡述   : Select 游戲帳號 之相關欄位
 @傳入參數   : player_no
 @傳回參數   : 
 @錯誤代碼   :
 @author     : 吳東儒 (darren wu)
 @date       : 2003-02-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player] 
(
@player_no int
)
AS
SELECT         dbo.Player_Data.player_no, dbo.Player_Data.account_no, 
                          dbo.Player_Data.player_id, dbo.Player_Data.[password], 
                          dbo.Player_Data.charge_type, dbo.Charge_Type_Rule.[type_name], 
                          dbo.Player_Data.last_logout_time, dbo.Player_Data.time_bound, 
                          dbo.Player_Data_Email.player_email
FROM             dbo.Player_Data INNER JOIN
                          dbo.Charge_Type_Rule ON 
                          dbo.Player_Data.charge_type = dbo.Charge_Type_Rule.charge_type LEFT OUTER
                           JOIN
                          dbo.Player_Data_Email ON 
                          dbo.Player_Data.player_no = dbo.Player_Data_Email.player_no
Where dbo.Player_Data.player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_add]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_player_add
 @目的簡述   : 新增遊戲帳號，預設是試玩制
 @傳入參數   : account_no, player_id, password, player_email(account_no=0才需要此欄位)
 @傳回參數   : 0新增成功,1帳號重複, 2超出50個遊戲帳號
 @錯誤代碼   :
 @author     : 楊昌易 (jay yang)
 @date       : 2003-02-18
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_add]
(
@account_no int,
@player_id varchar(50),
@password varchar(40),
@player_email varchar(100),
@player_no int output
)
AS
--檢查主檔有無帳號 沒有則自動加入
Exec usp_web_member_add @account_no
if @account_no != 0 
begin
	declare @total_player int
	Select @total_player = count(*) from Player_Data where account_no = @account_no
	if @total_player > 49 
		return 2 --超出50個遊戲帳號
End
if exists (Select * from Player_Data where player_id=@player_id)
	return 1 -- 帳號重複
Else
	Begin
		Begin transaction
		-- 設定試玩制為12 並加7天
		Set @password = dbo.udf_get_encrypt_pass(@player_id, @password)
	        insert into Player_Data (account_no,player_id,[password],charge_type,time_bound) 
		values (@account_no,@player_id,@password,12,DATEADD(day,7,getdate())) 
		IF @@error <> 0 
			GOTO NeedRollBack
		Select @player_no=player_no from Player_Data where player_id=@player_id
		/* 用Trigger方式來寫入log 2003-03-07  
		INSERT INTO Player_Data_Log (player_no, log_type, charge_type, update_time)
		VALUES(@player_no,1,12,getdate())
		IF @@error <> 0 
			GOTO NeedRollBack */
		if @account_no=0 --若是無頭試玩帳號則寫入email
			Begin
				INSERT INTO Player_Data_Email (player_no, player_email)
				VALUES (@player_no,@player_email)
				IF @@error <> 0 
					GOTO NeedRollBack
			End
		COMMIT TRANSACTION
	                return 0   		
	End	 
NeedRollBack:
	ROLLBACK TRANSACTION
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_add_day]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : AccountDB
 @程序名稱   : usp_web_player_add_day
 @目的簡述   : 針對player作扣點加天的動作
 @傳入參數   : @play_no @discount_point @add_days
 @傳回參數   : 
 @錯誤代碼   : 1無此帳號, 2剩餘點數不足
 @author    : 吳東儒
 @date      : 2004-06-15
 @update    : 
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_add_day]
(
	@player_no int,
	@discount_point int,
	@add_days int
)
AS
declare @account_no int, @charge_type tinyint, @time_bound datetime
Select @account_no=account_no, @charge_type=charge_type, @time_bound = time_bound
from Player_Data where player_no = @player_no
if (@account_no is null) or (@account_no = 0)
	return 1 --無此帳號
else
	begin
		declare @total_point int
		Select @total_point=last_save_point+point from Member_Main where account_no = @account_no
		if @total_point < @discount_point
			return 2 --剩餘點數不足
		else
			begin
				begin transaction 
				declare @delta_point int, @tmpStr nvarchar(50)
				Set @delta_point = -@discount_point
				Set @tmpStr = '扣點加'+CAST(@add_days as nvarchar(5))+'天'
				Exec usp_web_update_member_point @account_no, @delta_point, 5, @tmpStr
				if @@error != 0 
					goto errhandle
				if @time_bound < getdate()
					begin
						Update Player_Data Set time_bound = DATEADD(day,@add_days,getdate())
						where player_no = @player_no
						if @@error != 0 
							goto errhandle
					end
				else
					begin
						Update Player_Data Set time_bound = DATEADD(day,@add_days,time_bound)
						where player_no = @player_no
						if @@error != 0 
							goto errhandle
					end
				commit transaction
				return 0
			end
	end
errhandle:
	rollback transaction
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_banned]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB 
 @程序名稱   : usp_web_player_banned
 @目的簡述   : 新增停權帳號
 @傳入參數   : player_no, gm_name,cause, charge_type1(charge_type1<>0 or charge_type1<=100)
	       charge_type2(charge_type2=0 or charge_type2>100)
 @傳回參數   : 0新增成功,1停權資料已存在
 @錯誤代碼   :
 @author     : 楊昌易 (jay yang)
 @date       : 2003-02-18
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_banned]
(
@player_no int,
@gm_name varchar(50),
@charge_type1 int,
@charge_type2 int,
@cause varchar(100)
)
AS
if @charge_type2=0	 -- 永久停權
	BEGIN
		
		--紀錄永久停權 
		if exists (select player_no from Banned_User where player_no=@player_no)
                                               return 1
		else
			begin
				Begin transaction
				INSERT INTO Banned_User (player_no, game_master_name, charge_type, cause) VALUES
				 (@player_no,@gm_name,@charge_type1,@cause)
				IF @@error <> 0 
				GOTO NeedRollBack
				--修改玩家資訊 
				UPDATE Player_Data SET charge_type =@charge_type2, update_time =getdate() WHERE (player_no = @player_no)
				COMMIT TRANSACTION
				Return 0
			end 
	END
Else	               -- 一般停權
	BEGIN
		--紀錄原制別
		if exists (select player_no from Suspended_User where player_no=@player_no)
                                               return 1
		else
			begin
				Begin transaction
				INSERT INTO Suspended_User (player_no, game_master_name, charge_type, cause) VALUES
				 (@player_no,@gm_name,@charge_type1,@cause)
				IF @@error <> 0 
				GOTO NeedRollBack
				--修改玩家資訊 
				UPDATE Player_Data SET charge_type =@charge_type2, update_time =getdate() WHERE (player_no = @player_no)
				COMMIT TRANSACTION
				Return 0
			end
	END
NeedRollBack:
	ROLLBACK TRANSACTION
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_chkduplicate]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_player_chkduplicate
 @目的簡述   : 檢查遊戲帳號是否重複
 @傳入參數   : player_id
 @傳回參數   : 0無, 1帳號重複
 @錯誤代碼   :
 @author     : darren
 @date       : 2003-04-10
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_chkduplicate]
(
	@player_id varchar(50)
)
AS
if exists(Select * from Player_Data where player_id=@player_id)
	return 1
else
	return 0



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_create]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : JoyPark
 @程序名稱   : usp_web_player_create
 @目的簡述   : 發帳號
 @傳入參數   : none
 @傳回參數   : @MemberMessage
 @錯誤代碼   : @@error
 @author     : 楊昌易
 @date       : 2004-11-04 (粒粒魚改寫)
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_create]
(
	@account_game 	varchar(10) ,
	@start_no	int,
	@end_no		int
)
AS
declare @i int, @account varchar(20), @account_code varchar(8)
begin transaction
        Set @i = @start_no
	while (@i <= @end_no)
	begin
		
		Set @account = @account_game + right(replace(str(@i),' ','0'), len(@end_no))
		exec usp_card_getcode @account_code output
		-- 設定試玩制為12 並加 7 天
                insert into Player_Data (account_no,player_id,[password],charge_type,time_bound) 
		values (0,@account,@account_code,12,getdate()) 
		if @@error <> 0
		begin
			goto errhandle
		end
		Set @i = @i + 1
	end
commit transaction
return 0
errhandle:
rollback transaction
return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_de_banned]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB 
 @程序名稱   : usp_web_player_de_banned
 @目的簡述   : 復權遊戲帳號
 @傳入參數   : player_no
 @傳回參數   : 0成功,1停權資料不存在
 @錯誤代碼   :
 @author     : 楊昌易 (jay yang)
 @date       : 2003-02-18
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_de_banned]
(
@player_no int,
@charge_type int
)
AS
IF @charge_type<>0
		Begin
			declare @charge_type1 int
			Select @charge_type1=charge_type from v_player_suspended where player_no=@player_no
			If (@charge_type1 is null)
				return 1 -- 停權資料不存在	
			Else
				BEGIN
					Begin transaction		
					--修改玩家資訊 
					UPDATE Player_Data SET charge_type =@charge_type1, update_time =getdate() WHERE (player_no = @player_no)
					DELETE Suspended_User WHERE player_no=@player_no
					COMMIT TRANSACTION
					Return 0
				END
		End
ELSE
	Begin
			declare @charge_type2 int
			Select @charge_type2=charge_type from v_player_banned where player_no=@player_no
			If (@charge_type2 is null)
				return 1 -- 停權資料不存在	
			Else
				BEGIN
					Begin transaction		
					--修改玩家資訊 
					UPDATE Player_Data SET charge_type =@charge_type2, update_time =getdate() WHERE (player_no = @player_no)
					DELETE Banned_User WHERE player_no=@player_no
					COMMIT TRANSACTION
					Return 0
				END
		End
NeedRollBack:
	ROLLBACK TRANSACTION
	return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_log]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_player_log
 @目的簡述   : Select 游戲帳號 之修改紀錄
 @傳入參數   : player_no
 @傳回參數   : 
 @錯誤代碼   :
 @author     : 吳東儒 (darren wu)
 @date       : 2003-02-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_log] 
(
@player_no int
)
AS
SELECT         dbo.Player_Data_Log.player_no, dbo.Player_Data_Log.log_type, 
                          dbo.Player_Data_Log_Type.[type_name], dbo.Player_Data_Log.charge_type, 
                          dbo.Charge_Type_Rule.[type_name] AS charge_name, 
                          dbo.Player_Data_Log.update_time,dbo.Player_Data_Log.memo
FROM             dbo.Player_Data_Log INNER JOIN
                          dbo.Player_Data_Log_Type ON 
                          dbo.Player_Data_Log.log_type = dbo.Player_Data_Log_Type.log_type INNER JOIN
                          dbo.Charge_Type_Rule ON 
                          dbo.Player_Data_Log.charge_type = dbo.Charge_Type_Rule.charge_type
Where dbo.Player_Data_Log.player_no = @player_no



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_merge]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   :	JoyPark
 @程序名稱   :	usp_web_player_merge
 @目的簡述   :	合併遊戲帳號 - 遊戲端
 @傳回參數   :	無
 @author     :	蔡孟哲
 @date       :	2003-4-25
 		將密碼加密 darren 2005-05-17
' *********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_merge]
(
	@account_no		int,		--新會員編號
	@player_no		int,		--舊會員編號
	@player_id		varchar(50),	--舊會員帳號
	@player_password	varchar(50),	--舊會員密碼
	@game_point		float,		--原 Game 點數
	@charge_type		tinyint,	--原 Game 制別
	@time_bound		smalldatetime	--原 Game 到期日
)
AS
SET NOCOUNT ON
	-- 檢查是否有合併 --
	if not exists(select * from Player_Data where player_no = @player_no)
	begin
		-- 會員點數寫入
		if not exists(select * from Member_Main where account_no = @account_no)
			insert into Member_Main (account_no, accumulate_point, point) 
			values (@account_no, @game_point, @game_point)
		else
			update Member_Main set accumulate_point = accumulate_point + @game_point, point = point + @game_point
			where account_no = @account_no
		-- 遊戲帳號寫入
		
		Set @player_password = dbo.udf_get_encrypt_pass(@player_id, @player_password)
		
		Set IDENTITY_INSERT [Player_Data] ON
		insert into Player_Data (player_no, account_no, player_id, [password], charge_type, time_bound)
		values (@player_no, @account_no, @player_id, @player_password, @charge_type, @time_bound)
		Set IDENTITY_INSERT [Player_Data] OFF		
	end



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_password_query]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_player_password_query
 @目的簡述   : 由player_id回傳密碼及email
 @傳入參數   : 
 @傳回參數   : 
 @錯誤代碼   : 
 @author     : 吳東儒 (darren wu)
 @date       : 2003-04-01
		改成重設定密碼並回傳 增加account_no參數查詢 darren 2005-05-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_password_query]
(
	@account_no int,
	@player_id varchar(50),
	@return_new_pass varchar(40) output
)
AS
declare @player_id1 varchar(50), @newPass varchar(40)
Select @player_id1=player_id From Player_Data 
Where account_no = @account_no and player_id = @player_id
if (@player_id1 is null) return 1
-----取得新密碼------------------------------------
declare @k int, @AllWord varchar(50)
Set @AllWord = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
Set @k = 0
Set @newPass = ''
While (@k<8)
begin
	Set @newPass = @newPass + substring(@AllWord,CAST((rand()*35)+1 as int),1)
	Set @k = @k + 1
end
Set @return_new_pass = @newPass
Set @newPass = dbo.udf_get_encrypt_pass(@player_id1, @newPass)
--------------------------------------------
Update Player_Data Set [password]=@newPass 
where account_no = @account_no and player_id = @player_id
return 0



GO
/****** Object:  StoredProcedure [dbo].[usp_web_player_password_update]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_player_password_update
 @目的簡述   : 修改遊戲帳號密碼
 @傳入參數   : player_id, oldpassword, newpassword
 @傳回參數   : 
 @錯誤代碼   : 1帳號密碼錯誤
 @author     : 吳東儒 (darren wu)
 @date       : 2003-02-17 
 @update     : 改成由player_id來修改密碼 (因應前端網站修改方式)
               增加會員改密碼存log功能 darren 2005-01-03
		作密碼加密 2005-05-17
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_player_password_update]
(
@player_id varchar(50),
@old_password varchar(50),
@new_password varchar(50),
@user_ip varchar(20)
)
AS
Declare @player_no int, @charge_type tinyint, @original_oldpass varchar(50)
declare @player_id1 varchar(50), @password1 varchar(40), @enPass varchar(40)
Select @player_id1=player_id, @password1=[password],
       @player_no=player_no, @charge_type=charge_type
From Player_Data where player_id = @player_id 
if (@player_no is null) return 1
Set @enPass = dbo.udf_get_encrypt_pass(@player_id1, @old_password)
if (@enPass<>@password1) return 1
begin transaction
	Update Player_Data set [password] = dbo.udf_get_encrypt_pass(@player_id1, @new_password)
	where player_no=@player_no 
	if (@@error<>0) goto errHandle
	insert into Player_Data_Log (player_no, log_type, charge_type, update_time, memo)
	values (@player_no, 5, @charge_type, getdate(), @user_ip)
	if (@@error<>0) goto errHandle
commit transaction
return 0
errHandle:
rollback transaction
return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_update_member_point]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/*****************************************************************
建立日期:	2003/08/20
建立者:		darren
最後修改日期:	
最後修改者:	
功能:		更新會員的點數, log_type=1 為儲值
流程:
錯誤代碼:	@@error
*****************************************************************/
CREATE PROCEDURE [dbo].[usp_web_update_member_point]
(
	@account_no int, 
	@point int,
	@log_type tinyint,
	@memo nvarchar(50)
)
AS
declare @accumulate_point int
--不管會員有無存在自動加入
exec usp_web_member_add @account_no
begin transaction	
	--記錄Log
	insert into MemberPoint_Log(account_no, point, log_type, memo) 
	values (@account_no, @point, @log_type, @memo)
		
	if (@@error!=0) goto errHandle
	--更新會員的資料
	if (@point>0)
		begin
			update Member_Main 
			set last_save_point = last_save_point + @point,
	      		accumulate_point = accumulate_point + @point, 
	      		update_time = getdate()
			where account_no = @account_no
		end
	else
		begin
			update Member_Main 
			set last_save_point = last_save_point + @point,
	      		update_time = getdate()
			where account_no = @account_no
		end
		
	if (@@error!=0) goto errHandle
--跑到這表示成功啦
commit transaction
return 0
errHandle:
rollback transaction
return @@error



GO
/****** Object:  StoredProcedure [dbo].[usp_web_update_point_old]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


--------------------------------------------------------------------------
-- 建立日期: 2003/01/24
-- 建立者:Roy
-- 最後修改日期: 2003/03/13
-- 最後修改者:alexlin
-- 功能: 更新玩家的儲值點數
-- 流程:
-- 錯誤代碼:
-- -1:帳號不存在 (改由程式自動加)
-- 2:記錄Log失敗
-- 3:更新玩家資料失敗
--------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[usp_web_update_point_old]  @account_no int, @point int
as
declare @accumulate_point int
declare @user_exist int
	--不管有無存在自動加入
	exec usp_web_member_add @account_no
        /*--查詢帳號是否存在
	select @user_exist = count(*) from member_main where account_no = @account_no
	if @user_exist <= 0 
	begin
		return -1	
	end */
	--begin tran					
		--記錄Log
		insert into UpdatePoint_Log(Account_No,Save_Point) 
		values(@account_no,@point)
		
		if @@error != 0
		begin 
			--rollback tran
			return 2
		end
		--更新會員的資料
		update member_main 
		set last_save_point =  last_save_point + @point,
		      accumulate_point = accumulate_point + @point, 
		      update_time = getdate()
		where account_no = @account_no
		
		if @@error != 0
		begin 
			--rollback tran
			return 3
		end
	--commit tran
	return 0



GO
/****** Object:  StoredProcedure [dbo].[usp_web_verifypwd]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


/**********************************************************************
 @專案名稱   : Account DB
 @程序名稱   : usp_web_verifypwd
 @目的簡述   : 驗證遊戲帳號密碼
 @傳入參數   : 
 @傳回參數   : 
 @錯誤代碼   : 1 帳號密碼錯誤
 @author     : 吳東儒 (darren wu)
 @date       : 2003-03-28
' **********************************************************************/
CREATE PROCEDURE [dbo].[usp_web_verifypwd]
(
@player_id varchar(50),
@password varchar(28),
@player_no int output
)
AS
declare @player_no1 int, @player_id1 varchar(50), @password1 varchar(50)
Select @player_id1=player_id, @password1=[password], @player_no1=player_no from Player_Data where player_id=@player_id 
if @player_no1 is null
	return 1 --帳號密碼錯誤
Else
 begin
	declare @enPass varchar(40) 
	Set @enPass = dbo.udf_get_encrypt_pass(@player_id1, @password)
	if (@enPass = @password1)
		begin
			Set @player_no = @player_no1
			return 0
		end
	else
		begin
			return 1		
		end 
 end



GO
/****** Object:  StoredProcedure [dbo].[ws_CharDELETE]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[ws_CharDELETE]
	@szCharName	nvarchar(30)
AS
	DECLARE @del_error1 int;
	DECLARE @del_error2 int;
	DECLARE @del_error3 int;
	DECLARE @del_error4 int;
	
	DECLARE @iCharID	int;
	
	-- 삭제할 캐릭터 ID얻기
	SELECT @iCharID=intCharID from tblGS_AVATAR where txtNAME = @szCharName;
	IF @@ROWCOUNT <= 0 
		RETURN -1;
	-- 트랜잭션 시작
	BEGIN TRAN del_char
	
	DELETE from tblWS_FRIEND WHERE intCharID = @iCharID;
	SET @del_error1 = @@ERROR;
	
	DELETE FROM tblGS_AVATAR WHERE txtNAME=@szCharName;
	SET @del_error2 = @@ERROR;
	
	DELETE FROM tblWS_MEMO   WHERE txtNAME=@szCharName;
	SET @del_error3 = @@ERROR;

	DELETE FROM tblWS_ClanCHAR WHERE txtCharNAME=@szCharName;
	SET @del_error4 = @@ERROR;
	
	IF @del_error1 = 0 AND @del_error2 = 0 AND @del_error3 = 0 AND @del_error4 = 0
	BEGIN
		COMMIT TRAN del_char;
		RETURN 0;
	END
	
	ROLLBACK TRAN del_char;
	RETURN -2;




GO
/****** Object:  StoredProcedure [dbo].[ws_ClanBinUPDATE]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ws_ClanBinUPDATE]
	@iClanID	int,
	@binDAT	binary(1024)
AS
	BEGIN TRAN upt_data

	UPDATE tblWS_CLAN SET binDATA=@binDAT WHERE intID = @iClanID;

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN upt_data;
		RETURN 0;
	END
	
	COMMIT TRAN upt_data;
	RETURN 1;




GO
/****** Object:  StoredProcedure [dbo].[ws_ClanCharADD]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[ws_ClanCharADD]
	@szCharName	nchar(30),
	@iClanID	int,
	@iClanPOS	int
AS
	SELECT intClanID FROM tblWS_ClanCHAR where txtCharNAME=@szCharName;
	IF @@ROWCOUNT >= 1
		RETURN -1;
		
	BEGIN TRAN ins_char
	INSERT tblWS_ClanCHAR (txtCharNAME, intClanID, intPOS ) VALUES( @szCharName, @iClanID, @iClanPOS );
		
	IF @@ERROR = 0
	BEGIN
		COMMIT TRAN ins_char;
		RETURN 0;
	END
	
	ROLLBACK TRAN ins_char;
	RETURN -2;








GO
/****** Object:  StoredProcedure [dbo].[ws_ClanCharADJ]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ws_ClanCharADJ]
	@iType		int,
	@szCharName	nchar(30),
	@iAdjPoint	int,
	@iAdjPos	int,
	@iAdjRewardPoint	int
AS
	DECLARE	@iCurPoint	int;
	DECLARE	@iCurPos	int;
	DECLARE	@iCurRewardPoint	int;
	
	SELECT @iCurPoint=intPOINT, @iCurPos=intPOS, @iCurRewardPoint=intRewardPoint FROM tblWS_ClanCHAR where txtCharNAME=@szCharName;
	IF @@ROWCOUNT <> 1
		RETURN -1;
		
	BEGIN TRAN upd_char

	-- 값 세팅 모드
	IF @iType = 0
	BEGIN
		-- -1일 경우 기존 값 보전
		IF @iAdjPoint > 0
			SET @iCurPoint = @iAdjPoint;
		ELSE
			SET @iCurPoint = @iCurPoint;

		-- -1일 경우 기존 값 보전
		IF @iAdjPos > 0
			SET @iCurPos = @iAdjPos;
		ELSE
			SET @iCurPos = @iCurPos;

		-- -1일 경우 기존 값 보전
		IF @iAdjRewardPoint > 0
			SET @iCurRewardPoint = @iAdjRewardPoint;
		ELSE
			SET @iCurRewardPoint = @iCurRewardPoint;
	END

	-- 더하기 모드
	IF @iType = 1
	BEGIN
		SET @iCurPoint = @iCurPoint + @iAdjPoint;
		SET @iCurPos   = @iCurPos	+ @iAdjPos;
		SET @iCurRewardPoint = @iCurRewardPoint + @iAdjRewardPoint;
	END

	UPDATE tblWS_ClanCHAR SET intPOINT=@iCurPoint, intPOS=@iCurPos, intRewardPoint=@iCurRewardPoint where txtCharNAME=@szCharName;

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN upd_char;
		RETURN -2;
	END

	COMMIT TRAN upd_char;

	SELECT intPOINT, intPOS, intRewardPoint FROM tblWS_ClanCHAR where txtCharNAME=@szCharName;
	IF @@ROWCOUNT <> 1
		RETURN -1;

	RETURN 0;
GO
/****** Object:  StoredProcedure [dbo].[ws_ClanCharALL]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO







CREATE PROCEDURE [dbo].[ws_ClanCharALL]
	@iClanID	int
AS
	SELECT txtCharNAME, intPOINT, intPOS, intRewardPOINT from tblWS_ClanCHAR where intClanID = @iClanID;
	-- RETURN @@ROWCOUNT;
GO
/****** Object:  StoredProcedure [dbo].[ws_ClanCharDEL]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[ws_ClanCharDEL]
	@szCharName	nchar(30)
AS
	SELECT intClanID FROM tblWS_ClanCHAR where txtCharNAME=@szCharName;
	IF @@ROWCOUNT < 1
		RETURN -1;		-- not found
		
	BEGIN TRAN del_char
	DELETE from tblWS_ClanCHAR where txtCharNAME = @szCharName;
		
	IF @@ERROR = 0
	BEGIN
		COMMIT TRAN del_char;
		RETURN 0;
	END
	
	ROLLBACK TRAN del_char;
	RETURN -2;			-- db error








GO
/****** Object:  StoredProcedure [dbo].[ws_ClanCharGET]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO







CREATE PROCEDURE [dbo].[ws_ClanCharGET]
	@szCharName	nchar(30)
AS
	SELECT intClanID, intPOINT, intPOS, intRewardPOINT from tblWS_ClanCHAR where txtCharNAME = @szCharName;
GO
/****** Object:  StoredProcedure [dbo].[ws_ClanDELETE]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[ws_ClanDELETE]
	@szClanName	nvarchar(20)
AS
	DECLARE @del_error1 int;
	DECLARE @del_error2 int;
	
	DECLARE @iClanID	int;
	
	-- 삭제된 클렌ID얻기
	SELECT @iClanID=intID from tblWS_CLAN where txtNAME = @szClanName;
	IF @@ROWCOUNT <= 0 
		RETURN -1;
		
	BEGIN TRAN del_clan
	
	DELETE from tblWS_ClanCHAR where intClanID = @iClanID
	SET @del_error1 = @@ERROR;
		
	DELETE from tblWS_CLAN where intID = @iClanID;--txtNAME = @szClanName;
	SET @del_error2 = @@ERROR;
		
	IF @del_error1 = 0 AND @del_error2 = 0
	BEGIN
		COMMIT TRAN del_clan;
		SELECT @iClanID;
		RETURN 0;
	END
	
	ROLLBACK TRAN del_clan
	RETURN -2;








GO
/****** Object:  StoredProcedure [dbo].[ws_ClanINSERT]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[ws_ClanINSERT]
	@szClanName	nvarchar(20),
	@szClanDesc	nvarchar(255),
	@iMark1	int,
	@iMark2	int
AS
		SELECT intID FROM tblWS_CLAN WHERE txtNAME=@szClanNAME;
	IF @@ROWCOUNT >= 1
		RETURN -1;
	
	BEGIN TRAN ins_clan
	INSERT tblWS_CLAN (txtNAME, txtDESC, intMarkIdx1, intMarkIdx2) VALUES(
				@szClanName,
				@szClanDesc,
				@iMark1,
				@iMark2 );

	IF @@ERROR = 0
	BEGIN
		COMMIT TRAN ins_clan;
		SELECT intID FROM tblWS_CLAN WHERE txtNAME=@szClanName;
		RETURN 0;
	END
	
	ROLLBACK TRAN ins_clan
	RETURN -2;



GO
/****** Object:  StoredProcedure [dbo].[ws_ClanMarkUPDATE]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ws_ClanMarkUPDATE]
	@iClanID		int,
	@iDataCRC	int,
	@iDataLEN	int,
	@binDATA	binary(1024)
AS
	BEGIN TRAN upt_mark

	DECLARE @dateCur	datetime;
	DECLARE @intRowCount int ;

	SET @dateCur = getdate();

	UPDATE tblWS_CLAN SET intMarkCRC=@iDataCRC, intMarkLEN=@iDataLEN, binMARK=@binDATA, dateMarkREG=@dateCur  
	WHERE (intID = @iClanID AND dateMarkREG IS NULL) OR (intID = @iClanID AND @dateCur > DATEADD(day,7,dateMarkREG)) ;

	set @intRowCount = @@ROWCOUNT

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN upt_mark;
		RETURN -1;
	END
	
	COMMIT TRAN upt_mark;
	RETURN @intRowCount;




GO
/****** Object:  StoredProcedure [dbo].[ws_ClanMOTD]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[ws_ClanMOTD]
	@iClanID	int,
	@szMessage	nvarchar(368)
AS

	BEGIN TRAN upd_clan
	
	UPDATE tblWS_CLAN SET txtMSG=@szMessage where intID = @iClanID;
		
	IF @@ERROR = 0
	BEGIN
		COMMIT TRAN upd_clan;
		RETURN 0;
	END
	
	ROLLBACK TRAN upd_clan
	RETURN -1;








GO
/****** Object:  StoredProcedure [dbo].[ws_ClanSELECT]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[ws_ClanSELECT]
	@iClanID	int
AS
	SELECT * from tblWS_CLAN where intID = @iClanID;








GO
/****** Object:  StoredProcedure [dbo].[ws_ClanSLOGAN]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ws_ClanSLOGAN]
	@iClanID	int,
	@szMessage	nvarchar(255)
AS

	BEGIN TRAN upd_clan
	
	UPDATE tblWS_CLAN SET txtDESC=@szMessage where intID = @iClanID;
		
	IF @@ERROR = 0
	BEGIN
		COMMIT TRAN upd_clan;
		RETURN 0;
	END
	
	ROLLBACK TRAN upd_clan
	RETURN -1;

GO
/****** Object:  StoredProcedure [dbo].[ws_ClanUPDATE]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE PROCEDURE [dbo].[ws_ClanUPDATE]
	@iClanID	int,
	@szField	varchar(20),
	@iAdjValue	int
AS
	DECLARE	@szQry varchar(500)
	
	SET @szQry = 'UPDATE tblWS_CLAN SET ' + @szField + ' = ' + @szField + ' + ' + cast(@iAdjValue as varchar) + ' WHERE intID= ' + cast ( @iClanID as varchar )
	
	BEGIN TRAN upt_clan
	EXEC (  @szQry )
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN upt_clan;
		RETURN 0;
	END
	
	COMMIT TRAN upt_clan;
	
	SET @szQry = 'SELECT ' + @szField + ' FROM tblWS_CLAN WHERE intID= ' + cast ( @iClanID as varchar )
	EXEC ( @szQry  )
	RETURN 1;




GO
/****** Object:  StoredProcedure [dbo].[ws_CreateCHAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_CreateCHAR]
	@szAccount	nvarchar(20),
	@szCharName	nvarchar(30),
	@bbBE		binary(96),
	@bbBI		binary(32),
	@bbBA		binary(48),
	@bbGA		binary(384),
	@bbSA		binary(384),
	@bbINV	binary(2048)
AS
	INSERT tblGS_AVATAR (txtACCOUNT, txtNAME, binBasicE, binBasicI, binBasicA, binGrowA, binSkillA, blobINV) VALUES(
			@szAccount,
			@szCharName,
			@bbBE,
			@bbBI,
			@bbBA,
			@bbGA,
			@bbSA,
			@bbINV)



GO
/****** Object:  StoredProcedure [dbo].[ws_DeleteCHAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_DeleteCHAR]
	@szCharName	nvarchar(30),
	@iCharID	int
AS
	DELETE FROM tblWS_FRIEND WHERE intCharID=@iCharID;
	DELETE FROM tblGS_AVATAR WHERE txtNAME=@szCharName;
	DELETE FROM tblWS_MEMO   WHERE txtNAME=@szCharName;



GO
/****** Object:  StoredProcedure [dbo].[ws_DelMEMO]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_DelMEMO]
	@szName	nvarchar(30),
	@nCnt		int
AS
	DELETE FROM tblWS_MEMO WHERE (intSN IN (SELECT TOP  5  intSN FROM tblWS_MEMO WHERE txtNAME=@szName ORDER BY dwDATE ASC))








GO
/****** Object:  StoredProcedure [dbo].[ws_GetCharID]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_GetCharID]
	@szCharName	nvarchar(30)
AS
	SELECT intCharID FROM  tblGS_AVATAR WHERE txtNAME=@szCharName;








GO
/****** Object:  StoredProcedure [dbo].[ws_GetCharLIST]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_GetCharLIST]
@szAccount	nvarchar(30)
AS
	SELECT txtNAME, binBasicE, binBasicI, binGrowA, dwDelTIME, intDataVER FROM tblGS_AVATAR WHERE txtACCOUNT=@szAccount

GO
/****** Object:  StoredProcedure [dbo].[ws_GetFRIEND]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_GetFRIEND]
	@iCharIDX	int
AS
	SELECT intFriendCNT, blobFRIENDS FROM tblWS_FRIEND WHERE intCharID=@iCharIDX








GO
/****** Object:  StoredProcedure [dbo].[ws_GetMEMO]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_GetMEMO]
	@szName	nvarchar(30)
AS
	SELECT TOP 5  dwDATE, txtFROM, txtMEMO FROM tblWS_MEMO WHERE txtNAME=@szName ORDER BY dwDATE ASC








GO
/****** Object:  StoredProcedure [dbo].[ws_SelectCHAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE PROCEDURE [dbo].[ws_SelectCHAR]
	@szCharName	nvarchar(30)
AS
	SELECT txtACCOUNT, binBasicE, intCharID FROM tblGS_AVATAR WHERE txtNAME=@szCharName



GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_MAINCALL_IP]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[CHECK_MAINCALL_IP] ()  
RETURNS INT AS  
BEGIN
declare @total INT, @u_count int
SELECT   @total = count(user_ip)
from dbo.Player_Login
where isp_id  <> 0 and logout_time = '1900/1/1'
SELECT    @u_count = count(distinct user_ip)
from dbo.Player_Login
where isp_id  <> 0 and logout_time = '1900/1/1'
return @total - @u_count
END



GO
/****** Object:  UserDefinedFunction [dbo].[MD5]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5 
* Description: MD5 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5]( 
     @sOrigMess    NVARCHAR(4000) 
) 
RETURNS CHAR(32) 
-- WITH ENCRYPTION 
AS 
BEGIN 
    --==================================== 
    DECLARE @S11 TINYINT 
    DECLARE @S12 TINYINT 
    DECLARE @S13 TINYINT 
    DECLARE @S14 TINYINT 
    DECLARE @S21 TINYINT 
    DECLARE @S22 TINYINT 
    DECLARE @S23 TINYINT 
    DECLARE @S24 TINYINT 
    DECLARE @S31 TINYINT 
    DECLARE @S32 TINYINT 
    DECLARE @S33 TINYINT 
    DECLARE @S34 TINYINT 
    DECLARE @S41 TINYINT 
    DECLARE @S42 TINYINT 
    DECLARE @S43 TINYINT 
    DECLARE @S44 TINYINT 
    SELECT @S11 = 7, @S12 = 12, @S13 = 17, @S14 = 22 
    SELECT @S21 = 5, @S22 = 9, @S23 = 14, @S24 = 20 
    SELECT @S31 = 4, @S32 = 11, @S33 = 16, @S34 = 23 
    SELECT @S41 = 6, @S42 = 10, @S43 = 15, @S44 = 21 
    --==================================== 
    DECLARE @a INT 
    DECLARE @b INT 
    DECLARE @c INT 
    DECLARE @d INT 
    DECLARE @AA    INT 
    DECLARE @BB    INT 
    DECLARE @CC    INT 
    DECLARE @DD    INT 
    SELECT   @a = 0x67452301 
            ,@b = 0xEFCDAB89 
            ,@c = 0x98BADCFE 
            ,@d = 0x10325476 
    --==================================== 
    DECLARE @sRes    VARCHAR(32) 
    SET @sRes = '' 
    DECLARE @iWordArrayLen        INT 
    DECLARE @iWordArrayCount    INT 
    DECLARE @tTmp TABLE([ID] INT, [Word] INT) 
    INSERT INTO @tTmp SELECT * FROM dbo.MD5_ConvertToWordArray(@sOrigMess) 
    SELECT @iWordArrayCount=0, @iWordArrayLen = COUNT(*) FROM @tTmp 
    WHILE(@iWordArrayCount < @iWordArrayLen) 
    BEGIN 
        SELECT @AA = @a, @BB = @b, @CC = @c, @DD = @d 
        SELECT @a = dbo.MD5_FF(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 0), @S11, 0xD76AA478) 
        SELECT @d = dbo.MD5_FF(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 1), @S12, 0xE8C7B756) 
        SELECT @c = dbo.MD5_FF(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 2), @S13, 0x242070DB) 
        SELECT @b = dbo.MD5_FF(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 3), @S14, 0xC1BDCEEE) 
        SELECT @a = dbo.MD5_FF(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 4), @S11, 0xF57C0FAF) 
        SELECT @d = dbo.MD5_FF(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 5), @S12, 0x4787C62A) 
        SELECT @c = dbo.MD5_FF(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 6), @S13, 0xA8304613) 
        SELECT @b = dbo.MD5_FF(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 7), @S14, 0xFD469501) 
        SELECT @a = dbo.MD5_FF(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 8), @S11, 0x698098D8) 
        SELECT @d = dbo.MD5_FF(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 9), @S12, 0x8B44F7AF) 
        SELECT @c = dbo.MD5_FF(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 10), @S13, 0xFFFF5BB1) 
        SELECT @b = dbo.MD5_FF(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 11), @S14, 0x895CD7BE) 
        SELECT @a = dbo.MD5_FF(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 12), @S11, 0x6B901122) 
        SELECT @d = dbo.MD5_FF(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 13), @S12, 0xFD987193) 
        SELECT @c = dbo.MD5_FF(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 14), @S13, 0xA679438E) 
        SELECT @b = dbo.MD5_FF(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 15), @S14, 0x49B40821) 
        SELECT @a = dbo.MD5_GG(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 1), @S21, 0xF61E2562) 
        SELECT @d = dbo.MD5_GG(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 6), @S22, 0xC040B340) 
        SELECT @c = dbo.MD5_GG(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 11), @S23, 0x265E5A51) 
        SELECT @b = dbo.MD5_GG(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 0), @S24, 0xE9B6C7AA) 
        SELECT @a = dbo.MD5_GG(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 5), @S21, 0xD62F105D) 
        SELECT @d = dbo.MD5_GG(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 10), @S22, 0x2441453) 
        SELECT @c = dbo.MD5_GG(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 15), @S23, 0xD8A1E681) 
        SELECT @b = dbo.MD5_GG(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 4), @S24, 0xE7D3FBC8) 
        SELECT @a = dbo.MD5_GG(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 9), @S21, 0x21E1CDE6) 
        SELECT @d = dbo.MD5_GG(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 14), @S22, 0xC33707D6) 
        SELECT @c = dbo.MD5_GG(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 3), @S23, 0xF4D50D87) 
        SELECT @b = dbo.MD5_GG(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 8), @S24, 0x455A14ED) 
        SELECT @a = dbo.MD5_GG(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 13), @S21, 0xA9E3E905) 
        SELECT @d = dbo.MD5_GG(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 2), @S22, 0xFCEFA3F8) 
        SELECT @c = dbo.MD5_GG(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 7), @S23, 0x676F02D9) 
        SELECT @b = dbo.MD5_GG(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 12), @S24, 0x8D2A4C8A) 
        SELECT @a = dbo.MD5_HH(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 5), @S31, 0xFFFA3942) 
        SELECT @d = dbo.MD5_HH(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 8), @S32, 0x8771F681) 
        SELECT @c = dbo.MD5_HH(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 11), @S33, 0x6D9D6122) 
        SELECT @b = dbo.MD5_HH(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 14), @S34, 0xFDE5380C) 
        SELECT @a = dbo.MD5_HH(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 1), @S31, 0xA4BEEA44) 
        SELECT @d = dbo.MD5_HH(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 4), @S32, 0x4BDECFA9) 
        SELECT @c = dbo.MD5_HH(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 7), @S33, 0xF6BB4B60) 
        SELECT @b = dbo.MD5_HH(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 10), @S34, 0xBEBFBC70) 
        SELECT @a = dbo.MD5_HH(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 13), @S31, 0x289B7EC6) 
        SELECT @d = dbo.MD5_HH(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 0), @S32, 0xEAA127FA) 
        SELECT @c = dbo.MD5_HH(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 3), @S33, 0xD4EF3085) 
        SELECT @b = dbo.MD5_HH(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 6), @S34, 0x4881D05) 
        SELECT @a = dbo.MD5_HH(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 9), @S31, 0xD9D4D039) 
        SELECT @d = dbo.MD5_HH(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 12), @S32, 0xE6DB99E5) 
        SELECT @c = dbo.MD5_HH(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 15), @S33, 0x1FA27CF8) 
        SELECT @b = dbo.MD5_HH(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 2), @S34, 0xC4AC5665) 
        SELECT @a = dbo.MD5_II(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 0), @S41, 0xF4292244) 
        SELECT @d = dbo.MD5_II(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 7), @S42, 0x432AFF97) 
        SELECT @c = dbo.MD5_II(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 14), @S43, 0xAB9423A7) 
        SELECT @b = dbo.MD5_II(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 5), @S44, 0xFC93A039) 
        SELECT @a = dbo.MD5_II(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 12), @S41, 0x655B59C3) 
        SELECT @d = dbo.MD5_II(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 3), @S42, 0x8F0CCC92) 
        SELECT @c = dbo.MD5_II(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 10), @S43, 0xFFEFF47D) 
        SELECT @b = dbo.MD5_II(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 1), @S44, 0x85845DD1) 
        SELECT @a = dbo.MD5_II(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 8), @S41, 0x6FA87E4F) 
        SELECT @d = dbo.MD5_II(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 15), @S42, 0xFE2CE6E0) 
        SELECT @c = dbo.MD5_II(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 6), @S43, 0xA3014314) 
        SELECT @b = dbo.MD5_II(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 13), @S44, 0x4E0811A1) 
        SELECT @a = dbo.MD5_II(@a, @b, @c, @d, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 4), @S41, 0xF7537E82) 
        SELECT @d = dbo.MD5_II(@d, @a, @b, @c, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 11), @S42, 0xBD3AF235) 
        SELECT @c = dbo.MD5_II(@c, @d, @a, @b, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 2), @S43, 0x2AD7D2BB) 
        SELECT @b = dbo.MD5_II(@b, @c, @d, @a, (SELECT [Word] FROM @tTmp WHERE [ID] = @iWordArrayCount + 9), @S44, 0xEB86D391) 
        SET @a = dbo.MD5_AddUnsigned(@a, @AA) 
        SET @b = dbo.MD5_AddUnsigned(@b, @BB) 
        SET @c = dbo.MD5_AddUnsigned(@c, @CC) 
        SET @d = dbo.MD5_AddUnsigned(@d, @DD) 
        SET @iWordArrayCount = @iWordArrayCount + 16 
    END 
    SET @sRes = dbo.MD5_WordToHex(@a) + dbo.MD5_WordToHex(@b) + dbo.MD5_WordToHex(@c) + dbo.MD5_WordToHex(@d) 
    SET @sRes = LOWER(@sRes) 
    RETURN(@sRes) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_AddUnsigned]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_AddUnsigned 
* Description: MD5_AddUnsigned 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_AddUnsigned]( 
     @iX        INT 
    ,@iY        INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    DECLARE @iRes    BIGINT 
    SET @iRes = CAST(CAST(@iX AS BINARY(8)) AS BIGINT) + CAST(CAST(@iY AS BINARY(8)) AS BIGINT) 
    RETURN(CAST(@iRes & 0x00000000FFFFFFFF AS BINARY(4))) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_ConvertToWordArray]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_ConvertToWordArray 
* Description: MD5_ConvertToWordArray 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_ConvertToWordArray]( 
     @sOrigMess        VARCHAR(8000)    = '' 
) 
RETURNS @tWordArray TABLE([ID] INT IDENTITY(0,1),[Word] INT) 
-- WITH ENCRYPTION 
AS 
BEGIN 
    IF @sOrigMess IS NULL 
        SET @sOrigMess = '' 
    DECLARE @iLenOfMess            INT 
    DECLARE @iWordArrayLen        INT 
    DECLARE @iPosOfWord            INT 
    DECLARE @iPosOfMess            INT 
    DECLARE @iCountOfWord        INT 
    SET @iLenOfMess = LEN(@sOrigMess) 
    SET @iWordArrayLen = ((@iLenOfMess + 8)/64 + 1) * 16 
    SET @iCountOfWord = 0 
    WHILE(@iCountOfWord<@iWordArrayLen) 
    BEGIN 
        INSERT INTO @tWordArray([Word]) VALUES(0) 
        SET @iCountOfWord = @iCountOfWord + 1 
    END 
    SELECT @iPosOfMess = 0, @iPosOfWord = 0, @iCountOfWord = 0 
    WHILE(@iPosOfMess < @iLenOfMess) 
    BEGIN 
        SELECT @iCountOfWord = @iPosOfMess / 4, @iPosOfWord = @iPosOfMess % 4 
        UPDATE @tWordArray 
            SET [Word] = [Word] | dbo.MD5_LShift(UNICODE(SUBSTRING(@sOrigMess,@iPosOfMess+1,1)),@iPosOfWord*8) 
            WHERE [ID] = @iCountOfWord 
        SET @iPosOfMess = @iPosOfMess + 1 
    END 
     
    SELECT @iCountOfWord = @iPosOfMess / 4, @iPosOfWord = @iPosOfMess % 4 
    UPDATE @tWordArray 
        SET [Word] = [Word] | dbo.MD5_LShift(0x80,@iPosOfWord*8) 
        WHERE [ID] = @iCountOfWord 
    UPDATE @tWordArray 
        SET [Word] = [Word] | dbo.MD5_LShift(@iLenOfMess,3) 
        WHERE [ID] = @iWordArrayLen - 2 
    UPDATE @tWordArray 
        SET [Word] = [Word] | dbo.MD5_RShift(@iLenOfMess,29) 
        WHERE [ID] = @iWordArrayLen - 1 
    RETURN 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_F]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_F 
* Description: MD5_F 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_F]( 
     @x        INT 
    ,@y        INT 
    ,@z        INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    RETURN((@x & @y) | ((~@x) & @z)) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_FF]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_FF 
* Description: MD5_FF 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_FF]( 
     @a        INT 
    ,@b        INT 
    ,@c        INT 
    ,@d        INT 
    ,@x        INT 
    ,@s     INT 
    ,@ac    INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    SET @a = dbo.MD5_AddUnsigned(@a, dbo.MD5_AddUnsigned(dbo.MD5_AddUnsigned(dbo.MD5_F(@b, @c, @d), @x), @ac)) 
    SET @a = dbo.MD5_RotateLeft(@a, @s) 
    SET @a = dbo.MD5_AddUnsigned(@a, @b) 
    RETURN(@a) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_G]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_G 
* Description: MD5_G 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_G]( 
     @x        INT 
    ,@y        INT 
    ,@z        INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    RETURN((@x & @z) | (@y & (~@z))) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_GG]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_GG 
* Description: MD5_GG 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_GG]( 
     @a        INT 
    ,@b        INT 
    ,@c        INT 
    ,@d        INT 
    ,@x        INT 
    ,@s     INT 
    ,@ac    INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    SET @a = dbo.MD5_AddUnsigned(@a, dbo.MD5_AddUnsigned(dbo.MD5_AddUnsigned(dbo.MD5_G(@b, @c, @d), @x), @ac)) 
    SET @a = dbo.MD5_RotateLeft(@a, @s) 
    SET @a = dbo.MD5_AddUnsigned(@a, @b) 
    RETURN(@a) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_H]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_H 
* Description: MD5_H 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_H]( 
     @x        INT 
    ,@y        INT 
    ,@z        INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    RETURN(@x ^ @y ^ @z) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_HH]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_HH 
* Description: MD5_HH 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_HH]( 
     @a        INT 
    ,@b        INT 
    ,@c        INT 
    ,@d        INT 
    ,@x        INT 
    ,@s     INT 
    ,@ac    INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    SET @a = dbo.MD5_AddUnsigned(@a, dbo.MD5_AddUnsigned(dbo.MD5_AddUnsigned(dbo.MD5_H(@b, @c, @d), @x), @ac)) 
    SET @a = dbo.MD5_RotateLeft(@a, @s) 
    SET @a = dbo.MD5_AddUnsigned(@a, @b) 
    RETURN(@a) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_I]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_I 
* Description: MD5_I 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_I]( 
     @x        INT 
    ,@y        INT 
    ,@z        INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    RETURN(@y ^ (@x | (~@z))) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_II]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_II 
* Description: MD5_II 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_II]( 
     @a        INT 
    ,@b        INT 
    ,@c        INT 
    ,@d        INT 
    ,@x        INT 
    ,@s     INT 
    ,@ac    INT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    SET @a = dbo.MD5_AddUnsigned(@a, dbo.MD5_AddUnsigned(dbo.MD5_AddUnsigned(dbo.MD5_I(@b, @c, @d), @x), @ac)) 
    SET @a = dbo.MD5_RotateLeft(@a, @s) 
    SET @a = dbo.MD5_AddUnsigned(@a, @b) 
    RETURN(@a) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_LShift]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_LShift 
* Description: MD5_LShift 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_LShift]( 
     @iValue        INT 
    ,@iShiftBits    TINYINT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    DECLARE @iRes    BIGINT 
    SET @iRes = CAST(@iValue AS BINARY(8)) 
    SET @iRes = @iRes * dbo.MD5_m_2Power(@iShiftBits) 
    RETURN(CAST(@iRes & 0x00000000FFFFFFFF AS BINARY(4))) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_m_2Power]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_m_2Power 
* Description: 常?? 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_m_2Power]( 
    @i    TINYINT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    DECLARE @iRes    INT 
    SELECT @iRes = 
        CASE @i 
            WHEN 0  THEN 1            -- 00000000000000000000000000000001 
            WHEN 1  THEN 2            -- 00000000000000000000000000000010 
            WHEN 2  THEN 4            -- 00000000000000000000000000000100 
            WHEN 3  THEN 8            -- 00000000000000000000000000001000 
            WHEN 4  THEN 16           -- 00000000000000000000000000010000 
            WHEN 5  THEN 32           -- 00000000000000000000000000100000 
            WHEN 6  THEN 64           -- 00000000000000000000000001000000 
            WHEN 7  THEN 128          -- 00000000000000000000000010000000 
            WHEN 8  THEN 256          -- 00000000000000000000000100000000 
            WHEN 9  THEN 512          -- 00000000000000000000001000000000 
            WHEN 10 THEN 1024         -- 00000000000000000000010000000000 
            WHEN 11 THEN 2048         -- 00000000000000000000100000000000 
            WHEN 12 THEN 4096         -- 00000000000000000001000000000000 
            WHEN 13 THEN 8192         -- 00000000000000000010000000000000 
            WHEN 14 THEN 16384        -- 00000000000000000100000000000000 
            WHEN 15 THEN 32768        -- 00000000000000001000000000000000 
            WHEN 16 THEN 65536        -- 00000000000000010000000000000000 
            WHEN 17 THEN 131072       -- 00000000000000100000000000000000 
            WHEN 18 THEN 262144       -- 00000000000001000000000000000000 
            WHEN 19 THEN 524288       -- 00000000000010000000000000000000 
            WHEN 20 THEN 1048576      -- 00000000000100000000000000000000 
            WHEN 21 THEN 2097152      -- 00000000001000000000000000000000 
            WHEN 22 THEN 4194304      -- 00000000010000000000000000000000 
            WHEN 23 THEN 8388608      -- 00000000100000000000000000000000 
            WHEN 24 THEN 16777216     -- 00000001000000000000000000000000 
            WHEN 25 THEN 33554432     -- 00000010000000000000000000000000 
            WHEN 26 THEN 67108864     -- 00000100000000000000000000000000 
            WHEN 27 THEN 134217728    -- 00001000000000000000000000000000 
            WHEN 28 THEN 268435456    -- 00010000000000000000000000000000 
            WHEN 29 THEN 536870912    -- 00100000000000000000000000000000 
            WHEN 30 THEN 1073741824   -- 01000000000000000000000000000000 
            ELSE 0 
        END 
    RETURN(@iRes) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_m_OnBits]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_m_OnBits 
* Description: 常?? 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_m_OnBits]( 
    @i    TINYINT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    DECLARE @iRes    INT 
    SELECT @iRes = 
        CASE @i 
            WHEN 0  THEN 1            -- 00000000000000000000000000000001 
            WHEN 1  THEN 3            -- 00000000000000000000000000000011 
            WHEN 2  THEN 7            -- 00000000000000000000000000000111 
            WHEN 3  THEN 15           -- 00000000000000000000000000001111 
            WHEN 4  THEN 31           -- 00000000000000000000000000011111 
            WHEN 5  THEN 63           -- 00000000000000000000000000111111 
            WHEN 6  THEN 127          -- 00000000000000000000000001111111 
            WHEN 7  THEN 255          -- 00000000000000000000000011111111 
            WHEN 8  THEN 511          -- 00000000000000000000000111111111 
            WHEN 9  THEN 1023         -- 00000000000000000000001111111111 
            WHEN 10 THEN 2047         -- 00000000000000000000011111111111 
            WHEN 11 THEN 4095         -- 00000000000000000000111111111111 
            WHEN 12 THEN 8191         -- 00000000000000000001111111111111 
            WHEN 13 THEN 16383        -- 00000000000000000011111111111111 
            WHEN 14 THEN 32767        -- 00000000000000000111111111111111 
            WHEN 15 THEN 65535        -- 00000000000000001111111111111111 
            WHEN 16 THEN 131071       -- 00000000000000011111111111111111 
            WHEN 17 THEN 262143       -- 00000000000000111111111111111111 
            WHEN 18 THEN 524287       -- 00000000000001111111111111111111 
            WHEN 19 THEN 1048575      -- 00000000000011111111111111111111 
            WHEN 20 THEN 2097151      -- 00000000000111111111111111111111 
            WHEN 21 THEN 4194303      -- 00000000001111111111111111111111 
            WHEN 22 THEN 8388607      -- 00000000011111111111111111111111 
            WHEN 23 THEN 16777215     -- 00000000111111111111111111111111 
            WHEN 24 THEN 33554431     -- 00000001111111111111111111111111 
            WHEN 25 THEN 67108863     -- 00000011111111111111111111111111 
            WHEN 26 THEN 134217727    -- 00000111111111111111111111111111 
            WHEN 27 THEN 268435455    -- 00001111111111111111111111111111 
            WHEN 28 THEN 536870911    -- 00011111111111111111111111111111 
            WHEN 29 THEN 1073741823   -- 00111111111111111111111111111111 
            WHEN 30 THEN 2147483647   -- 01111111111111111111111111111111 
            ELSE 0 
        END 
    RETURN(@iRes) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_RotateLeft]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_RotateLeft 
* Description: MD5_RotateLeft 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_RotateLeft]( 
     @iValue        INT 
    ,@iShiftBits    TINYINT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    RETURN(dbo.MD5_LShift(@iValue, @iShiftBits) | dbo.MD5_RShift(@iValue, (32 - @iShiftBits))) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_RShift]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_RShift 
* Description: MD5_RShift 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_RShift]( 
     @iValue        INT 
    ,@iShiftBits    TINYINT 
) 
RETURNS INT 
-- WITH ENCRYPTION 
AS 
BEGIN 
    DECLARE @iRes    BIGINT 
    SET @iRes = CAST(@iValue AS BINARY(8)) 
    SET @iRes = @iRes / dbo.MD5_m_2Power(@iShiftBits) 
    RETURN(CAST(@iRes & 0x00000000FFFFFFFF AS BINARY(4))) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[MD5_WordToHex]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************** 
* Name: MD5_WordToHex 
* Description: MD5_WordToHex 
*****************************************************************************/ 
CREATE FUNCTION [dbo].[MD5_WordToHex]( 
     @iValue        INT 
) 
RETURNS CHAR(8) 
-- WITH ENCRYPTION 
AS 
BEGIN 
    DECLARE @sRes    VARCHAR(8) 
    DECLARE @iTmp    INT 
    DECLARE @iCount TINYINT 
    SELECT @sRes = '', @iCount = 0 
    WHILE(@iCount<4) 
    BEGIN 
        SET @iTmp = dbo.MD5_RShift(@iValue,@iCount*8) & 0x000000FF 
        SET @sRes = @sRes + CASE @iTmp / 16 WHEN 0  THEN '0' 
                                            WHEN 1  THEN '1' 
                                            WHEN 2  THEN '2' 
                                            WHEN 3  THEN '3' 
                                            WHEN 4  THEN '4' 
                                            WHEN 5  THEN '5' 
                                            WHEN 6  THEN '6' 
                                            WHEN 7  THEN '7' 
                                            WHEN 8  THEN '8' 
                                            WHEN 9  THEN '9' 
                                            WHEN 10 THEN 'A' 
                                            WHEN 11 THEN 'B' 
                                            WHEN 12 THEN 'C' 
                                            WHEN 13 THEN 'D' 
                                            WHEN 14 THEN 'E' 
                                            WHEN 15 THEN 'F' 
                                            ELSE '' END 
                          + CASE @iTmp % 16 WHEN 0 THEN '0' 
                                            WHEN 1  THEN '1' 
                                            WHEN 2  THEN '2' 
                                            WHEN 3  THEN '3' 
                                            WHEN 4  THEN '4' 
                                            WHEN 5  THEN '5' 
                                            WHEN 6  THEN '6' 
                                            WHEN 7  THEN '7' 
                                            WHEN 8  THEN '8' 
                                            WHEN 9  THEN '9' 
                                            WHEN 10 THEN 'A' 
                                            WHEN 11 THEN 'B' 
                                            WHEN 12 THEN 'C' 
                                            WHEN 13 THEN 'D' 
                                            WHEN 14 THEN 'E' 
                                            WHEN 15 THEN 'F' 
                                            ELSE '' END 
        SET @iCount = @iCount + 1 
    END 
    RETURN(@sRes) 
END 



GO
/****** Object:  UserDefinedFunction [dbo].[udf_hex_to_number]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[udf_hex_to_number]
(
	@c char(1)
)  
RETURNS int AS  
BEGIN
	declare @n int
	Set @n = Case @c 
		WHEN '0'  THEN 0 
		WHEN '1'  THEN 1 
		WHEN '2'  THEN 2 
		WHEN '3'  THEN 3 
		WHEN '4'  THEN 4 
		WHEN '5'  THEN 5 
		WHEN '6'  THEN 6 
		WHEN '7'  THEN 7 
		WHEN '8'  THEN 8 
		WHEN '9'  THEN 9 
		WHEN 'a' THEN 10 
		WHEN 'b' THEN 11 
		WHEN 'c' THEN 12 
		WHEN 'd' THEN 13 
		WHEN 'e' THEN 14 
		WHEN 'f' THEN 15 
		ELSE 0 END 
	return(@n)
END



GO
/****** Object:  UserDefinedFunction [dbo].[udf_number_to_hex]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE FUNCTION [dbo].[udf_number_to_hex]
(
	@N int
)  
RETURNS char(1) AS  
BEGIN
	declare @chr char(1)
	Set @chr = Case @N % 16 
		WHEN 0  THEN '0' 
		WHEN 1  THEN '1' 
		WHEN 2  THEN '2' 
		WHEN 3  THEN '3' 
		WHEN 4  THEN '4' 
		WHEN 5  THEN '5' 
		WHEN 6  THEN '6' 
		WHEN 7  THEN '7' 
		WHEN 8  THEN '8' 
		WHEN 9  THEN '9' 
		WHEN 10 THEN 'a' 
		WHEN 11 THEN 'b' 
		WHEN 12 THEN 'c' 
		WHEN 13 THEN 'd' 
		WHEN 14 THEN 'e' 
		WHEN 15 THEN 'f' 
		ELSE '' END 
	return(@chr)
END



GO
/****** Object:  Table [dbo].[Member_Main]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member_Main](
	[account_no] [int] NOT NULL,
	[accumulate_point] [int] NOT NULL,
	[point] [float] NOT NULL,
	[last_save_point] [int] NOT NULL,
	[create_time] [datetime] NULL,
	[update_time] [datetime] NULL,
	[charge_multiple] [int] NOT NULL,
 CONSTRAINT [PK_Member_Main] PRIMARY KEY CLUSTERED 
(
	[account_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemberPoint_Log]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPoint_Log](
	[pointlog_no] [int] IDENTITY(1,1) NOT NULL,
	[account_no] [int] NOT NULL,
	[point] [int] NOT NULL,
	[log_type] [tinyint] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[memo] [nvarchar](50) NULL,
 CONSTRAINT [PK_MemberPoint_Log] PRIMARY KEY CLUSTERED 
(
	[pointlog_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemberPoint_LogType]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPoint_LogType](
	[log_type] [tinyint] NOT NULL,
	[type_name] [nvarchar](20) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_MemberPoint_LogType] PRIMARY KEY CLUSTERED 
(
	[log_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Player_Login]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Player_Login](
	[player_no] [int] NOT NULL,
	[login_time] [datetime] NOT NULL,
	[game_server_ip] [int] NOT NULL,
	[game_server_port] [int] NOT NULL,
	[logout_time] [datetime] NOT NULL,
	[process_state] [tinyint] NOT NULL,
	[login_server_name] [varchar](50) NOT NULL,
	[isp_id] [int] NOT NULL,
	[user_ip] [int] NOT NULL,
	[game_server_id] [int] NOT NULL,
	[charge_type] [tinyint] NOT NULL,
	[charge_multiple_flag] [int] NOT NULL,
 CONSTRAINT [PK_Member_Login_Table] PRIMARY KEY CLUSTERED 
(
	[player_no] ASC,
	[logout_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recommend]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recommend](
	[recommend_no] [int] IDENTITY(1,1) NOT NULL,
	[player_id] [varchar](50) NOT NULL,
	[recommend_player_id] [varchar](50) NOT NULL,
	[game_id] [varchar](10) NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_Recommend] PRIMARY KEY CLUSTERED 
(
	[recommend_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suspended_User]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suspended_User](
	[player_no] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[game_master_name] [nvarchar](50) NOT NULL,
	[charge_type] [tinyint] NOT NULL,
	[cause] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCART]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCART](
	[intID] [bigint] IDENTITY(1,1) NOT NULL,
	[dateREG] [datetime] NULL,
	[txtACCOUNT] [nvarchar](30) NOT NULL,
	[nItemTYPE] [smallint] NOT NULL,
	[nItemNO] [smallint] NOT NULL,
	[nDupCNT] [smallint] NOT NULL,
	[txtFromACC] [nvarchar](30) NULL,
	[txtFromCHAR] [nvarchar](30) NULL,
	[txtToCHAR] [nvarchar](30) NULL,
	[txtDESC] [nvarchar](80) NULL,
	[txtFromIP] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGS_AVATAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_AVATAR](
	[intCharID] [int] IDENTITY(1,1) NOT NULL,
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[txtNAME] [nvarchar](30) NOT NULL,
	[btLEVEL] [smallint] NULL,
	[intMoney] [bigint] NULL,
	[dwRIGHT] [int] NULL,
	[binBasicE] [binary](96) NOT NULL,
	[binBasicI] [binary](32) NOT NULL,
	[binBasicA] [binary](48) NOT NULL,
	[binGrowA] [binary](384) NOT NULL,
	[blobQUEST] [binary](1274) NULL,
	[blobINV] [binary](3088) NOT NULL,
	[binHotICON] [binary](96) NULL,
	[binJobSkill] [binary](120) NULL,
	[binPatsSkill] [binary](60) NULL,
	[binUniqueSkill] [binary](60) NULL,
	[binCoolTime] [binary](80) NULL,
	[dwDelTIME] [int] NULL,
	[binWishLIST] [binary](420) NULL,
	[dwOPTION] [int] NULL,
	[intJOB] [smallint] NOT NULL,
	[dwRegTIME] [int] NOT NULL,
	[dwPartyIDX] [int] NULL,
	[dwItemSN] [int] NULL,
	[intDataVER] [smallint] NOT NULL,
	[binMileageSkill] [binary](400) NULL,
	[paymentFlag] [smallint] NOT NULL,
 CONSTRAINT [PK_tblGS_AVATAR] PRIMARY KEY CLUSTERED 
(
	[txtNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_AVATAR_0]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_AVATAR_0](
	[intCharID] [int] IDENTITY(1,1) NOT NULL,
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[txtNAME] [nvarchar](30) NOT NULL,
	[btLEVEL] [smallint] NULL,
	[intMoney] [bigint] NULL,
	[dwRIGHT] [int] NULL,
	[binBasicE] [binary](96) NOT NULL,
	[binBasicI] [binary](32) NOT NULL,
	[binBasicA] [binary](48) NOT NULL,
	[binGrowA] [binary](384) NOT NULL,
	[binSkillA] [binary](384) NOT NULL,
	[blobQUEST] [binary](1024) NULL,
	[blobINV] [binary](2248) NOT NULL,
	[binHotICON] [binary](96) NULL,
	[binPatsEquip] [binary](100) NULL,
	[binMileageInv] [binary](900) NULL,
	[binJobSkill] [binary](120) NULL,
	[binPatsSkill] [binary](60) NULL,
	[binUniqueSkill] [binary](60) NULL,
	[binCoolTime] [binary](80) NULL,
	[dwDelTIME] [int] NULL,
	[binWishLIST] [binary](256) NULL,
	[dwOPTION] [int] NULL,
	[intJOB] [smallint] NOT NULL,
	[dwRegTIME] [int] NOT NULL,
	[dwPartyIDX] [int] NULL,
	[dwItemSN] [int] NULL,
	[intDataVER] [smallint] NOT NULL,
	[binMileageSkill] [binary](400) NULL,
	[paymentFlag] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_AVATAR_new]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_AVATAR_new](
	[intCharID] [int] IDENTITY(1,1) NOT NULL,
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[txtNAME] [nvarchar](30) NOT NULL,
	[btLEVEL] [smallint] NULL,
	[intMoney] [bigint] NULL,
	[dwRIGHT] [int] NULL,
	[binBasicE] [binary](96) NOT NULL,
	[binBasicI] [binary](32) NOT NULL,
	[binBasicA] [binary](48) NOT NULL,
	[binGrowA] [binary](384) NOT NULL,
	[blobQUEST] [binary](1274) NULL,
	[blobINV] [binary](3088) NOT NULL,
	[binHotICON] [binary](96) NULL,
	[binJobSkill] [binary](120) NULL,
	[binPatsSkill] [binary](60) NULL,
	[binUniqueSkill] [binary](60) NULL,
	[binCoolTime] [binary](80) NULL,
	[dwDelTIME] [int] NULL,
	[binWishLIST] [binary](420) NULL,
	[dwOPTION] [int] NULL,
	[intJOB] [smallint] NOT NULL,
	[dwRegTIME] [int] NOT NULL,
	[dwPartyIDX] [int] NULL,
	[dwItemSN] [int] NULL,
	[intDataVER] [smallint] NOT NULL,
	[binMileageSkill] [binary](400) NULL,
	[paymentFlag] [smallint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_AVATAR_old]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_AVATAR_old](
	[intCharID] [int] IDENTITY(1,1) NOT NULL,
	[txtACCOUNT] [nvarchar](20) NOT NULL,
	[txtNAME] [nvarchar](30) NOT NULL,
	[btLEVEL] [smallint] NULL,
	[intMoney] [bigint] NULL,
	[dwRIGHT] [int] NULL,
	[binBasicE] [binary](96) NOT NULL,
	[binBasicI] [binary](32) NOT NULL,
	[binBasicA] [binary](48) NOT NULL,
	[binGrowA] [binary](384) NOT NULL,
	[binSkillA] [binary](384) NOT NULL,
	[blobQUEST] [binary](1024) NULL,
	[blobINV] [binary](2048) NOT NULL,
	[binHotICON] [binary](96) NULL,
	[binPatsEquip] [binary](90) NULL,
	[binMileageInv] [binary](810) NULL,
	[binJobSkill] [binary](120) NULL,
	[binPatsSkill] [binary](60) NULL,
	[binUniqueSkill] [binary](60) NULL,
	[binCoolTime] [binary](80) NULL,
	[dwDelTIME] [int] NULL,
	[binWishLIST] [binary](256) NULL,
	[dwOPTION] [int] NULL,
	[intJOB] [smallint] NOT NULL,
	[dwRegTIME] [int] NOT NULL,
	[dwPartyIDX] [int] NULL,
	[dwItemSN] [int] NULL,
	[intDataVER] [smallint] NOT NULL,
	[binMileageSkill] [binary](400) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_AVATAR_Unity_Sam]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_AVATAR_Unity_Sam](
	[intCharID] [int] NOT NULL,
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[txtNAME] [nvarchar](30) NOT NULL,
	[btLEVEL] [smallint] NULL,
	[intMoney] [bigint] NULL,
	[dwRIGHT] [int] NULL,
	[binBasicE] [binary](96) NOT NULL,
	[binBasicI] [binary](32) NOT NULL,
	[binBasicA] [binary](48) NOT NULL,
	[binGrowA] [binary](384) NOT NULL,
	[binSkillA] [binary](384) NOT NULL,
	[blobQUEST] [binary](1024) NULL,
	[blobINV] [binary](2248) NOT NULL,
	[binHotICON] [binary](96) NULL,
	[binPatsEquip] [binary](100) NULL,
	[binMileageInv] [binary](900) NULL,
	[binJobSkill] [binary](120) NULL,
	[binPatsSkill] [binary](60) NULL,
	[binUniqueSkill] [binary](60) NULL,
	[binCoolTime] [binary](80) NULL,
	[dwDelTIME] [int] NULL,
	[binWishLIST] [binary](256) NULL,
	[dwOPTION] [int] NULL,
	[intJOB] [smallint] NOT NULL,
	[dwRegTIME] [int] NOT NULL,
	[dwPartyIDX] [int] NULL,
	[dwItemSN] [int] NULL,
	[intDataVER] [smallint] NOT NULL,
	[binMileageSkill] [binary](400) NULL,
	[paymentFlag] [smallint] NOT NULL,
	[ClanFlag] [smallint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_BANK]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_BANK](
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[blobITEMS] [binary](3528) NULL,
	[intREWARD] [money] NULL,
	[txtPASSWORD] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblGS_BANK] PRIMARY KEY CLUSTERED 
(
	[txtACCOUNT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_BANK_0]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_BANK_0](
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[blobITEMS] [binary](2568) NULL,
	[intREWARD] [money] NULL,
	[txtPASSWORD] [nvarchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_BANK_new]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_BANK_new](
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[blobITEMS] [binary](3528) NULL,
	[intREWARD] [money] NULL,
	[txtPASSWORD] [nvarchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_BANK_old]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_BANK_old](
	[txtACCOUNT] [nvarchar](35) NOT NULL,
	[blobITEMS] [binary](2250) NULL,
	[intREWARD] [money] NULL,
	[txtPASSWORD] [nvarchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_ERROR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_ERROR](
	[Index] [int] NOT NULL,
	[dateREG] [datetime] NOT NULL,
	[txtIP] [varchar](15) NULL,
	[txtACCOUNT] [nvarchar](20) NULL,
	[txtCHAR] [nvarchar](32) NULL,
	[txtFILE] [char](255) NULL,
	[intLINE] [int] NULL,
	[txtDESC] [nvarchar](512) NULL,
 CONSTRAINT [PK_tblGS_ERROR] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGS_LogIN]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGS_LogIN](
	[dateREG] [datetime] NOT NULL,
	[txtACCOUNT] [nchar](30) NOT NULL,
	[txtServerIP] [char](20) NOT NULL,
 CONSTRAINT [PK_GS_LogIN] PRIMARY KEY CLUSTERED 
(
	[txtACCOUNT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblWS_CLAN]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWS_CLAN](
	[intID] [int] IDENTITY(1,1) NOT NULL,
	[txtNAME] [nchar](20) NOT NULL,
	[txtDESC] [nchar](255) NULL,
	[intMarkIDX1] [smallint] NOT NULL,
	[intMarkIDX2] [smallint] NULL,
	[intLEVEL] [smallint] NULL,
	[intPOINT] [int] NULL,
	[intAlliedID] [int] NULL,
	[intRATE] [smallint] NULL,
	[intMoney] [bigint] NULL,
	[binDATA] [binary](1024) NULL,
	[txtMSG] [nvarchar](368) NULL,
	[intMarkCRC] [smallint] NULL,
	[intMarkLEN] [smallint] NULL,
	[binMark] [binary](1024) NULL,
	[dateMarkREG] [datetime] NULL,
	[intRankPoint] [int] NULL,
 CONSTRAINT [PK_tbl_WSCLAN] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblWS_ClanCHAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWS_ClanCHAR](
	[txtCharNAME] [nchar](30) NOT NULL,
	[intClanID] [int] NOT NULL,
	[intPOINT] [int] NULL,
	[intPOS] [int] NULL,
	[intRewardPOINT] [int] NULL,
 CONSTRAINT [PK_tblWS_ClanCHAR] PRIMARY KEY CLUSTERED 
(
	[txtCharNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWS_FRIEND]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWS_FRIEND](
	[intCharID] [int] NOT NULL,
	[intFriendCNT] [smallint] NOT NULL,
	[blobFRIENDS] [binary](1024) NULL,
 CONSTRAINT [PK_tblWS_FRIEND] PRIMARY KEY CLUSTERED 
(
	[intCharID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblWS_MEMO]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWS_MEMO](
	[intSN] [bigint] IDENTITY(1,1) NOT NULL,
	[dwDATE] [int] NOT NULL,
	[txtNAME] [nvarchar](30) NOT NULL,
	[txtFROM] [nvarchar](30) NOT NULL,
	[txtMEMO] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tblWS_MEMO] PRIMARY KEY CLUSTERED 
(
	[intSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWS_VAR]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWS_VAR](
	[txtNAME] [nvarchar](50) NOT NULL,
	[dateUPDATE] [datetime] NOT NULL,
	[binDATA] [varbinary](1024) NOT NULL,
 CONSTRAINT [PK_tblWS_VAR] PRIMARY KEY CLUSTERED 
(
	[txtNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_player_login_3_1]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_player_login_3_1]
AS
SELECT         dbo.Player_Login.*
FROM             dbo.Player_Login
WHERE         ( dbo.Player_Login.player_no % 3 = 0)



GO
/****** Object:  View [dbo].[v_player_login_3_2]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_player_login_3_2]
AS
SELECT         dbo.Player_Login.*
FROM             dbo.Player_Login
WHERE         ( dbo.Player_Login.player_no % 3 = 1)



GO
/****** Object:  View [dbo].[v_player_login_3_3]    Script Date: 3/10/2012 15:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_player_login_3_3]
AS
SELECT         dbo.Player_Login.*
FROM             dbo.Player_Login
WHERE         (dbo.Player_Login.player_no % 3 = 2)



GO
ALTER TABLE [dbo].[Member_Main] ADD  CONSTRAINT [DF_Member_Main_accumulate_point]  DEFAULT (0) FOR [accumulate_point]
GO
ALTER TABLE [dbo].[Member_Main] ADD  CONSTRAINT [DF_Member_Main_point]  DEFAULT (0.0) FOR [point]
GO
ALTER TABLE [dbo].[Member_Main] ADD  CONSTRAINT [DF_Member_Main_last_point]  DEFAULT (0) FOR [last_save_point]
GO
ALTER TABLE [dbo].[Member_Main] ADD  CONSTRAINT [DF_Member_Main_create_time]  DEFAULT (getdate()) FOR [create_time]
GO
ALTER TABLE [dbo].[Member_Main] ADD  CONSTRAINT [DF_Member_Main_charge_multiple]  DEFAULT (0) FOR [charge_multiple]
GO
ALTER TABLE [dbo].[MemberPoint_Log] ADD  CONSTRAINT [DF_MemberPoint_Log_create_time]  DEFAULT (getdate()) FOR [create_time]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Player_Login_game_server_ip]  DEFAULT (0) FOR [game_server_ip]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Player_Login_game_server_port]  DEFAULT (0) FOR [game_server_port]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Member_Login_Table_logout_time]  DEFAULT ('1900 / 1 / 1') FOR [logout_time]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Member_Login_Table_process_state]  DEFAULT (0) FOR [process_state]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Member_Login_Table_user_ip]  DEFAULT (0) FOR [isp_id]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Member_Login_Table_user_ip_1]  DEFAULT (0) FOR [user_ip]
GO
ALTER TABLE [dbo].[Player_Login] ADD  CONSTRAINT [DF_Player_Login_charge_multiple_flag]  DEFAULT (0) FOR [charge_multiple_flag]
GO
ALTER TABLE [dbo].[Recommend] ADD  CONSTRAINT [DF_Recommend_create_time]  DEFAULT (getdate()) FOR [create_time]
GO
ALTER TABLE [dbo].[Suspended_User] ADD  CONSTRAINT [DF_Suspended_User_Table_rec_time]  DEFAULT (getdate()) FOR [create_time]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_btLEVEL]  DEFAULT (0) FOR [btLEVEL]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_intMoney]  DEFAULT (0) FOR [intMoney]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_dwRIGHT]  DEFAULT (0) FOR [dwRIGHT]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_binHotICON]  DEFAULT (0) FOR [binHotICON]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_binJobSkill]  DEFAULT (0) FOR [binJobSkill]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_binPatsSkill]  DEFAULT (0) FOR [binPatsSkill]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_binUniqueSkill]  DEFAULT (0) FOR [binUniqueSkill]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_binCoolTime]  DEFAULT (0) FOR [binCoolTime]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_dwDelTIME]  DEFAULT (0) FOR [dwDelTIME]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_dwOPTION]  DEFAULT (0) FOR [dwOPTION]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_intJOB]  DEFAULT (0) FOR [intJOB]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_dwRegTIME]  DEFAULT (0) FOR [dwRegTIME]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_dwPartyIDX]  DEFAULT (0) FOR [dwPartyIDX]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_dwItemSN]  DEFAULT (0) FOR [dwItemSN]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_intDataVER]  DEFAULT (0) FOR [intDataVER]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_binMileageSkill]  DEFAULT (0) FOR [binMileageSkill]
GO
ALTER TABLE [dbo].[tblGS_AVATAR] ADD  CONSTRAINT [DF_tblGS_AVATAR_paymentFlag]  DEFAULT (0) FOR [paymentFlag]
GO
ALTER TABLE [dbo].[tblGS_BANK] ADD  CONSTRAINT [DF_tblGS_BANK_intREWARD]  DEFAULT (0) FOR [intREWARD]
GO
ALTER TABLE [dbo].[tblGS_LogIN] ADD  CONSTRAINT [DF_GS_LogIN_dateREG]  DEFAULT (getdate()) FOR [dateREG]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intMarkIDX1]  DEFAULT (0) FOR [intMarkIDX1]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intMarkIDX2]  DEFAULT (0) FOR [intMarkIDX2]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intLEVEL]  DEFAULT (1) FOR [intLEVEL]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intPOINT]  DEFAULT (0) FOR [intPOINT]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intAlliedID]  DEFAULT (0) FOR [intAlliedID]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intRATE]  DEFAULT (100) FOR [intRATE]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intMoney]  DEFAULT (0) FOR [intMoney]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intMarkLEN]  DEFAULT (0) FOR [intMarkLEN]
GO
ALTER TABLE [dbo].[tblWS_CLAN] ADD  CONSTRAINT [DF_tblWS_CLAN_intRankPoint]  DEFAULT (0) FOR [intRankPoint]
GO
ALTER TABLE [dbo].[tblWS_ClanCHAR] ADD  CONSTRAINT [DF_tblWS_GuildCHAR_intPOINT]  DEFAULT (0) FOR [intPOINT]
GO
ALTER TABLE [dbo].[tblWS_ClanCHAR] ADD  CONSTRAINT [DF_tblWS_GuildCHAR_intPOS]  DEFAULT (0) FOR [intPOS]
GO
ALTER TABLE [dbo].[tblWS_ClanCHAR] ADD  CONSTRAINT [DF_tblWS_ClanCHAR_intRewardPOINT]  DEFAULT (0) FOR [intRewardPOINT]
GO
ALTER TABLE [dbo].[tblWS_FRIEND] ADD  CONSTRAINT [DF_tblWS_FRIEND_intFriendCNT]  DEFAULT (0) FOR [intFriendCNT]
GO
