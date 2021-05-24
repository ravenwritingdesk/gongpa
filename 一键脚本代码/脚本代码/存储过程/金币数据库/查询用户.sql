----------------------------------------------------------------------------------------------------

USE QPTreasureDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GR_QueryTransferUserInfo]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GR_QueryTransferUserInfo]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------
-- ��ѯ�û�
CREATE PROC GSP_GR_QueryTransferUserInfo
	@cbByNickName INT,                          -- �ǳƱ�־
	@strNickName NVARCHAR(31),					-- �û��ǳ�
	@strErrorDescribe NVARCHAR(127) OUTPUT		-- �����Ϣ
WITH ENCRYPTION AS

-- ��������
SET NOCOUNT ON

-- ������Ϣ
DECLARE @Score BIGINT
DECLARE @Insure BIGINT
DECLARE @ServerID SMALLINT

-- ִ���߼�
BEGIN

	-- Ŀ���û�
	DECLARE @TargetGameID INT
	DECLARE @NickName NVARCHAR(31)
	IF @cbByNickName=1
		SELECT @TargetGameID=GameID, @NickName=NickName FROM QPAccountsDBLink.QPAccountsDB.dbo.AccountsInfo WHERE NickName=@strNickName
	ELSE
		SELECT @TargetGameID=GameID, @NickName=NickName FROM QPAccountsDBLink.QPAccountsDB.dbo.AccountsInfo WHERE GameID=@strNickName

	-- ��ѯ�û�
	IF @TargetGameID IS NULL
	BEGIN
		SET @strErrorDescribe=N'����Ҫת�˵��û���'+@strNickName+'�������ڻ��������������֤���ٴγ��ԣ�'
		RETURN 5
	END

	-- ������
	SELECT @TargetGameID AS GameID, @NickName AS NickName

END

RETURN 0

GO

----------------------------------------------------------------------------------------------------
