<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewList.aspx.cs" Inherits="Game.FrontWeb.NewList" %>

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
            <!-- leftMold-->
            <uc1:SiteLeft runat="server" ID="SiteLeft" />
            <!-- leftMold /-->

            <!-- rightMold-->
            <div class="rightMold fr">
                <form runat="server">
                    <div class="d2">
                        <div class="comPrizeList comMold">
                            <dl>
                                <dt class="clearfix">
                                    <p class="fl">
                                        <img src="/images/ico-Newslist.png" alt="">
                                    </p>
                                    <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                                </dt>
                                <div class="body p20" style="height: 644px;">
                                    <ul class="comNews01" runat="server" id="rptNews">
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                        <li><a href="News.aspx"><span class="news fl"><span class="red">【公告】</span>2015年7月9日藏宝阁维护公告</span><span class="time fr">09-28</span></a></li>
                                    </ul>
                                    <div class="mold-page mt20">
                                        <webdiyer:AspNetPager ID="anpPage" runat="server" AlwaysShow="true" FirstPageText="首页"
                                            LastPageText="末页" PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0"
                                            LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="共 %PageCount% 页"
                                            UrlPaging="false" OnPageChanging="anpPage_PageChanging" ShowCustomInfoSection="Never">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                            </dl>
                        </div>
                    </div>
                </form>
            </div>
            <!-- rightMold /-->
        </div>
    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />
</body>
</html>
