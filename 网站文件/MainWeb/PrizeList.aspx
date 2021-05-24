<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrizeList.aspx.cs" Inherits="Game.FrontWeb.PrizeList" %>

<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>


<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>奖品商城_九龍游戏</title>
    <meta name="keywords" content="九龍游戏,手机游戏,安卓手游,Android,苹果手游,ios,斗地主,捕鱼,街机" />
    <meta name="description" content="九龍游戏是一款手机游戏与PC游戏数据互通，棋牌平台第一品牌游戏。" />
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            CheckMobileAndReplaceUrl("RedirectPage.aspx?transferKey='DownloadQrTransferUrl'");

        };
    </script>
</head>

<body>
    <div class="fix-header pr">
        <div class="HeaderMold wrap tl clearfix">
            <p class="fl">
                <img src="/images/logo.png" width="140" height="44" alt="">
            </p>
            <ul class="navs fr">
                <li><a href="index.html" class="A01">官方首页</a></li>
                <li><a href="Download.html" class="A02">游戏下载</a></li>
                <li><a href="Recharge.html" class="A03">账号充值</a></li>
                <li class="cur"><a href="Prizelist.html" class="A04">奖品商城</a></li>
                <li><a href="Service.html" class="A05">客服中心</a></li>
                <li><a href="User.html" class="A06">个人中心</a></li>
            </ul>
        </div>
        <div class="HeaderNotice none">
            <div class="notice icon">
                <marquee direction="left" height="30px" scrollamount="3" scrolldelay="100" onmouseover="this.stop()" onmouseout="this.start()">这里是跑马灯公告栏，可放：临时性，加急性，特殊性等公告！<a href="News.html">【详情点击】</a>
    	</marquee>
            </div>
        </div>
    </div>
    <div id="wrapper">

        <div class="Poster01 wrap"></div>
        <div class="wrap clearfix tl">
            <!-- leftMold-->
            <div class="leftMold fl">
                <a id="linksA" href="ExecDownload.aspx?downloadKey=PCDownloadUrl">
                    <div class="download">
                        <img src="images/download.jpg" alt="">
                    </div>
                </a>
                <div class="comRegister">
                    <ul class="clearfix">
                        <li><a href="Registered.aspx" class="A01">快速注册</a></li>
                        <li><a href="Recharge.aspx" class="A02">账号充值</a></li>
                        <li><a href="#" onclick="javascript:alert('即将开放，敬请期待…');" class="A03">奖品商城</a></li>
                        <li><a href="/User/UserIndex.aspx" class="A04">个人中心</a></li>
                    </ul>
                </div>
                <div class="comActivity p10">
                    <a href="News.aspx">
                        <img src="/images/adv01.jpg" alt=""></a>
                </div>
                <div class="comService comMold">
                    <dl>
                        <dt class="clearfix">
                            <p class="fl">
                                <img src="/images/ico-Service.png" alt="">
                            </p>
                        </dt>
                        <dd class="plr20 ptb10 lh200">例行维护：每周二3:00-9:30<br />
                            客服ＱＱ：<span runat="server" id="ServiceQQ">123456789</span></dd>
                        <dd class="dd01 plr20 ptb10 tc">
                            <p class="p01 tc">
                                <img id="weixinQrImg" runat="server" src="/images/weixin.gif" style="padding: 10px;" alt="">
                            </p>
                            <p>
                                <img src="images/weixin01.gif" alt="">
                            </p>
                        </dd>
                        <dd>
                            <img src="/images/ico-Service01.png" alt=""></dd>
                    </dl>
                </div>
            </div>
            <!-- leftMold /-->

            <!-- rightMold-->
            <div class="rightMold fr">

                <div class="d2">
                    <div class="comPrizeList comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-Prize.png" alt="">
                                </p>
                            </dt>
                            <div class="body p20">
                                <div class="w">
                                    <div class="user_demoBox js_user_demoBox">
                                        <ul class="tab_menu clearfix">
                                            <li class="cur"><a href="Prizelist.html">全部奖品</a></li>
                                            <li class=""><a href="Prizelist.html">电器数码</a></li>
                                            <li class=""><a href="Prizelist.html">生活家居</a></li>
                                            <li class=""><a href="Prizelist.html">虚拟点卡</a></li>
                                            <li class=""><a href="Prizelist.html">话费专区</a></li>
                                        </ul>
                                        <div class="tab_box w">
                                            <div class="sort">
                                                排序：<span>新品</span><span>热门</span><span class="">价格</span><i class=""><input type="checkbox" id="isCanExchange"><label for="isCanExchange" class="cp">我可以兑换奖品</label></i>
                                            </div>
                                            <div class="list">
                                                <ul class="clearfix">
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/421.jpg" alt="">
                                                        </p>
                                                        <p class="title">腾讯QQ币20个</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/434.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果iPhone 5S（金色版）</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/521.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/523.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/421.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/521.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/421.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/421.jpg" alt="">
                                                        </p>
                                                        <p class="title">腾讯QQ币20个</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/434.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果iPhone 5S（金色版）</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/521.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/523.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                    <li><a href="Prize.html">
                                                        <p class="img">
                                                            <img src="/images/Product/421.jpg" alt="">
                                                        </p>
                                                        <p class="title">苹果</p>
                                                        <p class="Price">价格：<i>1521.00</i>点券</p>
                                                    </a></li>
                                                </ul>
                                            </div>
                                            <div class="mold-page mt20">
                                                <ul class="clearfix">
                                                    <li><a href="Prizelist.html">首页</a></li>
                                                    <li><a href="Prizelist.html">上一页</a></li>
                                                    <li><a href="Prizelist.html">01</a></li>
                                                    <li><span>02</span></li>
                                                    <li><a href="Prizelist.html">03</a></li>
                                                    <li><a href="Prizelist.html">下一页</a></li>
                                                    <li><a href="Prizelist.html">尾页</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </dl>
                    </div>
                </div>
            </div>
            <!-- rightMold /-->

        </div>

    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />
</body>
</html>

