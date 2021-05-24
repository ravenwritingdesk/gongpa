

INSERT  INTO QPProxyDB.dbo.BS_UpdateProcedureLog
        (Version
        ,ProcName
        ,ProcDesc
        ,UpdateContent
        ,UpdateUserName
        ,UpdateTime
        ,ExecTime
        )
VALUES
        (10041
        ,'3.3升级3.4版本'
        ,'3.3升级3.4版本'
        ,'3.3版本数据库升级到3.4更新相关'
        ,'XieYQ'
        ,'2016-05-23 17:00'
        ,GETDATE()
        )

USE [QPProxyDB]
/****** Object:  StoredProcedure [dbo].[BS_GetOperatorMemberScore]    Script Date: 2015/9/7 19:19:39 ******/
IF EXISTS ( SELECT
                *
            FROM
                sys.objects
            WHERE
                name = 'BS_GetOperatorMemberScore' AND
                type = 'P' )
    DROP PROCEDURE [dbo].BS_GetOperatorMemberScore
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
author: 谭永吉
create date: 2015-08-27
description: 获取推广员的所有下线会员以及推广员的上下分
--2015-09-09 查询增加类型为2的为提现
--2016.5.16 增加开始时间和结束时间查询条件  add by xieyq
**/
CREATE PROCEDURE [dbo].[BS_GetOperatorMemberScore]	 --exec  [BS_GetOperatorMemberScore] 6,0, 0,100,0
    @ProxyId INT = 0
   ,@Operate INT
   ,  --0上分 1下分
    @startIndex INT
   ,@endIndex INT
   ,@doCount BIT
   ,@OrderByStr VARCHAR(30) = NULL
   ,@BeginTime DATETIME
   ,@EndTime DATETIME
    WITH ENCRYPTION
