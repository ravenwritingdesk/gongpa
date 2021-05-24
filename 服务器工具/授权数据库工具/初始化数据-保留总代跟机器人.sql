-- =============================================
-- Author:		<Tan>
-- Create date: <2015-12-07>
-- Description:	<初始化数据-保留总代跟机器人>
--最后修改日期：<2015-12-07>
-- =============================================
----------------------------------------------------------------↓↓↓用户数据库↓↓↓--------------------------------------------------------------
DELETE  QPAccountsDB.dbo.AccountsInfo WHERE IsAndroid<>1 AND UserID!=1	   --用户表
GO
TRUNCATE TABLE QPAccountsDB.dbo.ConfineContent  --用户名限制
GO
TRUNCATE TABLE QPAccountsDB.dbo.ConfineAddress  --Ip限制
GO
TRUNCATE TABLE QPAccountsDB.dbo.ConfineMachine  --机器码限制
GO
DELETE  QPAccountsDB.dbo.IndividualDatum WHERE UserID NOT IN (SELECT UserId FROM QPAccountsDB.dbo.AccountsInfo)	 --用户详细信息
GO
truncate table 	QPAccountsDB.dbo.RecordUserLogon	 --登入日志
GO
TRUNCATE TABLE QPAccountsDB.dbo.SystemStreamInfo	  --记录插入推广日志
GO
TRUNCATE TABLE QPAccountsDB.dbo.SystemGrantCount	  --记录同一IP注册次数
GO
--TRUNCATE TABLE QPAccountsDB.dbo.SystemStatusInfo		--系统配置
GO
----------------------------------------------------------------↑↑↑用户数据库↑↑↑--------------------------------------------------------------


----------------------------------------------------------------↓↓↓Web数据库↓↓↓--------------------------------------------------------------
GO
TRUNCATE TABLE QPNativeWebDB.dbo.Articles	  --文章
GO
TRUNCATE TABLE QPNativeWebDB.[dbo].[GameFeedbackInfo]	  --反馈管理
GO
TRUNCATE TABLE QPNativeWebDB.[dbo].LuckDrawPrize	  --抽奖商品
GO
TRUNCATE TABLE QPNativeWebDB.dbo.Marquee	--跑马灯
GO
TRUNCATE TABLE QPNativeWebDB.dbo.News	  --新闻
GO
TRUNCATE TABLE QPNativeWebDB.dbo.Notice	   --通知
GO																					 
TRUNCATE TABLE QPNativeWebDB.[dbo].RecordLuckDraw	  --轮盘抽奖记录
GO
TRUNCATE TABLE QPNativeWebDB.[dbo].Roulette	  --轮盘设置
GO
--TRUNCATE TABLE QPNativeWebDB.dbo.SystemSetInfo	   --系统设置
GO
--TRUNCATE TABLE QPNativeWebDB.dbo.TGameIntroduction	   --游戏介绍
GO

----------------------------------------------------------------↑↑↑Web数据库↑↑↑--------------------------------------------------------------


----------------------------------------------------------------↓↓↓前台数据库↓↓↓--------------------------------------------------------------
GO
TRUNCATE TABLE QPPlatformDB.[dbo].[OnLineStreamInfo]	--在线统计
GO
--TRUNCATE TABLE QPPlatformDB.[dbo].[RoomConfiguration]	--游戏库存配置
UPDATE 	QPPlatformDB.[dbo].[RoomConfiguration] SET Extend1='',Extend2='' 
GO
--TRUNCATE TABLE QPPlatformDB.[dbo].[OnLineStreamInfo]	--彩金配置
UPDATE 	QPPlatformDB.[dbo].[GamePrizePool] SET PrizePool=0
GO
----------------------------------------------------------------↑↑↑前台数据库↑↑↑--------------------------------------------------------------

----------------------------------------------------------------↓↓↓平台管理数据库↓↓↓--------------------------------------------------------------
GO
DELETE QPPlatformManagerDB.[dbo].Base_Roles	WHERE RoleID<>1 --角色
GO
DELETE QPPlatformManagerDB.[dbo].Base_RolePermission WHERE RoleID<>1  --角色权限
GO
DELETE QPPlatformManagerDB.[dbo].[Base_Users]	WHERE RoleID<>1 --管理员用户
 GO
 UPDATE  QPPlatformManagerDB.[dbo].[QPAdminSiteInfo] SET CopyRight='游戏有限公司'
 GO
TRUNCATE TABLE 	QPPlatformManagerDB.[dbo].[SystemSecurity]	 --系统日志
 GO
