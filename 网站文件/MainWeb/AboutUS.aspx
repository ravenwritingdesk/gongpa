<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUS.aspx.cs" Inherits="Game.FrontWeb.AboutUS" %>

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
                    <div class="comPrizeList comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-AboutUS.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                            </dt>
                            <div class="body p20">
                                <div class="archiveBody ww" id="ContentDiv" runat="server">
                                </div>
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