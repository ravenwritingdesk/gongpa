-- =============================================
-- Author:		<Tan>
-- Create date: <2015-12-07>
-- Description:	<��ʼ������-�����ܴ���������>
--����޸����ڣ�<2015-12-07>
-- =============================================
----------------------------------------------------------------�������û����ݿ������--------------------------------------------------------------
DELETE  QPAccountsDB.dbo.AccountsInfo WHERE IsAndroid<>1 AND UserID!=1	   --�û���
GO
TRUNCATE TABLE QPAccountsDB.dbo.ConfineContent  --�û�������
GO
TRUNCATE TABLE QPAccountsDB.dbo.ConfineAddress  --Ip����
GO
TRUNCATE TABLE QPAccountsDB.dbo.ConfineMachine  --����������
GO
DELETE  QPAccountsDB.dbo.IndividualDatum WHERE UserID NOT IN (SELECT UserId FROM QPAccountsDB.dbo.AccountsInfo)	 --�û���ϸ��Ϣ
GO
truncate table 	QPAccountsDB.dbo.RecordUserLogon	 --������־
GO
TRUNCATE TABLE QPAccountsDB.dbo.SystemStreamInfo	  --��¼�����ƹ���־
GO
TRUNCATE TABLE QPAccountsDB.dbo.SystemGrantCount	  --��¼ͬһIPע�����
GO
--TRUNCATE TABLE QPAccountsDB.dbo.SystemStatusInfo		--ϵͳ����
GO
----------------------------------------------------------------�������û����ݿ������--------------------------------------------------------------


----------------------------------------------------------------������Web���ݿ������--------------------------------------------------------------
GO
TRUNCATE TABLE QPNativeWebDB.dbo.Articles	  --����
GO
TRUNCATE TABLE QPNativeWebDB.[dbo].[GameFeedbackInfo]	  --��������
GO
TRUNCATE TABLE QPNativeWebDB.[dbo].LuckDrawPrize	  --�齱��Ʒ
GO
TRUNCATE TABLE QPNativeWebDB.dbo.Marquee	--�����
GO
TRUNCATE TABLE QPNativeWebDB.dbo.News	  --����
GO
TRUNCATE TABLE QPNativeWebDB.dbo.Notice	   --֪ͨ
GO																					 
TRUNCATE TABLE QPNativeWebDB.[dbo].RecordLuckDraw	  --���̳齱��¼
GO
TRUNCATE TABLE QPNativeWebDB.[dbo].Roulette	  --��������
GO
--TRUNCATE TABLE QPNativeWebDB.dbo.SystemSetInfo	   --ϵͳ����
GO
--TRUNCATE TABLE QPNativeWebDB.dbo.TGameIntroduction	   --��Ϸ����
GO

----------------------------------------------------------------������Web���ݿ������--------------------------------------------------------------


----------------------------------------------------------------������ǰ̨���ݿ������--------------------------------------------------------------
GO
TRUNCATE TABLE QPPlatformDB.[dbo].[OnLineStreamInfo]	--����ͳ��
GO
--TRUNCATE TABLE QPPlatformDB.[dbo].[RoomConfiguration]	--��Ϸ�������
UPDATE 	QPPlatformDB.[dbo].[RoomConfiguration] SET Extend1='',Extend2='' 
GO
--TRUNCATE TABLE QPPlatformDB.[dbo].[OnLineStreamInfo]	--�ʽ�����
UPDATE 	QPPlatformDB.[dbo].[GamePrizePool] SET PrizePool=0
GO
----------------------------------------------------------------������ǰ̨���ݿ������--------------------------------------------------------------

----------------------------------------------------------------������ƽ̨�������ݿ������--------------------------------------------------------------
GO
DELETE QPPlatformManagerDB.[dbo].Base_Roles	WHERE RoleID<>1 --��ɫ
GO
DELETE QPPlatformManagerDB.[dbo].Base_RolePermission WHERE RoleID<>1  --��ɫȨ��
GO
DELETE QPPlatformManagerDB.[dbo].[Base_Users]	WHERE RoleID<>1 --����Ա�û�
 GO
 UPDATE  QPPlatformManagerDB.[dbo].[QPAdminSiteInfo] SET CopyRight='��Ϸ���޹�˾'
 GO
TRUNCATE TABLE 	QPPlatformManagerDB.[dbo].[SystemSecurity]	 --ϵͳ��־
 GO
