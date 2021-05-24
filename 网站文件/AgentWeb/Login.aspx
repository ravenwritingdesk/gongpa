<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎登录游戏管理系统</title>
    <link type="text/css" href="/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/cloud.js"></script>

    <script type="text/javascript">
        $(function () {
            $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
            $(window).resize(function () {
                $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
            });
        });

        function versionSpanClick(e) {
            if ($("#versionSpan").attr("style") == "display: none;") {
                $("#versionSpan").attr("style", "display:inline;");
            } else {
                $("#versionSpan").attr("style", "display: none;");
            }
        }
    </script>
</head>
<body style="background-color: #1c77ac; background-image: url(/images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
    <form id="form1" runat="server">
        <div id="mainBody">
            <div id="cloud1" class="cloud">
            </div>
            <div id="cloud2" class="cloud">
            </div>
        </div>
        <div class="logintop">
            <span>欢迎登录后台管理平台</span>
        </div>
        <div class="loginbody">
            <span class="systemlogo"></span>
            <div class="loginbox">
                <ul>
                    <li>
                        <input id="txtUserName" class="loginuser" name="" onclick="JavaScript: this.value = ''" type="text" value="账号" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <input id="txtUserPassword" class="loginpwd" name="" onclick="JavaScript: this.value = ''" type="password" value="密码" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPassword" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:Button ID="btnLogin" runat="server" Text="登录" class="loginbtn" OnClick="btnLogin_Click" /></li>
                </ul>
            </div>
        </div>

        <div class="loginbm" onclick="versionSpanClick()">仅供学习交流，勿用于任何商业用途&nbsp&nbsp&nbsp&nbsp&nbsp<span style="display: none;" id="versionSpan" runat="server"></span></div>
    </form>
</body>
</html>
