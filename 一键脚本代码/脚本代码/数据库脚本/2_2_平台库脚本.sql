USE [QPPlatformDB]
GO
/****** 对象:  Table [dbo].[GamePageItem]    脚本日期: 06/25/2012 15:53:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePageItem](
	[PageID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[NodeID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[OperateType] [int] NOT NULL,
	[DisplayName] [nvarchar](32) NOT NULL,
	[ResponseUrl] [nvarchar](256) NOT NULL CONSTRAINT [DF_GamePageItem_ResponseUrl]  DEFAULT (N''),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameCustomItem_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_GameCustomItem_CustomID] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameCustomItem_CustomName] ON [dbo].[GamePageItem] 
(
	[DisplayName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameCustomItem_KindID] ON [dbo].[GamePageItem] 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameCustomItem_OperateType] ON [dbo].[GamePageItem] 
(
	[OperateType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'PageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'NodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'OperateType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'DisplayName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'ResponseUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** 对象:  Table [dbo].[GameTypeItem]    脚本日期: 06/25/2012 15:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTypeItem](
	[TypeID] [int] NOT NULL,
	[JoinID] [int] NOT NULL CONSTRAINT [DF_GameTypeItem_JoinID]  DEFAULT ((0)),
	[SortID] [int] NOT NULL CONSTRAINT [DF_GameTypeItem_SortID]  DEFAULT ((1000)),
	[TypeName] [nvarchar](32) NOT NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameTypeItem_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_GameTypeItem_TypeID] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameTypeItem_JoinID] ON [dbo].[GameTypeItem] 
(
	[JoinID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameTypeItem_SortID] ON [dbo].[GameTypeItem] 
(
	[SortID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameTypeItem_TypeName] ON [dbo].[GameTypeItem] 
(
	[TypeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'JoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem'
GO
/****** 对象:  Table [dbo].[OnLineStatusInfo]    脚本日期: 06/25/2012 15:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnLineStatusInfo](
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[OnLineCount] [int] NOT NULL,
	[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_OnLineStatusInfo_InsertDateTime]  DEFAULT (getdate()),
	[ModifyDateTime] [datetime] NOT NULL CONSTRAINT [DF_OnLineStatusInfo_ModifyDateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_OnLineStatusInfo_ID] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OnLineStatusInfo_InsertDateTime] ON [dbo].[OnLineStatusInfo] 
(
	[InsertDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OnLineStatusInfo_ModifyDateTime] ON [dbo].[OnLineStatusInfo] 
(
	[ModifyDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'OnLineCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'InsertDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'ModifyDateTime'
GO
/****** 对象:  Table [dbo].[GlobalPlayPresent]    脚本日期: 06/25/2012 15:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalPlayPresent](
	[ServerID] [int] NOT NULL,
	[PresentMember] [nvarchar](50) NOT NULL CONSTRAINT [DF_GlobalPlayPresent_PresentMember]  DEFAULT (''),
	[MaxDatePresent] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_MaxGrantDateScore]  DEFAULT ((0)),
	[MaxPresent] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_MaxGrantScore]  DEFAULT ((0)),
	[CellPlayPresnet] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_CellPlayPresnet]  DEFAULT ((0)),
	[CellPlayTime] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_CellPlayTime]  DEFAULT ((0)),
	[StartPlayTime] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_StartPlayTime]  DEFAULT ((0)),
	[CellOnlinePresent] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_CellOnlinePresent]  DEFAULT ((0)),
	[CellOnlineTime] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_CellOnlineTime]  DEFAULT ((0)),
	[StartOnlineTime] [int] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_StartOnlineTime]  DEFAULT ((0)),
	[IsPlayPresent] [tinyint] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_IsPlayPresent]  DEFAULT ((0)),
	[IsOnlinePresent] [tinyint] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_IsOnlinePresent]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_GlobalPlayPresent_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_GlobalPlayPresent_1] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[GameKindItem]    脚本日期: 06/25/2012 15:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameKindItem](
	[KindID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[JoinID] [int] NOT NULL CONSTRAINT [DF_GameKindItem_JoinID]  DEFAULT ((0)),
	[SortID] [int] NOT NULL CONSTRAINT [DF_GameKindItem_SortID]  DEFAULT ((1000)),
	[KindName] [nvarchar](32) NOT NULL,
	[ProcessName] [nvarchar](32) NOT NULL,
	[GameRuleUrl] [nvarchar](256) NOT NULL CONSTRAINT [DF_GameKindItem_ResponseUrl]  DEFAULT (N''),
	[DownLoadUrl] [nvarchar](256) NOT NULL CONSTRAINT [DF_GameKindItem_DownLoadUrl]  DEFAULT (N''),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameKindItem_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_GameKindItem] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameKindItem_JoinID] ON [dbo].[GameKindItem] 
(
	[JoinID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameKindItem_SortID] ON [dbo].[GameKindItem] 
(
	[SortID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameKindItem_TypeID] ON [dbo].[GameKindItem] 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'种类标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'JoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'KindName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进程名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'ProcessName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'GameRuleUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'DownLoadUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** 对象:  Table [dbo].[OnLineStreamInfo]    脚本日期: 06/25/2012 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnLineStreamInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineID] [nvarchar](32) NOT NULL,
	[MachineServer] [nvarchar](32) NOT NULL,
	[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_OnLineStreamInfo_InsertDateTime]  DEFAULT (getdate()),
	[OnLineCountSum] [int] NOT NULL,
	[OnLineCountKind] [nvarchar](2048) NOT NULL,
 CONSTRAINT [PK_OnLineStreamInfo_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OnLineStreamInfo_InsertDateTime] ON [dbo].[OnLineStreamInfo] 
(
	[InsertDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OnLineStreamInfo_MachineSerial] ON [dbo].[OnLineStreamInfo] 
(
	[MachineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OnLineStreamInfo_MachineServer] ON [dbo].[OnLineStreamInfo] 
(
	[MachineServer] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'MachineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'MachineServer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'InsertDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'OnLineCountSum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'OnLineCountKind'
GO
/****** 对象:  Table [dbo].[DataBaseInfo]    脚本日期: 06/25/2012 15:52:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataBaseInfo](
	[DBInfoID] [int] IDENTITY(1,1) NOT NULL,
	[DBAddr] [nvarchar](15) NOT NULL,
	[DBPort] [int] NOT NULL CONSTRAINT [DF_TABLE1_DataBasePort]  DEFAULT ((1433)),
	[DBUser] [nvarchar](512) NOT NULL,
	[DBPassword] [nvarchar](512) NOT NULL,
	[MachineID] [nvarchar](32) NOT NULL CONSTRAINT [DF_DataBaseInfo_MachineID]  DEFAULT (N''),
	[Information] [nvarchar](128) NOT NULL CONSTRAINT [DF_SQLConnectInfo_NoteInfo]  DEFAULT (N'N('')'),
 CONSTRAINT [PK_DataBaseInfo_Index] PRIMARY KEY CLUSTERED 
(
	[DBInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DataBaseInfo_DBAddrDX] ON [dbo].[DataBaseInfo] 
(
	[DBAddr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网络地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'MachineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'Information'
GO
/****** 对象:  Table [dbo].[GameGameItem]    脚本日期: 06/25/2012 15:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameGameItem](
	[GameID] [int] NOT NULL,
	[GameName] [nvarchar](31) NOT NULL,
	[SuporType] [int] NOT NULL,
	[DataBaseAddr] [nvarchar](15) NOT NULL CONSTRAINT [DF_GameGameItem_DBAddr]  DEFAULT (''),
	[DataBaseName] [nvarchar](31) NOT NULL,
	[ServerVersion] [int] NOT NULL CONSTRAINT [DF_GameModuleInfo_ModuleVersion]  DEFAULT ((0)),
	[ClientVersion] [int] NOT NULL CONSTRAINT [DF_GameModuleInfo_ClientVersion]  DEFAULT ((0)),
	[ServerDLLName] [nvarchar](31) NOT NULL,
	[ClientExeName] [nvarchar](31) NOT NULL,
 CONSTRAINT [PK_GameModuleInfo_ModuleID] PRIMARY KEY NONCLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_GameModuleInfo_ModuleID] ON [dbo].[GameGameItem] 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameModuleInfo_ClientExeName] ON [dbo].[GameGameItem] 
(
	[ClientExeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameModuleInfo_ModuleName] ON [dbo].[GameGameItem] 
(
	[GameName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GameModuleInfo_ServerDLLName] ON [dbo].[GameGameItem] 
(
	[ServerDLLName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'GameName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支持类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'SuporType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'DataBaseAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'DataBaseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ServerVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ClientVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务端名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ServerDLLName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ClientExeName'
GO
/****** 对象:  Table [dbo].[GameRoomInfo]    脚本日期: 06/25/2012 15:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameRoomInfo](
	[ServerID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](31) NOT NULL,
	[KindID] [int] NOT NULL,
	[NodeID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[TableCount] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_TableCount]  DEFAULT ((60)),
	[ServerType] [int] NOT NULL,
	[ServerPort] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_ServerPort]  DEFAULT ((0)),
	[DataBaseName] [nvarchar](31) NOT NULL,
	[DataBaseAddr] [nvarchar](15) NOT NULL CONSTRAINT [DF_GameRoomInfo_DataBaseAddr]  DEFAULT (''),
	[CellScore] [bigint] NOT NULL CONSTRAINT [DF_GameRoomInfo_CellScore]  DEFAULT ((0)),
	[RevenueRatio] [tinyint] NOT NULL,
	[ServiceScore] [bigint] NOT NULL CONSTRAINT [DF_GameRoomInfo_ServiceGold]  DEFAULT ((0)),
	[RestrictScore] [bigint] NOT NULL CONSTRAINT [DF_GameRoomInfo_RestrictScore]  DEFAULT ((0)),
	[MinTableScore] [bigint] NOT NULL CONSTRAINT [DF_GameRoomInfo_MinTableScore]  DEFAULT ((0)),
	[MinEnterScore] [bigint] NOT NULL CONSTRAINT [DF_GameRoomInfo_MinEnterScore]  DEFAULT ((0)),
	[MaxEnterScore] [bigint] NOT NULL CONSTRAINT [DF_GameRoomInfo_MaxEnterScore]  DEFAULT ((0)),
	[MinEnterMember] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_MinEnterMember]  DEFAULT ((0)),
	[MaxEnterMember] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_MaxEnterMember]  DEFAULT ((0)),
	[MaxPlayer] [int] NOT NULL,
	[ServerRule] [int] NOT NULL,
	[DistributeRule] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_DistributeRule]  DEFAULT ((0)),
	[MinDistributeUser] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_MinDistributeUser]  DEFAULT ((0)),
	[MaxDistributeUser] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_MaxDistributeUser]  DEFAULT ((0)),
	[DistributeTimeSpace] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_DistributeTimeSpace]  DEFAULT ((0)),
	[DistributeDrawCount] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_DistributeDrawCount]  DEFAULT ((0)),
	[DistributeStartDelay] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_DistributeStartDelay]  DEFAULT ((0)),
	[AttachUserRight] [int] NOT NULL CONSTRAINT [DF_GameRoomInfo_UserRight]  DEFAULT ((0)),
	[ServiceMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_GameRoomInfo_MachineSerial]  DEFAULT (''),
	[CustomRule] [nvarchar](2048) NOT NULL CONSTRAINT [DF_GameRoomInfo_CustomRule]  DEFAULT (''),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameRoomInfo_Nullity]  DEFAULT ((0)),
	[ServerNote] [nvarchar](64) NOT NULL CONSTRAINT [DF_GameRoomInfo_ServerNote]  DEFAULT (''),
	[CreateDateTime] [datetime] NOT NULL CONSTRAINT [DF_GameRoomInfo_CreateDataTime]  DEFAULT (getdate()),
	[ModifyDateTime] [datetime] NOT NULL CONSTRAINT [DF_GameRoomInfo_ModifyDateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_GameRoomInfo_ServerID] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_CreateDateTime] ON [dbo].[GameRoomInfo] 
(
	[CreateDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_KindID] ON [dbo].[GameRoomInfo] 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_ModifyDateTime] ON [dbo].[GameRoomInfo] 
(
	[ModifyDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_ModuleID] ON [dbo].[GameRoomInfo] 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_NodeID] ON [dbo].[GameRoomInfo] 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_ServerType] ON [dbo].[GameRoomInfo] 
(
	[ServerType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_ServiceMachine] ON [dbo].[GameRoomInfo] 
(
	[ServiceMachine] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameRoomInfo_SortID] ON [dbo].[GameRoomInfo] 
(
	[SortID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'NodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'桌子数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'TableCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DataBaseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DataBaseAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'CellScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'税收比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'RevenueRatio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServiceScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'RestrictScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MinTableScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MaxPlayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最少人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MinDistributeUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最多人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MaxDistributeUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组间隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeTimeSpace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeDrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始延时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeStartDelay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运行机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServiceMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'CustomRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止服务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'CreateDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ModifyDateTime'
GO
/****** 对象:  Table [dbo].[SystemMessage]    脚本日期: 06/25/2012 15:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NOT NULL CONSTRAINT [DF_SystemMessage_MessageOption]  DEFAULT ((3)),
	[ServerRange] [nvarchar](1024) NOT NULL CONSTRAINT [DF_SystemMessage_ServerRange]  DEFAULT ((0)),
	[MessageString] [nvarchar](1024) NOT NULL,
	[StartTime] [datetime] NOT NULL CONSTRAINT [DF_SystemMessage_StartTime]  DEFAULT (getdate()),
	[ConcludeTime] [datetime] NOT NULL CONSTRAINT [DF_SystemMessage_ConcludeTime]  DEFAULT (dateadd(year,(1),getdate())),
	[TimeRate] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_SystemMessage_Nullity]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_SystemMessage_CreateDate]  DEFAULT (getdate()),
	[CreateMasterID] [int] NOT NULL CONSTRAINT [DF_SystemMessage_CreateMasterID]  DEFAULT ((0)),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_SystemMessage_LastUpdateDate]  DEFAULT (getdate()),
	[UpdateMasterID] [int] NOT NULL CONSTRAINT [DF_SystemMessage_UpdateMasterID]  DEFAULT ((0)),
	[UpdateCount] [int] NOT NULL CONSTRAINT [DF_SystemMessage_UpdateCount]  DEFAULT ((0)),
	[CollectNote] [nvarchar](512) NOT NULL CONSTRAINT [DF_SystemMessage_CollectNote]  DEFAULT (''),
 CONSTRAINT [PK_SystemMessage_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'索引标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息范围(1:游戏,2:房间,3:全部)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'MessageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间范围(0:所有房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'ServerRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'MessageString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'ConcludeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间频率(多长时间发送一次)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'TimeRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'CreateMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'UpdateMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'UpdateCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** 对象:  Table [dbo].[GameNodeItem]    脚本日期: 06/25/2012 15:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameNodeItem](
	[NodeID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[JoinID] [int] NOT NULL CONSTRAINT [DF_GameStationItem_JoinID]  DEFAULT ((0)),
	[SortID] [int] NOT NULL CONSTRAINT [DF_GameStationItem_SortID]  DEFAULT ((1000)),
	[NodeName] [nvarchar](32) NOT NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameStationItem_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_GameNodeItem] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameStationItem_JoinID] ON [dbo].[GameNodeItem] 
(
	[JoinID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameStationItem_KindID] ON [dbo].[GameNodeItem] 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GameStationItem_SortID] ON [dbo].[GameNodeItem] 
(
	[SortID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'NodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'JoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'NodeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** 对象:  Table [dbo].[SensitiveWords]    脚本日期: 06/25/2012 15:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensitiveWords](
	[ForbidWords] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_SensitiveWords] PRIMARY KEY CLUSTERED 
(
	[ForbidWords] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