----------------------------------------------------------------↑↑↑平台管理数据库↑↑↑--------------------------------------------------------------

----------------------------------------------------------------↓↓↓金币数据库↓↓↓--------------------------------------------------------------
GO
TRUNCATE TABLE QPTreasureDB.dbo.[ConfineAddress] -- 一 地址
GO
TRUNCATE TABLE QPTreasureDB.dbo.[GameProperty] -- 一 游戏道具
go
DELETE  QPTreasureDB.dbo.GameScoreInfo WHERE UserID NOT IN (SELECT UserId FROM QPAccountsDB.dbo.AccountsInfo)  --用户余额
GO
TRUNCATE TABLE 	QPTreasureDB.dbo.GameScoreLocker --游戏锁
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[GlobalLivcard] --实卡类型
GO
--TRUNCATE TABLE 	QPTreasureDB.[dbo].[GlobalShareInfo]--充值类型(不删除)
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[GlobalSpreadInfo]--推广记录
go
TRUNCATE TABLE 	QPTreasureDB.dbo.LivcardAssociator--实卡信息
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[LivcardBuildStream]--实卡批量信息
go
TRUNCATE TABLE 	QPTreasureDB.[dbo].[OnLineOrder]--在线订单
go
TRUNCATE TABLE QPTreasureDB.dbo.Prize	  --商品
GO
--TRUNCATE TABLE QPTreasureDB.dbo.RecordChoushui --抽水
--GO
TRUNCATE TABLE QPTreasureDB.dbo.RecordDrawInfo -- 一局的详细信息
GO
TRUNCATE TABLE  QPTreasureDB.dbo.RecordDrawScore -- 一局中每个用户的分数记录
GO
 TRUNCATE TABLE QPTreasureDB.dbo.RecordExchange	 --兑换商品
GO
 TRUNCATE TABLE QPTreasureDB.dbo.RecordGamePrizePoolChange	 --记录游戏奖池更改
GO
TRUNCATE TABLE QPTreasureDB.dbo.RecordInsure	--银行记录
GO
 TRUNCATE TABLE QPTreasureDB.[dbo].[RecordSpreadInfo]	 --充值赠送
GO
TRUNCATE TABLE QPTreasureDB.dbo.[RecordUserInout] -- 一 进出游戏记录
go
TRUNCATE TABLE QPTreasureDB.[dbo].[ShareDetailInfo] -- 一 实卡充值记录
go
TRUNCATE TABLE QPTreasureDB.[dbo].[StreamShareInfo] -- 一 实卡相关
GO
TRUNCATE TABLE QPTreasureDB.[dbo].[SystemStreamInfo] -- 一 游戏房间进入次数
go
----------------------------------------------------------------↑↑↑金币数据库↑↑↑--------------------------------------------------------------



----------------------------------------------------------------↓↓↓代理数据库↓↓↓--------------------------------------------------------------
GO
TRUNCATE TABLE [QPProxyDB].[dbo].[BS_Marquee]  --跑马灯
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_Members	   --会员表
GO
TRUNCATE TABLE QPProxyDB.[dbo].[BS_MemberScoreReport]		   --会员每日报表
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_OperateRecord	   --操作日志
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_Operator		--操作员
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_PayOrders			--订单表
GO
DELETE 	QPProxyDB.dbo.BS_ProxyInfo WHERE belongsAgent!=-1  --代理表
GO
TRUNCATE TABLE QPProxyDB.[dbo].BS_ProxyScoreReport		   --代理每日报表
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_ScoreChangeRecord   --金钱记录
GO
TRUNCATE TABLE QPProxyDB.dbo.BS_SendBonusRecord			 --发红利
GO
TRUNCATE TABLE QPProxyDB.[dbo].[BS_UpdateProcedureLog]		
GO

----------------------------------------------------------------↑↑↑代理数据库↑↑↑--------------------------------------------------------------



----------------------------------------------------------------↓↓↓初始化总代↓↓↓--------------------------------------------------------------
UPDATE 	QPTreasureDB.dbo.GameScoreInfo SET InsureScore=1000000000000 WHERE UserID=1
GO
--分成模式
UPDATE 	QPProxyDB.dbo.BS_ProxyInfo SET score=1000000000000,allTax=0,tmpTax=0,totalUpScore=0,totalDownScore=0,initDeposit=1000000000,authority=1,assignProportion=0,ProfitProportion=100 WHERE ProxyID=1
GO
----------------------------------------------------------------↑↑↑初始化总代↑↑↑--------------------------------------------------------------

