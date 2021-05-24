<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.OpRoot.Top" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //顶部导航切换
            $(".nav li a").click(function () {
                $(".nav li a.selected").removeClass("selected");
                $(this).addClass("selected");
            });
        })
    </script>
</head>
<body style="background: url(/images/topbg.gif) repeat-x;">
    <div class="topleft">
        <a href="main.aspx" target="_parent">
            <img src="/images/logo.png" title="系统首页" /></a>
    </div>
    <ul class="nav">
        <li><a href="/OpRoot/Members.aspx" target="bottomFrame" class="selected">
            <img src="/images/会员管理.png" title="会员管理" /><h2>会员管理</h2>
        </a></li>
        <li><a href="/OpRoot/GameRecord.aspx" target="bottomFrame">
            <img src="/images/会员游戏记录.png" title="会员游戏记录" /><h2>游戏记录</h2>
        </a></li>
        <li><a href="/OpRoot/OperateRecord.aspx" target="bottomFrame">
            <img src="/images/系统日志.png" title="系统日志" /><h2>系统日志</h2>
        </a></li>
        <%= (Proxy.ProxyLevel == 1 || Proxy.authority) ?
            "<li><a href=\"/OpRoot/PayOrderManage.aspx\" target=\"bottomFrame\"><img src=\"/images/上分下分.png\" title=\"上分下分\" /><h2>上分下分</h2></a></li>"
            :""
        %>
    </ul>
    <div class="topright">
        <ul>
            <li><a href="/OpLoginOut.aspx" target="_parent">退出</a></li>
        </ul>
        <div class="user" onclick="ShowScore()">
            <span><%= Proxy.Account %> 剩余限额：￥<b><a href="#" id="proxyscore">?</a></b></span>
        </div>
    </div>
    <script type="text/javascript">
        function ShowScore() {
            if ($("#proxyscore").text() != "?") {
                $("#proxyscore").text("?");
                $("#proxyscore").parent("b").removeClass("width");
                return;
            }
            $.ajax({
                url: "/ProxyHandler/ProxyOp.ashx",
                data:
                {
                    "action": "showscore"
                },
                contentType: "json",
                success: function (data) {
                    var result = eval("(" + data + ")");
                    $("#proxyscore").text(result.QuotaScore);
                    $("#proxyscore").parent("b").css("width", "80px").css("background-color", "#");
                }
            });
        }
    </script>
</body>
</html>

