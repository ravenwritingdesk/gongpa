<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.Top" %>

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
        });
        function ShowScore() {
            if ($("#proxyscore").text() != "?") {
                $("#proxyscore").text("?");
                $("#proxyscore").parent("b").removeClass("width");
                return;
            } else {
                $.ajax({
                    url: "/ProxyHandler/Proxy.ashx",
                    cache: false,
                    data:
                    {
                        "action": "showscore"
                    },
                    contentType: "json",
                    success: function (data) {
                        var result = eval("(" + data + ")");
                        if (result.score == "-1") {
                            window.top.location = "/Login.aspx";
                        }
                        $("#proxyscore").text(result.score);
                        $("#proxyscore").parent("b").css("width", "80px").css("background-color", "#");
                    }
                });
            }
        }
    </script>
</head>
<body style="background: url(/images/topbg.gif) repeat-x;">
    <div class="topleft">
        <a href="main.aspx" target="_parent">
            <img src="/images/logo.png" title="系统首页" /></a>
    </div>
    <ul class="nav">
        <li><a class="selected" href="/SysRoot/index.aspx" target="bottomFrame">
            <img src="/images/ico01.png" title="工作台" /><h2>工作台</h2>
        </a></li>
        <li><a href="/SysRoot/Members.aspx" target="bottomFrame">
            <img src="/images/会员管理.png" title="会员管理" /><h2>会员管理</h2>
        </a></li>
        <li><a href="/SysRoot/GameRecord.aspx" target="bottomFrame">
            <img src="/images/会员游戏记录.png" title="会员游戏记录" /><h2>游戏记录</h2>
        </a></li>
        <li><a href="/SysRoot/ProxyManage.aspx" target="bottomFrame">
            <img src="/images/代理管理.png" title="代理管理" /><h2>代理管理</h2>
        </a></li>
        <li><a href="/SysRoot/ProxyProfit.aspx?StartTime=<%=DateTime.Now.Date.ToString("yyyy-MM-dd HH:mm:ss") %>&EndTime=<%=DateTime.Now.Date.ToString("yyyy-MM-dd 23:59:59") %>&HandleType=-1" target="bottomFrame">
            <img src="/images/代理利润.png" title="代理利润" /><h2>代理报表</h2>
        </a></li>
        <li><a href="/SysRoot/OperateRecord.aspx" target="bottomFrame">
            <img src="/images/系统日志.png" title="系统日志" /><h2>系统日志</h2>
        </a></li>
        <li><a href="/SysRoot/ProxyOperatorManage.aspx" target="bottomFrame">
            <img src="/images/会员管理.png" title="客服管理" /><h2>客服管理</h2>
        </a></li>
        <%= (Proxy.ProxyLevel == 1 || Proxy.authority) ?
            "<li><a href=\"/SysRoot/PayOrderManage.aspx\" target=\"bottomFrame\">"+
            "<img src=\"/images/上分下分.png\" title=\"上分下分\" /><h2>上分下分</h2></a></li>":""
        %>
        <%= (Proxy.ProxyLevel == 1) ?
            "<li><a href=\"/SysRoot/SystemSet.aspx\" target=\"bottomFrame\">"+
            "<img src=\"/images/计划配置.png\" title=\"计划配置\" /><h2>计划配置</h2></a></li>":""
        %>
    </ul>
    <div class="topright">
        <ul>
            <li><a href="/SysRoot/ModifyPassword.aspx" target="bottomFrame">修改密码</a></li>
            <li><a href="/LoginOut.aspx" target="_parent">退出</a></li>
        </ul>
        <div class="user" onclick="ShowScore()">
            <span><%= Proxy.account %> 余额：￥<b><a href="#"  id="proxyscore">?</a></b></span>
        </div>
    </div>
</body>
</html>