----------------------------------------------------------------������ƽ̨�������ݿ������--------------------------------------------------------------

----------------------------------------------------------------������������ݿ������--------------------------------------------------------------
GO
TRUNCATE TABLE QPTreasureDB.dbo.[ConfineAddress] -- һ ��ַ
GO
TRUNCATE TABLE QPTreasureDB.dbo.[GameProperty] -- һ ��Ϸ����
go
DELETE  QPTreasureDB.dbo.GameScoreInfo WHERE UserID NOT IN (SELECT UserId FROM QPAccountsDB.dbo.AccountsInfo)  --�û����
GO
TRUNCATE TABLE 	QPTreasureDB.dbo.GameScoreLocker --��Ϸ��
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[GlobalLivcard] --ʵ������
GO
--TRUNCATE TABLE 	QPTreasureDB.[dbo].[GlobalShareInfo]--��ֵ����(��ɾ��)
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[GlobalSpreadInfo]--�ƹ��¼
go
TRUNCATE TABLE 	QPTreasureDB.dbo.LivcardAssociator--ʵ����Ϣ
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[LivcardBuildStream]--ʵ��������Ϣ
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[OnLineOrder]--���߶���
go
TRUNCATE TABLE QPTreasureDB.dbo.Prize	  --��Ʒ
GO
--TRUNCATE TABLE QPTreasureDB.dbo.RecordChoushui --��ˮ
--GO
TRUNCATE TABLE QPTreasureDB.dbo.RecordDrawInfo -- һ�ֵ���ϸ��Ϣ
GO
TRUNCATE TABLE  QPTreasureDB.dbo.RecordDrawScore -- һ����ÿ���û��ķ�����¼
GO
 TRUNCATE TABLE QPTreasureDB.dbo.RecordExchange	 --�һ���Ʒ
GO
 TRUNCATE TABLE QPTreasureDB.dbo.RecordGamePrizePoolChange	 --��¼��Ϸ���ظ���
GO
TRUNCATE TABLE QPTreasureDB.dbo.RecordInsure	--���м�¼
GO
 TRUNCATE TABLE QPTreasureDB.[dbo].[RecordSpreadInfo]	 --��ֵ����
GO
TRUNCATE TABLE QPTreasureDB.dbo.[RecordUserInout] -- һ ������Ϸ��¼
go
TRUNCATE TABLE QPTreasureDB.[dbo].[ShareDetailInfo] -- һ ʵ����ֵ��¼
go
TRUNCATE TABLE QPTreasureDB.[dbo].[StreamShareInfo] -- һ ʵ�����
GO
TRUNCATE TABLE QPTreasureDB.[dbo].[SystemStreamInfo] -- һ ��Ϸ����������
go
----------------------------------------------------------------������������ݿ������--------------------------------------------------------------



----------------------------------------------------------------�������������ݿ������--------------------------------------------------------------
GO
TRUNCATE TABLE [QPProxyDB].[dbo].[BS_Marquee]  --�����
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_Members	   --��Ա��
GO
TRUNCATE TABLE QPProxyDB.[dbo].[BS_MemberScoreReport]		   --��Աÿ�ձ���
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_OperateRecord	   --������־
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_Operator		--����Ա
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_PayOrders			--������
GO
DELETE 	QPProxyDB.dbo.BS_ProxyInfo WHERE belongsAgent!=-1  --�����
GO
TRUNCATE TABLE QPProxyDB.[dbo].BS_ProxyScoreReport		   --����ÿ�ձ���
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_ScoreChangeRecord   --��Ǯ��¼
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_SendBonusRecord			 --������
GO
TRUNCATE TABLE QPProxyDB.[dbo].[BS_UpdateProcedureLog]		
GO

----------------------------------------------------------------�������������ݿ������--------------------------------------------------------------



----------------------------------------------------------------��������ʼ���ܴ�������--------------------------------------------------------------
UPDATE 	QPTreasureDB.dbo.GameScoreInfo SET InsureScore=1000000000000 WHERE UserID=1
GO
--�ֳ�ģʽ
UPDATE 	QPProxyDB.dbo.BS_ProxyInfo SET score=1000000000000,allTax=0,tmpTax=0,totalUpScore=0,totalDownScore=0,initDeposit=1000000000,authority=1,assignProportion=0,ProfitProportion=100 WHERE ProxyID=1
GO
----------------------------------------------------------------��������ʼ���ܴ�������--------------------------------------------------------------

