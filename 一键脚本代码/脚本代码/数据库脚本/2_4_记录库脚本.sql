USE [QPRecordDB]
GO
/****** 对象:  Table [dbo].[RecordGrantTreasure]    脚本日期: 06/25/2012 15:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RecordGrantTreasure](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantScore_VisitIP]  DEFAULT (N'000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantScore_CreateDatetime]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[CurGold] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantScore_CurScore]  DEFAULT ((0)),
	[AddGold] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantScore_AddScore]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantScore_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来访地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'CurGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'AddGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordSendPresent]    脚本日期: 06/25/2012 15:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSendPresent](
	[PresentID] [tinyint] NOT NULL,
	[RcvUserID] [int] NOT NULL,
	[SendUserID] [int] NOT NULL,
	[LovelinessRcv] [int] NOT NULL,
	[LovelinessSend] [int] NOT NULL,
	[PresentPrice] [int] NOT NULL,
	[PresentCount] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL CONSTRAINT [DF_RecordSendPresent_SendTime]  DEFAULT (getdate()),
	[ClientIP] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼物标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'PresentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'RcvUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'SendUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'魅力数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'LovelinessRcv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'魅力数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'LovelinessSend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼物价钱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'PresentPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼物数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'PresentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
/****** 对象:  Table [dbo].[RecordGrantGameScore]    脚本日期: 06/25/2012 15:53:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RecordGrantGameScore](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantGameScore_VisitIP]  DEFAULT (N'000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantGameScore_CreateDatetime]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantGameScore_CurScore]  DEFAULT ((0)),
	[AddScore] [int] NOT NULL CONSTRAINT [DF_RecordGrantGameScore_AddScore]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantGameScore_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantGameScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来访地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'AddScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordSendProperty]    脚本日期: 06/25/2012 15:54:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSendProperty](
	[PropID] [tinyint] NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[PropPrice] [int] NOT NULL,
	[PropCount] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL CONSTRAINT [DF_RecordSendProperty_SendTime]  DEFAULT (getdate()),
	[ClientIP] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'PropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'PropPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'PropCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
/****** 对象:  Table [dbo].[RecordGrantClearScore]    脚本日期: 06/25/2012 15:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RecordGrantClearScore](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantClearScore_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantClearScore_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordGrantClearScore_UserID]  DEFAULT ((0)),
	[KindID] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantClearScore_CurScore]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantClearScore_Reason]  DEFAULT (''),
 CONSTRAINT [PK_RecordGrantClearScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清零负分原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordGrantClearFlee]    脚本日期: 06/25/2012 15:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RecordGrantClearFlee](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantFlee_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantFlee_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[CurFlee] [int] NOT NULL CONSTRAINT [DF_RecordGrantFlee_CurFlee]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantFlee_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantFlee] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前逃跑次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'CurFlee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordGrantExperience]    脚本日期: 06/25/2012 15:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RecordGrantExperience](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantExperience_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantExperience_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[CurExperience] [int] NOT NULL CONSTRAINT [DF_RecordGrantExperience_CurExperience]  DEFAULT ((0)),
	[AddExperience] [int] NOT NULL CONSTRAINT [DF_RecordGrantExperience_AddExperience]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantExperience_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantExperience] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'CurExperience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补加经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'AddExperience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordGrantMember]    脚本日期: 06/25/2012 15:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantMember](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL CONSTRAINT [DF_RecordGrantMenber_MasterID]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantMenber_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantMenber_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordGrantMenber_UserID]  DEFAULT ((0)),
	[GrantCardType] [int] NOT NULL CONSTRAINT [DF_Table_1_CardType]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantMenber_Reason]  DEFAULT (''),
	[MemberDays] [int] NOT NULL CONSTRAINT [DF_RecordGrantMember_MemberDays]  DEFAULT ((0)),
 CONSTRAINT [PK_RecordGrantMenber] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送的会员卡类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'GrantCardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送会员卡原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordGrantGameID]    脚本日期: 06/25/2012 15:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantGameID](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CurGameID] [int] NOT NULL,
	[ReGameID] [int] NOT NULL,
	[IDLevel] [int] NOT NULL CONSTRAINT [DF_RecordGrantGameID_IDLevel]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantGameID_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantGameID_CollectDate]  DEFAULT (getdate()),
	[Reason] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_RecordGrantGameID] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'CurGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'ReGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'IDLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordAccountsExpend]    脚本日期: 06/25/2012 15:52:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordAccountsExpend](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[OperMasterID] [int] NOT NULL CONSTRAINT [DF_RecordAccountsExpend_OperMasterID]  DEFAULT ((0)),
	[UserID] [int] NOT NULL,
	[ReAccounts] [nvarchar](31) NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_RecordAccountsExpend_ClientIP]  DEFAULT (N'000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordAccountsExpend_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordAccountsExpend] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作网管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'OperMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'ReAccounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordPasswdExpend]    脚本日期: 06/25/2012 15:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordPasswdExpend](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[OperMasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordPasswdExpend_UserID]  DEFAULT ((0)),
	[ReLogonPasswd] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordPasswdExpend_ReLogonPass]  DEFAULT (N'--'),
	[ReInsurePasswd] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordPasswdExpend_ReInsurePass]  DEFAULT (N'--'),
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_RecordPasswdExpend_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordPasswdExpend_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordPasswdExpend] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作网管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'OperMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'ReLogonPasswd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'ReInsurePasswd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordConvertUserMedal]    脚本日期: 06/25/2012 15:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordConvertUserMedal](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CurInsureScore] [bigint] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_CurInsureScore]  DEFAULT ((0)),
	[CurUserMedal] [int] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_CurUserMedal]  DEFAULT ((0)),
	[ConvertUserMedal] [int] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_ConvertUserMedal]  DEFAULT ((0)),
	[ConvertRate] [decimal](18, 2) NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_ConvertRate]  DEFAULT ((0)),
	[IsGamePlaza] [tinyint] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_IsGamePlaza]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_ClientIP]  DEFAULT (''),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordConvertUserMedal] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'CurUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'ConvertUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'ConvertRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否大厅(0:大厅,1:网站)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'IsGamePlaza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordEncashPresent]    脚本日期: 06/25/2012 15:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordEncashPresent](
	[UserID] [int] NOT NULL,
	[CurGold] [bigint] NOT NULL,
	[CurPresent] [int] NOT NULL,
	[EncashGold] [int] NOT NULL,
	[EncashPresent] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[EncashTime] [datetime] NOT NULL CONSTRAINT [DF_RecordEncashPresent_EncashTime]  DEFAULT (getdate())
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'CurGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前礼物数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'CurPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'EncashGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换礼物数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'EncashPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'EncashTime'
GO
/****** 对象:  Table [dbo].[RecordConvertPresent]    脚本日期: 06/25/2012 15:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordConvertPresent](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL CONSTRAINT [DF_RecordConvertPresent_KindID]  DEFAULT ((0)),
	[ServerID] [int] NOT NULL CONSTRAINT [DF_RecordConvertPresent_ServerID]  DEFAULT ((0)),
	[CurInsureScore] [bigint] NOT NULL CONSTRAINT [DF_RecordConvertPresent_CurInsureScore]  DEFAULT ((0)),
	[CurPresent] [int] NOT NULL CONSTRAINT [DF_RecordConvertPresent_CurPresent]  DEFAULT ((0)),
	[ConvertPresent] [int] NOT NULL,
	[ConvertRate] [int] NOT NULL,
	[IsGamePlaza] [tinyint] NOT NULL CONSTRAINT [DF_RecordConvertPresent_IsGamePlaza]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordConvertPresent_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordConvertPresent] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前魅力点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'CurPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换点数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ConvertPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ConvertRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换场所(0:大厅,1:网页)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'IsGamePlaza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
