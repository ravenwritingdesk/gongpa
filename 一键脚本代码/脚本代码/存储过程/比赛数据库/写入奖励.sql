USE QPGameMatchDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GR_MatchReward]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GR_MatchReward]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

----------------------------------------------------------------------------------------------------

-- I D ��¼
CREATE PROC GSP_GR_MatchReward
	@dwUserID INT,								-- �û� I D
	@dwMatchID INT,								-- ���� I D 
	@dwMatchNO	INT,							-- ��������
	@wRank INT,									-- ��������
	@lMatchScore INT,							-- �����÷�
	@dwExperience INT,							-- ��������
	@dwGold INT,								-- �������
	@dwMedal INT,								-- ��������
	@wKindID INT,								-- ��Ϸ I D
	@wServerID INT,								-- ���� I D
	@strClientIP NVARCHAR(15)					-- ���ӵ�ַ
WITH ENCRYPTION AS

-- ִ���߼�
BEGIN
	
	UPDATE QPAccountsDB..AccountsInfo SET UserMedal=UserMedal+@dwMedal,Experience=Experience+@dwExperience WHERE UserID=@dwUserID
	IF @@ROWCOUNT=0
		RETURN 1
	
	UPDATE QPTreasureDB..GameScoreInfo SET Score=Score+@dwGold WHERE UserID=@dwUserID
	IF @@ROWCOUNT=0
	BEGIN
		INSERT QPTreasureDB..GameScoreInfo (UserID,Score,LastLogonIP)
								VALUES(@dwUserID,@dwGold,@strClientIP)
	END
	
	INSERT INTO StreamMatchHistory (UserID,MatchID,MatchNO,Rank,MatchScore,Experience,Gold,Medal,KindID,ServerID,ClientIP)
					VALUES(@dwUserID,@dwMatchID,@dwMatchNO,@wRank,@lMatchScore,@dwExperience,@dwGold,@dwMedal,@wKindID,@wServerID,@strClientIP)

END

RETURN 0
GO