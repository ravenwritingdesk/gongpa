<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IntroductionList.aspx.cs" Inherits="Game.FrontWeb.Games.IntroductionList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>
<%@ Register Src="~/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>


<!DOCTYPE HTML>
<html>

<uc1:SiteHead runat="server" ID="SiteHead" />

<body>
    <uc1:SiteMenu runat="server" ID="SiteMenu" />

    <div id="wrapper">

        <div class="Poster01 wrap"></div>
        <div class="wrap clearfix tl">
            <uc1:SiteLeft runat="server" ID="SiteLeft" />

            <div class="rightMold fr">

                <div class="d2">
                    <div class="comDownload comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-Games.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                            </dt>
                            <div class="body p20" style="height: 644px;" id="bodyDiv" runat="server">
                                <%--<div class="comType">
                                    <p class="title">街机游戏类</p>
                                    <ul class="clearfix mt10">
                                        <li><a href="Games.html">海洋之星</a></li>
                                        <li><a href="Games.html">大圣闹海</a></li>
                                        <li><a href="Games.html">东方神龙</a></li>
                                        <li><a href="Games.html">李逵劈鱼</a></li>
                                        <li><a href="Games.html">金蟾捕鱼</a></li>
                                        <li><a href="Games.html">摇钱树</a></li>
                                        <li><a href="Games.html">水浒传</a></li>
                                        <li><a href="Games.html">幸运六狮</a></li>
                                        <li><a href="Games.html">金鲨银鲨</a></li>
                                        <li><a href="Games.html">五星宏辉</a></li>
                                    </ul>
                                </div>
                                <div class="comType mt20">
                                    <p class="title">棋牌游戏类</p>
                                    <ul class="clearfix mt10">
                                        <li><a href="Games.html">斗地主</a></li>
                                        <li><a href="Games.html">诈金花</a></li>
                                        <li><a href="Games.html">牛牛</a></li>
                                        <li><a href="Games.html">梭哈</a></li>
                                        <li><a href="Games.html">德州扑克</a></li>
                                        <li><a href="Games.html">扯炫</a></li>
                                    </ul>
                                </div>
                                <div class="comType mt20">
                                    <p class="title">百人游戏类</p>
                                    <ul class="clearfix mt10">
                                        <li><a href="#">龙虎斗</a></li>
                                        <li><a href="#">超级六</a></li>
                                        <li><a href="#">百人跑马</a></li>
                                        <li><a href="#">百人牛牛</a></li>
                                    </ul>
                                </div>--%>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />
</body>
</html>

