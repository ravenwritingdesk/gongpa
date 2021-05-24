<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Game.FrontWeb.News" %>

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
                            <div class="body p20">
                                <h2 class="archiveTitle tc" id="NewsTitle" runat="server">这里是标题</h2>
                                <div class="textInfo tc lh30" id="NewsDate" runat="server">2014-11-15</div>
                                <div class="archiveBody ww" id="NewsBody" runat="server">
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
                                    <span style="font-size: 14px;">网页制作中规范使用DIV+CSS命名规则，可以改善优化功效特别是团队合作时候可以提供合作制作效率，具体DIV CSS命名规则CSS命名大全内容篇。</span>
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
