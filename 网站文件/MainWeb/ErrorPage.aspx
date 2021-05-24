<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="Game.FrontWeb.ErrorPage" %>

<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>

<!DOCTYPE HTML>
<html>
<uc1:SiteHead runat="server" ID="SiteHead" />
<body>
    <uc1:SiteMenu runat="server" ID="SiteMenu" />

    <div style="text-align: center; font-size: 12px; margin-top: 50px;">
        <div class="errorTip">
            <p class="Tips"><span class="sp01">!</span>对不起！页面加载失败了！</p>
            <div class="button">
                <a href="Index.aspx" class="but01">返回首页</a>
            </div>
        </div>
    </div>
</body>
</html>