AS
    BEGIN
        IF ( @doCount = 1 )
            BEGIN
                SELECT
                    COUNT(*)
                FROM
                    BS_ScoreChangeRecord AS s
                    INNER JOIN QPAccountsDB.dbo.AccountsInfo AS info ON s.Target = info.UserID
                    INNER JOIN BS_ProxyInfo AS p ON s.Operator = p.ProxyID
                WHERE
                    s.Type = 0 AND
                    s.Operator = @ProxyId AND
                    ( s.Operate = @Operate OR
                      s.Operate = CASE WHEN @Operate = 1 THEN 2
                                       ELSE s.Operate
                                  END
                    ) AND
                    CreateTime >= CASE WHEN @BeginTime = '' OR
                                            @EndTime = '' THEN CreateTime
                                       ELSE @BeginTime
                                  END AND
                    CreateTime <= CASE WHEN @BeginTime = '' OR
                                            @EndTime = '' THEN CreateTime
                                       ELSE @EndTime
                                  END
            END
        ELSE
            BEGIN
                IF ( ISNULL(@OrderByStr, '') = '' )
                    BEGIN
                        SET @OrderByStr = ' CreateTime DESC'
                    END
                CREATE TABLE #OperatorMemberScoreTempList
                    (
                     CreateTime DATETIME
                    ,OpPreviouScore BIGINT
                    ,ChangeScore BIGINT
                    ,SrcScore BIGINT
                    ,Account VARCHAR(31)
                    ,Name VARCHAR(31)
                    ,OperateAccount VARCHAR(31)
                    ,OperateName VARCHAR(31)
                    ,Operate INT
                    ,OperateType VARCHAR(6)
                    ,HandlerUserAccount VARCHAR(31)
                    )

                INSERT  INTO #OperatorMemberScoreTempList
                        (CreateTime
                        ,OpPreviouScore
                        ,ChangeScore
                        ,SrcScore
                        ,Account
                        ,Name
                        ,OperateAccount
                        ,OperateName
                        ,Operate
                        ,OperateType
                        ,HandlerUserAccount
				        )
                        SELECT
                            s.CreateTime
                           ,( s.SrcScore - s.ChangeScore ) AS 'OpPreviouScore'
                           ,s.ChangeScore
                           ,s.SrcScore
                           ,info.Accounts AS 'Account'
                           ,info.Compellation AS 'Name'
                           ,p.account AS 'OperateAccount'
                           ,p.name AS 'OperateName'
                           ,s.Operate
                           ,CASE s.Operate
                              WHEN 0 THEN '代充'
                              WHEN 1 THEN '充值'
                              ELSE '商品兑换'
                            END AS 'OperateType'
                           ,s.HandlerUserAccount
                        FROM
                            BS_ScoreChangeRecord AS s
                            INNER JOIN QPAccountsDB.dbo.AccountsInfo AS info ON s.Target = info.UserID
                            INNER JOIN BS_ProxyInfo AS p ON s.Operator = p.ProxyID
                        WHERE
                            s.Type = 0 AND
                            s.Operator = @ProxyId AND
                            ( s.Operate = @Operate OR
                              s.Operate = CASE WHEN @Operate = 1 THEN 2
                                               ELSE 0
                                          END
                            ) AND
                            s.CreateTime >= CASE WHEN @BeginTime = '' OR
                                                      @EndTime = ''
                                                 THEN s.CreateTime
                                                 ELSE @BeginTime
                                            END AND
                            s.CreateTime <= CASE WHEN @BeginTime = '' OR
                                                      @EndTime = ''
                                                 THEN s.CreateTime
                                                 ELSE @EndTime
                                            END

                DECLARE @Sql NVARCHAR(500)
                SET @Sql = 'WITH    DataPager
							AS (SELECT *,ROW_NUMBER() OVER ( ORDER BY ' +
                    @OrderByStr + '  ) AS RowIndex
											FROM #OperatorMemberScoreTempList
										)
							SELECT  *
							FROM    DataPager
							WHERE   RowIndex BETWEEN ' +
                    CAST(@startIndex AS NVARCHAR(5)) + ' AND ' +
                    CAST(@endIndex AS NVARCHAR(5))
                EXEC (@Sql)	
                DROP TABLE #OperatorMemberScoreTempList	
            END
    END




GO
/****** Object:  StoredProcedure [dbo].[BS_GetOperatorProxyScore]    Script Date: 2015/9/7 19:19:39 ******/
IF EXISTS ( SELECT
                *
            FROM
                sys.objects
            WHERE
                name = 'BS_GetOperatorProxyScore' AND
                type = 'P' )
    DROP PROCEDURE [dbo].BS_GetOperatorProxyScore
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**
	author: 谭永吉
	create date: 2015-08-27
	description: 获取代理的所有下线代理的上下分
	--2016.5.16 增加开始时间和结束时间查询条件  add by xieyq
**/
CREATE PROCEDURE [dbo].[BS_GetOperatorProxyScore]	 --exec  [BS_GetOperatorProxyScore] 1,0, 0,10,0,'OpPreviouScore desc'
    @ProxyId INT = 0
   ,@Operate INT
   ,  --0上分 1下分
    @startIndex INT
   ,@endIndex INT
   ,@doCount BIT
   ,@OrderByStr VARCHAR(30) = NULL
   ,@BeginTime DATETIME
   ,@EndTime DATETIME
    WITH ENCRYPTION
AS
    BEGIN
        IF ( @doCount = 1 )
            BEGIN
                SELECT
                    COUNT(*)
                FROM
                    BS_ScoreChangeRecord AS s
                    INNER JOIN BS_ProxyInfo AS p1 ON s.Operator = p1.ProxyID
                    INNER JOIN BS_ProxyInfo AS p2 ON s.Target = p2.ProxyID
                WHERE
                    s.Type = 1 AND
                    s.Operator = @ProxyId AND
                    s.Operate = @Operate AND
                    CreateTime >= CASE WHEN @BeginTime = '' OR
                                            @EndTime = '' THEN CreateTime
                                       ELSE @BeginTime
                                  END AND
                    CreateTime <= CASE WHEN @BeginTime = '' OR
                                            @EndTime = '' THEN CreateTime
                                       ELSE @EndTime
                                  END
            END
        ELSE
            BEGIN
                IF ( ISNULL(@OrderByStr, '') = '' )
                    BEGIN
                        SET @OrderByStr = ' CreateTime DESC'
                    END
                CREATE TABLE #OperatorProxyScoreTempList
                    (
                     CreateTime DATETIME
                    ,OpPreviouScore BIGINT
                    ,ChangeScore BIGINT
                    ,SrcScore BIGINT
                    ,Account VARCHAR(31)
                    ,Name VARCHAR(31)
                    ,OperateAccount VARCHAR(31)
                    ,OperateName VARCHAR(31)
                    ,Operate INT
                    ,OperateType VARCHAR(6)
                    ,HandlerUserAccount VARCHAR(31)
                    )

                INSERT  INTO #OperatorProxyScoreTempList
                        (CreateTime
                        ,OpPreviouScore
                        ,ChangeScore
                        ,SrcScore
                        ,Account
                        ,Name
                        ,OperateAccount
                        ,OperateName
                        ,Operate
                        ,OperateType
                        ,HandlerUserAccount
				        )
                        SELECT
                            s.CreateTime
                           ,( s.SrcScore - s.ChangeScore ) AS 'OpPreviouScore'
                           ,s.ChangeScore
                           ,s.SrcScore
                           ,p2.account AS 'Account'
                           ,p2.Name AS 'Name'
                           ,p1.account AS 'OperateAccount'
                           ,p1.name AS 'OperateName'
                           ,s.Operate
                           ,CASE @Operate
                              WHEN 0 THEN '代充'
                              ELSE '商品兑换'
                            END AS 'OperateType'
                           ,s.HandlerUserAccount
                        FROM
                            BS_ScoreChangeRecord AS s
                            INNER JOIN BS_ProxyInfo AS p1 ON s.Operator = p1.ProxyID
                            INNER JOIN BS_ProxyInfo AS p2 ON s.Target = p2.ProxyID
                        WHERE
                            s.Type = 1 AND
                            s.Operator = @ProxyId AND
                            s.Operate = @Operate AND
                            CreateTime >= CASE WHEN @BeginTime = '' OR
                                                    @EndTime = ''
                                               THEN CreateTime
                                               ELSE @BeginTime
                                          END AND
                            CreateTime <= CASE WHEN @BeginTime = '' OR
                                                    @EndTime = ''
                                               THEN CreateTime
                                               ELSE @EndTime
                                          END

                DECLARE @Sql NVARCHAR(500)
                SET @Sql = 'WITH    DataPager
                          AS (SELECT *,ROW_NUMBER() OVER ( ORDER BY ' +
                    @OrderByStr + '  ) AS RowIndex
										 FROM #OperatorProxyScoreTempList
                             )
                    SELECT  *
                    FROM    DataPager
                    WHERE   RowIndex BETWEEN ' +
                    CAST(@startIndex AS NVARCHAR(5)) + ' AND ' +
                    CAST(@endIndex AS NVARCHAR(5))
                EXEC (@Sql)	
                DROP TABLE #OperatorProxyScoreTempList	
            END
    END
GO

/****** Object:  StoredProcedure [dbo].[BS_GetPayOrders]    Script Date: 2015/9/7 19:19:39 ******/
IF EXISTS ( SELECT
                *
            FROM
                sys.objects
            WHERE
                name = 'BS_GetPayOrders' AND
                type = 'P' )
    DROP PROCEDURE [dbo].BS_GetPayOrders
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
	--2016.5.16 增加结束时间查询条件@orderEndTime  add by xieyq
	扩展日期区间查询条件			
**/
CREATE PROCEDURE [dbo].[BS_GetPayOrders]	    --EXEC [BS_GetPayOrders] 0,0,99,0,null,0,0,100,0
    @proxyId INT = 0
   ,@userID INT = 0
   ,@orderStatus INT = 99
   ,@orderType INT = 0
   ,@orderTime DATETIME = NULL
   ,	--订单时间(没有结束时间)/开始时间
    @orderEndTime DATETIME = NULL
   ,	--结束时间
    @category INT = 0
   ,@startIndex INT
   ,   --开始记录索引
    @endIndex INT
   ,		--开始记录索引
    @doCount BIT
   ,	--是否统计
    @OrderByStr VARCHAR(50) = NULL
    WITH ENCRYPTION
AS
    BEGIN	
			
        IF ( @doCount = 1 )
            BEGIN
                SELECT
                    COUNT(*) AS RecordCount
                FROM
                    BS_PayOrders
                    INNER JOIN BS_Members ON BS_Members.UserID = BS_PayOrders.UserId
                WHERE
                    BS_PayOrders.UserID = CASE WHEN @UserID <= 0
                                               THEN BS_PayOrders.UserID
                                               ELSE @userID
                                          END AND
                    BS_PayOrders.ProxyId = CASE WHEN @proxyId = 0
                                                THEN BS_PayOrders.ProxyId
                                                ELSE @proxyId
                                           END AND
                    OrderType = CASE WHEN @orderType = 0 THEN OrderType
                                     ELSE @orderType
                                END AND
                    OrderStatus = CASE WHEN @orderStatus = 99 THEN OrderStatus
                                       ELSE @orderStatus
                                  END AND
                    OrderCategory = CASE WHEN @category = 0 THEN OrderCategory
                                         ELSE @category
                                    END AND
                    --DATEDIFF(DAY, OrderTime,
                    --         ( CASE WHEN @orderTime IS NULL OR
                    --                     @orderTime = '' THEN OrderTime
                    --                ELSE @orderTime
                    --           END )) = 0 AND
                    OrderTime >= CASE WHEN @orderTime IS NULL OR
                                           @orderTime = '' THEN OrderTime
                                      ELSE @orderTime
                                 END AND
                    OrderTime <= CASE WHEN @orderEndTime IS NULL OR
                                           @orderEndTime = '' THEN OrderTime
                                      ELSE @orderEndTime
                                 END


            END
        ELSE
            BEGIN	
                IF ( ISNULL(@OrderByStr, '') = '' )
                    BEGIN
                        SET @OrderByStr = ' ABS(OrderStatus) ASC, OrderTime DESC'
                    END	
                CREATE TABLE #PayOrdersTempList
                    (
                     [OrderId] [BIGINT] NOT NULL
                    ,[OrderNo] [NVARCHAR](20) NOT NULL
                    ,[UserId] [INT] NOT NULL
                    ,[OrderStatus] [INT] NOT NULL
                    ,[PayAmount] [BIGINT] NOT NULL
                    ,[GameAmount] [BIGINT] NOT NULL
                    ,[ThreeOrderNo] [NVARCHAR](50) NULL
                    ,[OrderType] [INT] NULL
                    ,[OrderTime] [DATETIME] NOT NULL
                    ,[SubmitRemark] [NVARCHAR](50) NULL
                    ,[CancelRemark] [NVARCHAR](50) NULL
                    ,[ProxyId] [INT] NULL
                    ,[OrderCategory] INT
                    ,[HandlerUserId] INT
                    ,[HandlerUserAccount] VARCHAR(50)
                    ,[HandlerTime] DATETIME
                    )
					
                INSERT  INTO #PayOrdersTempList
                        (OrderId
                        ,OrderNo
                        ,UserId
                        ,OrderStatus
                        ,PayAmount
                        ,GameAmount
                        ,ThreeOrderNo
                        ,OrderType
                        ,OrderTime
                        ,SubmitRemark
                        ,CancelRemark
                        ,ProxyId
                        ,[OrderCategory]
                        ,[HandlerUserId]
                        ,[HandlerUserAccount]
                        ,[HandlerTime] 
				        )
                        SELECT
                            BS_PayOrders.OrderId
                           ,BS_PayOrders.OrderNo
                           ,BS_PayOrders.UserId
                           ,BS_PayOrders.OrderStatus
                           ,BS_PayOrders.PayAmount
                           ,BS_PayOrders.GameAmount
                           ,BS_PayOrders.ThreeOrderNo
                           ,BS_PayOrders.OrderType
                           ,BS_PayOrders.OrderTime
                           ,BS_PayOrders.SubmitRemark
                           ,BS_PayOrders.CancelRemark
                           ,BS_PayOrders.ProxyId
                           ,BS_PayOrders.OrderCategory
                           ,BS_PayOrders.HandlerUserId
                           ,BS_PayOrders.HandlerUserAccount
                           ,BS_PayOrders.HandlerTime
                        FROM
                            BS_PayOrders
                            INNER JOIN BS_Members ON BS_Members.UserID = BS_PayOrders.UserId
                        WHERE
                            BS_PayOrders.UserID = CASE WHEN @UserID <= 0
                                                       THEN BS_PayOrders.UserID
                                                       ELSE @userID
                                                  END AND
                            BS_PayOrders.ProxyId = CASE WHEN @proxyId = 0
                                                        THEN BS_PayOrders.ProxyId
                                                        ELSE @proxyId
                                                   END AND
                            OrderType = CASE WHEN @orderType = 0
                                             THEN OrderType
                                             ELSE @orderType
                                        END AND
                            OrderStatus = CASE WHEN @orderStatus = 99
                                               THEN OrderStatus
                                               ELSE @orderStatus
                                          END AND
                            OrderCategory = CASE WHEN @category = 0
                                                 THEN OrderCategory
                                                 ELSE @category
                                            END AND
                            --DATEDIFF(DAY, OrderTime,
                            --         ( CASE WHEN @orderTime IS NULL OR
                            --                     @orderTime = ''
                            --                THEN OrderTime
                            --                ELSE @orderTime
                            --           END )) = 0 AND
                            OrderTime >= CASE WHEN @orderTime IS NULL OR
                                                   @orderTime = ''
                                              THEN OrderTime
                                              ELSE @orderTime
                                         END AND
                            OrderTime <= CASE WHEN @orderEndTime IS NULL OR
                                                   @orderEndTime = ''
                                              THEN OrderTime
                                              ELSE @orderEndTime
                                         END
                DECLARE @Sql NVARCHAR(500)
                SET @Sql = 'WITH    DataPager
							AS (SELECT *,ROW_NUMBER() OVER ( ORDER BY ' +
                    @OrderByStr + '  ) AS RowIndex
											FROM #PayOrdersTempList )
							SELECT  *
							FROM    DataPager
							WHERE   RowIndex BETWEEN ' +
                    CAST(@startIndex AS NVARCHAR(5)) + ' AND ' +
                    CAST(@endIndex AS NVARCHAR(5))
                EXEC (@Sql)	
                DROP TABLE #PayOrdersTempList	
            END
    END

GO

/**
	--2016.5.16 增加充值金额大于小于查询条件,扩展查询条件  add by xieyq	
**/
/****** Object:  StoredProcedure [dbo].[BS_GetPayOrders]    Script Date: 2015/9/7 19:19:39 ******/
IF EXISTS ( SELECT
                *
            FROM
                sys.objects
            WHERE
                name = 'BS_GetPayOrders1' AND
                type = 'P' )
    DROP PROCEDURE [dbo].BS_GetPayOrders1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BS_GetPayOrders1]	  -- EXEC [BS_GetPayOrders1] 0,0,99,0,NULL,NULL,0,0,100,0		   
    @proxyId INT = 0
   ,@userID INT = 0
   ,@orderStatus INT = 99
   ,@orderType INT = 0
   ,@startDate DATETIME = NULL
   ,	--申请时间
    @endDate DATETIME = NULL
   ,	--申请时间
    @category INT = 0
   ,@startIndex INT
   ,   --开始记录索引
    @endIndex INT
   ,		--结束记录索引
    @doCount BIT
   ,	--是否统计
    @HandlerUserAccount VARCHAR(50)
   ,@OrderByStr VARCHAR(50) = NULL
   ,@querypayAmountType INT = 0
   ,  --充值金额 0 小于，1大于
    @payAmount INT = NULL  --充值金额 0为查询全部
    WITH ENCRYPTION
AS
    BEGIN
        SET @orderStatus = 1
        IF ( ISNULL(@startDate, '') = '' )
            BEGIN
                SET @startDate = '2015-10-01'
            END	
        IF ( ISNULL(@endDate, '') = '' )
            BEGIN
                SET @endDate = GETDATE()
            END	
        IF ( ISNULL(@OrderByStr, '') = '' )
            BEGIN
                SET @OrderByStr = ' ABS(OrderStatus) ASC, OrderTime DESC'
            END	
        IF ( @doCount = 1 )
            BEGIN
                SELECT
                    COUNT(*) AS RecordCount
                FROM
                    BS_PayOrders
                    INNER JOIN BS_Members ON BS_Members.UserID = BS_PayOrders.UserId
                WHERE
                    BS_PayOrders.UserID = CASE WHEN @UserID <= 0
                                               THEN BS_PayOrders.UserID
                                               ELSE @userID
                                          END AND
                    BS_PayOrders.ProxyId = CASE WHEN @proxyId = 0 OR
                                                     @proxyId = 1
                                                THEN BS_PayOrders.ProxyId
                                                ELSE @proxyId
                                           END AND
                    OrderType NOT IN ( CASE WHEN @orderType = 200 THEN 201
                                            ELSE 0
                                       END,
                                       CASE WHEN @orderType = 200 THEN 203
                                            ELSE 0
                                       END ) AND
                    OrderType IN ( CASE WHEN @orderType = 201 THEN 201
                                        ELSE OrderType
                                   END, CASE WHEN @orderType = 201 THEN 203
                                             ELSE OrderType
                                        END ) AND
                    OrderStatus NOT IN ( 0, -1 ) AND
                    OrderCategory = CASE WHEN @category = 100 OR
                                              @category = 101 THEN @category
                                         ELSE OrderCategory
                                    END AND
                    OrderCategory NOT IN ( CASE WHEN @category = 102 THEN 100
                                                ELSE 0
                                           END,
                                           CASE WHEN @category = 102 THEN 101
                                                ELSE 0
                                           END ) AND
                    ( HandlerTime BETWEEN @startDate AND @endDate ) AND
                    HandlerUserAccount = CASE WHEN ISNULL(@HandlerUserAccount,
                                                          '') <> ''
                                              THEN @HandlerUserAccount
                                              ELSE HandlerUserAccount
                                         END AND
                    PayAmount <= CASE WHEN @querypayAmountType = 0 AND
                                           @payAmount IS not NULL THEN @payAmount
                                      ELSE PayAmount
                                 END AND
                    PayAmount >= CASE WHEN @querypayAmountType = 1 AND
                                           @payAmount is not NULL THEN @payAmount
                                      ELSE PayAmount
                                 END
            END
        ELSE
            BEGIN	
                CREATE TABLE #PayOrdersTempList
                    (
                     [OrderId] [BIGINT] NOT NULL
                    ,[OrderNo] [NVARCHAR](20) NOT NULL
                    ,[UserId] [INT] NOT NULL
                    ,[OrderStatus] [INT] NOT NULL
                    ,[PayAmount] [BIGINT] NOT NULL
                    ,[GameAmount] [BIGINT] NOT NULL
                    ,[ThreeOrderNo] [NVARCHAR](50) NULL
                    ,[OrderType] [INT] NULL
                    ,[OrderTime] [DATETIME] NOT NULL
                    ,[SubmitRemark] [NVARCHAR](50) NULL
                    ,[CancelRemark] [NVARCHAR](50) NULL
                    ,[ProxyId] [INT] NULL
                    ,[OrderCategory] INT
                    ,[HandlerUserId] INT
                    ,[HandlerUserAccount] VARCHAR(50)
                    ,[HandlerTime] DATETIME
                    )
					
                INSERT  INTO #PayOrdersTempList
                        (OrderId
                        ,OrderNo
                        ,UserId
                        ,OrderStatus
                        ,PayAmount
                        ,GameAmount
                        ,ThreeOrderNo
                        ,OrderType
                        ,OrderTime
                        ,SubmitRemark
                        ,CancelRemark
                        ,ProxyId
                        ,[OrderCategory]
                        ,[HandlerUserId]
                        ,[HandlerUserAccount]
                        ,[HandlerTime] 
				        )
                        SELECT
                            BS_PayOrders.OrderId
                           ,BS_PayOrders.OrderNo
                           ,BS_PayOrders.UserId
                           ,BS_PayOrders.OrderStatus
                           ,BS_PayOrders.PayAmount
                           ,BS_PayOrders.GameAmount
                           ,BS_PayOrders.ThreeOrderNo
                           ,BS_PayOrders.OrderType
                           ,BS_PayOrders.OrderTime
                           ,BS_PayOrders.SubmitRemark
                           ,BS_PayOrders.CancelRemark
                           ,BS_PayOrders.ProxyId
                           ,BS_PayOrders.OrderCategory
                           ,BS_PayOrders.HandlerUserId
                           ,BS_PayOrders.HandlerUserAccount
                           ,BS_PayOrders.HandlerTime
                        FROM
                            BS_PayOrders
                            INNER JOIN BS_Members ON BS_Members.UserID = BS_PayOrders.UserId
                        WHERE
                            BS_PayOrders.UserID = CASE WHEN @UserID <= 0
                                                       THEN BS_PayOrders.UserID
                                                       ELSE @userID
                                                  END AND
                            BS_PayOrders.ProxyId = CASE WHEN @proxyId = 0 OR
                                                             @proxyId = 1
                                                        THEN BS_PayOrders.ProxyId
                                                        ELSE @proxyId
                                                   END AND
                            OrderType NOT IN (
                            CASE WHEN @orderType = 200 THEN 201
                                 ELSE 0
                            END, CASE WHEN @orderType = 200 THEN 203
                                      ELSE 0
                                 END ) AND
                            OrderType IN ( CASE WHEN @orderType = 201 THEN 201
                                                ELSE OrderType
                                           END,
                                           CASE WHEN @orderType = 201 THEN 203
                                                ELSE OrderType
                                           END ) AND
                            OrderStatus NOT IN ( 0, -1 ) AND
                            OrderCategory = CASE WHEN @category = 100 OR
                                                      @category = 101
                                                 THEN @category
                                                 ELSE OrderCategory
                                            END AND
                            OrderCategory NOT IN (
                            CASE WHEN @category = 102 THEN 100
                                 ELSE 0
                            END, CASE WHEN @category = 102 THEN 101
                                      ELSE 0
                                 END ) AND
                            ( HandlerTime BETWEEN @startDate AND @endDate ) AND
                            HandlerUserAccount = CASE WHEN ISNULL(@HandlerUserAccount,
                                                              '') <> ''
                                                      THEN @HandlerUserAccount
                                                      ELSE HandlerUserAccount
                                                 END AND
                            PayAmount <= CASE WHEN @querypayAmountType = 0 AND
                                                   @payAmount IS not NULL
                                              THEN @payAmount
                                              ELSE PayAmount
                                         END AND
                            PayAmount >= CASE WHEN @querypayAmountType = 1 AND
                                                   @payAmount IS not NULL
                                              THEN @payAmount
                                              ELSE PayAmount
                                         END

                DECLARE @Sql NVARCHAR(500)
                SET @Sql = 'WITH    DataPager
							AS (SELECT *,ROW_NUMBER() OVER ( ORDER BY ' +
                    @OrderByStr + '  ) AS RowIndex
											FROM #PayOrdersTempList
								)
							SELECT  *
							FROM    DataPager
							WHERE   RowIndex BETWEEN ' +
                    CAST(@startIndex AS NVARCHAR(5)) + ' AND ' +
                    CAST(@endIndex AS NVARCHAR(5))
                EXEC (@Sql)	
                DROP TABLE #PayOrdersTempList	
            END
    END
GO


USE QPProxyDB
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   name = 'BS_GetGameRecord'
                    AND type = 'P' )
    DROP PROCEDURE [dbo].BS_GetGameRecord
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BS_GetGameRecord]		--EXEC [BS_GetGameRecord] 1,0,0 ,'',0,'2015-11-27 0:00:0.987',NULL,0,10,0
    @ProxyId INT ,
    @SubProxyId INT ,
    @UserID INT ,
    @UserName NVARCHAR(20) ,
    @gameId INT ,
    @BeginTime DATETIME ,
    @EndTime DATETIME ,
    @startIndex INT ,
    @endIndex INT ,
    @doCount TINYINT ,
    @OrderByStr VARCHAR(30) = NULL
    WITH ENCRYPTION
AS
    BEGIN
        DECLARE @szBeginTime DATETIME
        DECLARE @szEndTime DATETIME

        IF @BeginTime IS NULL
            SELECT  @szBeginTime = DATEADD(DAY, -1, GETDATE())
        ELSE
            SELECT  @szBeginTime = @BeginTime
	
        IF @EndTime IS NULL
            SELECT  @szEndTime = GETDATE()
        ELSE
            SELECT  @szEndTime = CASE WHEN @EndTime > GETDATE() THEN GETDATE()
                                      ELSE @EndTime
                                 END;
        IF ( @SubProxyId <= 0
             AND ( ISNULL(@UserID, 0) <= 0 )
             AND ISNULL(@UserName, 0) = ''
           )
            BEGIN
                SET @SubProxyId = @ProxyId
            END
								 
--申明表变量（保存下级所有推广员）
        DECLARE @SubProxyList TABLE
            (
              ProxyId INT ,
              BelongsAgent INT
            );
        INSERT  @SubProxyList
                EXEC BS_GetAllSubProxy @proxyID = @proxyID
		
        IF ( @SubProxyId > 0 )
            BEGIN
                DELETE  @SubProxyList
                WHERE   ProxyId <> @SubProxyId
            END
			    
				
		DECLARE @ALLUSERIDS TABLE
        (
           UserID INT 
         );

	    --先建立临时表把小表数据的UserID集合拿到手
		INSERT @ALLUSERIDS
		SELECT M.UserID FROM BS_Members M INNER JOIN QPAccountsDB.dbo.AccountsInfo (NOLOCK) AI ON M.UserID=AI.UserID
		WHERE EXISTS (SELECT 1 FROM @SubProxyList WHERE  M.belongsAgent = ProxyId)
			  AND AI.Accounts = CASE WHEN @UserName = '' OR @UserName IS NULL
								    THEN AI.Accounts
                                       ELSE @UserName
                                    END
			  AND AI.UserID =   CASE WHEN @UserID <= 0 OR @UserID IS NULL
                                      THEN AI.UserID
                                      ELSE @UserID
                                    END		
				
	        
        IF (@doCount = 1 )
            BEGIN               
				SELECT  COUNT(*) AS RecordCount
                FROM    QPTreasureDB.dbo.RecordDrawScore RDS                        
                        INNER JOIN QPTreasureDB.dbo.RecordDrawInfo (NOLOCK) RDI ON RDI.DrawID = RDS.DrawID
                WHERE            
				             
                        RDI.KindID = CASE WHEN @gameId <= 0 OR @gameId IS NULL
                                              THEN RDI.KindID
                                              ELSE @gameId
                                         END
                        AND RDS.InsertTime BETWEEN @szBeginTime AND @szEndTime
						AND RDS.UserID IN (SELECT UserID FROM @ALLUSERIDS) --这里只需要取集合里面的数据即可
                      
            END
        ELSE
            BEGIN
				CREATE TABLE  #GameRecordTempList(
					UserID	INT,
					UserName	NVARCHAR(31),
					ComName	NVARCHAR(31),
					RoomName	NVARCHAR(31),
					ChangeMoney	BIGINT,
					Tax	BIGINT,
					rebate	INT,
					Revenue	BIGINT,
					EndTime	DATETIME
				)

				INSERT INTO #GameRecordTempList
				        ( UserID ,
				          UserName ,
				          ComName ,
				          RoomName ,
				          ChangeMoney ,
				          Tax ,
				          rebate ,
				          Revenue ,
				          EndTime
				        )
						SELECT  
					    RDS.UserID ,
                        RDS.UserAccounts AS UserName ,
                        RDI.ServerID AS ComName ,
                        RDI.ServerName AS RoomName ,
                        RDS.Score AS ChangeMoney ,
                        RDS.Choushui AS Tax ,
                        0 AS rebate ,
                        RDS.Revenue ,
                        RDS.InsertTime AS EndTime
                FROM    QPTreasureDB.dbo.RecordDrawScore RDS
                        INNER JOIN QPTreasureDB.dbo.RecordDrawInfo RDI (NOLOCK) ON RDI.DrawID = RDS.DrawID
                WHERE   
                        
                        RDI.KindID = CASE WHEN @gameId <= 0 OR @gameId IS NULL
                                              THEN RDI.KindID
                                              ELSE @gameId
                                         END
                        AND RDS.InsertTime BETWEEN @szBeginTime AND @szEndTime
                      	AND RDS.UserID IN (SELECT UserID FROM @ALLUSERIDS) --这里只需要取集合里面的数据即可

                IF ( ISNULL(@OrderByStr, '') = '' )
                    BEGIN

					SET @OrderByStr=' EndTime Desc '
                    END
               
                DECLARE @Sql NVARCHAR(500)
                SET @Sql = 'SELECT * FROM (SELECT  * ,ROW_NUMBER() OVER ( ORDER BY '
                    + @OrderByStr + ' ) AS RowIndex
				FROM    #GameRecordTempList ) T1
				WHERE   RowIndex BETWEEN ' + CAST(@startIndex AS NVARCHAR(5))
								+ ' AND ' + CAST(@endIndex AS NVARCHAR(5))
                EXEC (@Sql)

                SELECT  SUM(ChangeMoney) AS totalChangeMoney ,
                        SUM(Tax) AS totalTax ,
                        SUM(Revenue) AS totalRevenue
                FROM    #GameRecordTempList

				DROP TABLE #GameRecordTempList
            END
    END

GO


USE QPProxyDB
IF EXISTS ( SELECT  1
            FROM    sys.objects
            WHERE   name = 'BS_GetTempScoreReport'
                    AND type = 'P' )
    DROP PROCEDURE 	BS_GetTempScoreReport
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE BS_GetTempScoreReport	 --exec  BS_GetTempScoreReport	'2015-11-1 17:55:08.050',34329
    @CalculateDate DATETIME ,
    @GetType INT ,  --0 会员 1推广员
    @ProxyId INT = 0	--要计算的推广员Id				  
    WITH ENCRYPTION
AS
    BEGIN
        IF ( @CalculateDate IS NULL
             OR @GetType IS NULL
           )
            RETURN;
        PRINT @ProxyId
        IF ( @ProxyId = 0 )
            BEGIN
                SELECT  @ProxyId = ProxyID
                FROM    dbo.BS_ProxyInfo (NOLOCK)
                WHERE   belongsAgent = -1
            END
        DECLARE @NowTime DATETIME= GETDATE() ,
            @CalculateDateStart DATETIME= CONVERT(VARCHAR(10), @CalculateDate, 120) ,
            @CalculateDateEnd DATETIME= CONVERT(VARCHAR(10), DATEADD(DAY, 1,
                                                              @CalculateDate), 120)
--申明表变量（保存下级所有推广员）
        CREATE TABLE #SubProxyList
            (
              ProxyId INT ,
              BelongsAgent INT
            );

        DECLARE @SubUserIdList TABLE
            (
              UserId INT ,
              BelongAgent INT
            );

        IF ( @ProxyId = 1 )
            BEGIN
                INSERT  #SubProxyList
                        SELECT  ProxyId ,
                                BelongsAgent
                        FROM    dbo.BS_ProxyInfo
                        ORDER BY ProxyLevel ASC
            END
        ELSE
            BEGIN
                DECLARE @SubProxyId VARCHAR(MAX)
                DECLARE @Sql VARCHAR(MAX)
                SELECT  @SubProxyId = SubProxyId
                FROM    SubdivideProxyId
                WHERE   ProxyId = @ProxyId
                SET @Sql = 'INSERT  #SubProxyList SELECT ProxyId,BelongsAgent FROM dbo.BS_ProxyInfo WHERE ProxyID IN( '
                    + @SubProxyId + ')  ORDER BY ProxyLevel ASC '
                EXEC  (@Sql)
            END

--记录所有用户
        DECLARE @Temp_ScoreReport TABLE
            (
              UserId INT ,
              Accounts VARCHAR(50) ,
              BelongAgent INT ,
              UpScore BIGINT ,
              DownScore BIGINT ,
              WinScore BIGINT ,
              TempTax BIGINT ,
              TotalUpScore BIGINT ,
              TotalDownScore BIGINT ,
              BlanceScore BIGINT ,
              CreateTime DATETIME
            )

		--构造一个游戏记录当天的临时表
		CREATE TABLE #RecordDrawScoreUserids(UserID INT);

        INSERT #RecordDrawScoreUserids SELECT   UserID
                                          FROM      QPTreasureDB.dbo.RecordDrawScore (NOLOCK)
                                                    AS RDS
                                          WHERE    
                                                     RDS.InsertTime BETWEEN @CalculateDateStart
                                                              AND
                                                              @CalculateDateEnd


       CREATE TABLE #ScoreReport_list(
		UserId INT ,
        Accounts VARCHAR(50) ,
        BelongAgent INT ,
        UpScore BIGINT ,
        DownScore BIGINT ,
        WinScore BIGINT ,
        TempTax BIGINT ,
        TotalUpScore BIGINT ,
        TotalDownScore BIGINT ,
        BlanceScore BIGINT ,
        CreateTime DATETIME
       )
	  INSERT #ScoreReport_list  
	            SELECT  M.UserID ,
                        info.Accounts ,
                        M.belongsAgent ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        M.totalUpScore ,
                        M.totalDownScore ,
                        GS.Score + GS.InsureScore ,
                        @NowTime
                FROM    dbo.BS_Members AS M
                        INNER JOIN QPAccountsDB.dbo.AccountsInfo AS Info ( NOLOCK ) ON info.UserID = M.UserID
                        INNER JOIN QPTreasureDB.dbo.GameScoreInfo (NOLOCK) AS GS ON M.UserID = GS.UserID
                WHERE M.belongsAgent IN (SELECT ProxyId FROM #SubProxyList)


      CREATE TABLE #ScoreChangeRecordTargetIDS(TargetID INT);
      
                         INSERT #ScoreChangeRecordTargetIDS
                              SELECT SCR.Target
                                     FROM dbo.BS_ScoreChangeRecord (NOLOCK) AS SCR
                                     WHERE SCR.CreateTime BETWEEN @CalculateDateStart AND @CalculateDateEnd 


--获取当前推广员下的今天有操作的所有用户
        INSERT  INTO @Temp_ScoreReport
                ( UserId ,
                  Accounts ,
                  BelongAgent ,
                  UpScore ,
                  DownScore ,
                  WinScore ,
                  TempTax ,
                  TotalUpScore ,
                  TotalDownScore ,
                  BlanceScore ,
                  CreateTime
			    )
			    
			    
			    SELECT * FROM #ScoreReport_list AS KK
               
                WHERE  ( EXISTS ( SELECT   1
                                       FROM     #ScoreChangeRecordTargetIDS AS SCRTIDS
                                       WHERE    SCRTIDS.TargetID = KK.UserID)
                       OR EXISTS ( SELECT   1
                                       FROM     #RecordDrawScoreUserids AS RDS
                                       WHERE    RDS.UserID = KK.UserID
                                       )
                            )
        DROP TABLE #ScoreChangeRecordTargetIDS     
        DROP TABLE #ScoreReport_list
        DROP TABLE #RecordDrawScoreUserids

--用户上下分汇总
        DECLARE @TotalScoreChangeRecord TABLE
            (
              UserId INT ,
              UpScore BIGINT ,
              DownScore BIGINT
            )
        INSERT  INTO @TotalScoreChangeRecord
                ( UserId ,
                  UpScore ,
                  DownScore
                )
                SELECT  Target ,
                        ISNULL(SUM(CASE Operate
                                     WHEN 0 THEN ChangeScore
                                     WHEN 1 THEN ChangeScore
                                     ELSE 0
                                   END), 0) UpScore ,
                        ISNULL(SUM(CASE Operate
                                     WHEN 6 THEN ChangeScore
                                     ELSE 0
                                   END), 0) DownScore
                FROM    dbo.BS_ScoreChangeRecord (NOLOCK) AS SC
                WHERE   CreateTime BETWEEN @CalculateDateStart
                                   AND     @CalculateDateEnd
                GROUP BY Target

--用户输赢汇总
        DECLARE @TotalDrawScore TABLE
            (
              UserId INT ,
              WinScore BIGINT ,
              TempTax BIGINT ,
              Accounts VARCHAR(50)
            )
        INSERT  INTO @TotalDrawScore
                ( UserId ,
                  WinScore ,
                  TempTax
                )
                SELECT  RDS.UserId ,
                        ISNULL(SUM(RDS.Score), 0) ,
                        ISNULL(SUM(RDS.Choushui), 0)
                FROM    QPTreasureDB.dbo.RecordDrawScore (NOLOCK) AS RDS
                WHERE   InsertTime BETWEEN @CalculateDateStart
                                   AND     @CalculateDateEnd
                        AND EXISTS ( SELECT 1
                                     FROM   @Temp_ScoreReport AS M
                                     WHERE  M.UserID = RDS.UserID )
                GROUP BY RDS.UserId

        UPDATE  r
        SET     r.WinScore = DrawScore.WinScore ,
                r.TempTax = DrawScore.TempTax
        FROM    @Temp_ScoreReport AS r ,
                @TotalDrawScore AS DrawScore
        WHERE   r.UserId = DrawScore.UserId
        UPDATE  r
        SET     r.UpScore = ChangeRecord.UpScore ,
                r.DownScore = ChangeRecord.DownScore
        FROM    @Temp_ScoreReport AS r ,
                @TotalScoreChangeRecord AS ChangeRecord
        WHERE   r.UserId = ChangeRecord.UserId

        IF ( @GetType = 0 )
            BEGIN	 
                SELECT  UserId ,
                        Accounts ,
                        BelongAgent ,
                        UpScore ,
                        DownScore ,
                        WinScore ,
                        TempTax ,
                        TotalUpScore ,
                        TotalDownScore ,
                        BlanceScore ,
                        CreateTime
                FROM    @Temp_ScoreReport
            END
        ELSE
            BEGIN
--记录所有推广员
                DECLARE @Temp_ProxyScoreReport TABLE
                    (
                      RowId INT IDENTITY(1, 1) ,
                      UserId INT ,
                      Accounts VARCHAR(50) ,
                      BelongAgent INT ,
                      MemberWinScore BIGINT ,
                      MemberLostScore BIGINT ,
                      NextProxyWinScore BIGINT ,
                      NextProxyLostScore BIGINT ,
                      UpScore BIGINT ,
                      DownScore BIGINT ,
                      TotalUpScore BIGINT ,
                      TotalDownScore BIGINT ,
                      MemberTempTax BIGINT ,
                      NextProxyTempTax BIGINT ,
                      BlanceScore BIGINT ,
                      ProfitProportion INT ,
                      assignProportion INT ,
                      ProxyLevel TINYINT ,
                      CreateTime DATETIME
                    )

                INSERT  INTO @Temp_ProxyScoreReport
                        ( UserId ,
                          Accounts ,
                          BelongAgent ,
                          MemberWinScore ,
                          MemberLostScore ,
                          NextProxyWinScore ,
                          NextProxyLostScore ,
                          UpScore ,
                          DownScore ,
                          TotalUpScore ,
                          TotalDownScore ,
                          MemberTempTax ,
                          NextProxyTempTax ,
                          BlanceScore ,
                          ProfitProportion ,
                          assignProportion ,
                          ProxyLevel ,
                          CreateTime
	                    )
                        SELECT  a.UserID ,
                                a.Accounts ,
                                p.belongsAgent ,
                                0 ,
                                0 ,
                                0 ,
                                0 ,
                                0 ,
                                0 ,
                                p.totalUpScore ,
                                p.totalDownScore ,
                                0 ,
                                0 ,
                                p.Score ,
                                p.ProfitProportion ,
                                p.assignProportion ,
                                p.ProxyLevel ,
                                @NowTime
                        FROM    QPAccountsDB.dbo.AccountsInfo AS a
                                INNER JOIN dbo.BS_ProxyInfo AS p ( NOLOCK ) ON p.ProxyID = a.UserID
                                INNER JOIN #SubProxyList AS SubP ON SubP.ProxyId = a.UserID
                        WHERE   a.IsAndroid = 2

                UPDATE  r
                SET     r.UpScore = ChangeRecord.UpScore ,
                        r.DownScore = ChangeRecord.DownScore
                FROM    @Temp_ProxyScoreReport AS r ,
                        @TotalScoreChangeRecord AS ChangeRecord
                WHERE   r.UserId = ChangeRecord.UserId

                DECLARE @maxLevel1 INT ,
                    @minLevel INT ,
                    @maxLevel INT 
                SELECT  @minLevel = MIN(ProxyLevel) ,
                        @maxLevel1 = MAX(ProxyLevel) ,
                        @maxLevel = MAX(ProxyLevel)
                FROM    @Temp_ProxyScoreReport
                WHILE ( @minLevel <= @maxLevel )
                    BEGIN
                        IF ( @maxLevel1 = @maxLevel )
                            BEGIN
                                UPDATE  ProxyR
                                SET     ProxyR.MemberWinScore = ISNULL(( SELECT
                                                              SUM(ISNULL(MemberR.WinScore,
                                                              0))
                                                              FROM
                                                              @Temp_ScoreReport
                                                              AS MemberR
                                                              WHERE
                                                              ProxyR.UserId = MemberR.BelongAgent
                                                              AND MemberR.WinScore > 0
                                                              ), 0) ,
                                        ProxyR.MemberLostScore = ISNULL(( SELECT
                                                              SUM(ISNULL(MemberR.WinScore,
                                                              0))
                                                              FROM
                                                              @Temp_ScoreReport
                                                              AS MemberR
                                                              WHERE
                                                              ProxyR.UserId = MemberR.BelongAgent
                                                              AND MemberR.WinScore < 0
                                                              ), 0) ,
                                        ProxyR.NextProxyWinScore = 0 ,
                                        ProxyR.NextProxyLostScore = 0 ,
                                        MemberTempTax = ISNULL(( SELECT
                                                              SUM(ISNULL(MemberR.TempTax,
                                                              0))
                                                              FROM
                                                              @Temp_ScoreReport
                                                              AS MemberR
                                                              WHERE
                                                              ProxyR.UserId = MemberR.BelongAgent
                                                              AND MemberR.WinScore > 0
                                                              ), 0) ,
                                        NextProxyTempTax = 0
                                FROM    @Temp_ProxyScoreReport AS ProxyR
                                WHERE   ProxyR.ProxyLevel = @maxLevel
                            END
                        ELSE
                            BEGIN
                                UPDATE  ProxyR
                                SET     ProxyR.MemberWinScore = ISNULL(( SELECT
                                                              SUM(ISNULL(MemberR.WinScore,
                                                              0))
                                                              FROM
                                                              @Temp_ScoreReport
                                                              AS MemberR
                                                              WHERE
                                                              ProxyR.UserId = MemberR.BelongAgent
                                                              AND MemberR.WinScore > 0
                                                              ), 0) ,
                                        ProxyR.MemberLostScore = ISNULL(( SELECT
                                                              SUM(ISNULL(MemberR.WinScore,
                                                              0))
                                                              FROM
                                                              @Temp_ScoreReport
                                                              AS MemberR
                                                              WHERE
                                                              ProxyR.UserId = MemberR.BelongAgent
                                                              AND MemberR.WinScore < 0
                                                              ), 0) ,
                                        ProxyR.NextProxyWinScore = ISNULL(( SELECT
                                                              SUM(ISNULL(ProxyR1.MemberWinScore,
                                                              0)
                                                              + ISNULL(ProxyR1.NextProxyWinScore,
                                                              0))
                                                              FROM
                                                              @Temp_ProxyScoreReport
                                                              AS ProxyR1
                                                              WHERE
                                                              ProxyR.UserId = ProxyR1.BelongAgent
                                                              ), 0) ,
                                        ProxyR.NextProxyLostScore = ISNULL(( SELECT
                                                              SUM(ISNULL(ProxyR1.MemberLostScore,
                                                              0)
                                                              + ISNULL(ProxyR1.NextProxyLostScore,
                                                              0))
                                                              FROM
                                                              @Temp_ProxyScoreReport
                                                              AS ProxyR1
                                                              WHERE
                                                              ProxyR.UserId = ProxyR1.BelongAgent
                                                              ), 0) ,
                                        MemberTempTax = ISNULL(( SELECT
                                                              SUM(ISNULL(MemberR.TempTax,
                                                              0))
                                                              FROM
                                                              @Temp_ScoreReport
                                                              AS MemberR
                                                              WHERE
                                                              ProxyR.UserId = MemberR.BelongAgent
                                                              ), 0) ,
                                        NextProxyTempTax = ISNULL(( SELECT
                                                              SUM(ISNULL(ProxyR1.MemberTempTax,
                                                              0)
                                                              + ISNULL(ProxyR1.NextProxyTempTax,
                                                              0))
                                                              FROM
                                                              @Temp_ProxyScoreReport
                                                              AS ProxyR1
                                                              WHERE
                                                              ProxyR.UserId = ProxyR1.BelongAgent
                                                              ), 0)
                                FROM    @Temp_ProxyScoreReport AS ProxyR
                                WHERE   ProxyR.ProxyLevel = @maxLevel
                            END
                        SET @maxLevel -= 1
                    END

                SELECT  UserId ,
                        Accounts ,
                        BelongAgent ,
                        MemberWinScore ,
                        MemberLostScore ,
                        NextProxyWinScore ,
                        NextProxyLostScore ,
                        UpScore ,
                        DownScore ,
                        TotalUpScore ,
                        TotalDownScore ,
                        MemberTempTax ,
                        NextProxyTempTax ,
                        BlanceScore ,
                        ProfitProportion ,
                        assignProportion ,
                        ProxyLevel ,
                        CreateTime
                FROM    @Temp_ProxyScoreReport
            END

        DROP TABLE #SubProxyList
	
    END
GO
