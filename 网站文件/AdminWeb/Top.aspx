<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="Game.Web.Top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="styles/common.css" rel="stylesheet" type="text/css"  />
    <link href="styles/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"  />
    <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="/scripts/common.js"></script>
</head>
<body>
    <div class="header">
        <div class="heade">
            <h1 class="logo">Surfbird 游戏管理平台</h1>
            <div class="shortcut_menu">
                欢迎您!
                <span id="name">
                    <a href="javascript:Redirect('Module/BackManager/BaseUserUpdate.aspx?id=<%=userExt.UserID %>')" class="white12"><span class="cheng"><%=userExt.Username %></span></a>【<%=roleName%>】
                    </span>
                <a onclick="LoginOutClick()" id="btnLoginOut" href="#">【退出】</a>
                <a href="javascript:redirectUrl('Index.aspx')">后台首页</a>
        </div>
    </div>
    </div>
</body>
</html>
<script type="text/javascript">
    function LoginOutClick() {
        if (confirm('确定要退出吗？')) {
            redirectUrl('LoginOut.aspx');
        }
    }

    function redirectUrl(url)
    {
        window.opener=null;
        window.top.location = url;
    }
</script>
