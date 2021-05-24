<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统提示_代理管理系统</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/select.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="/SysRoot/index.aspx">首页</a></li>
            <li>系统提示</li>
        </ul>
</div>
<div style="text-align:center; font-size:14px; margin-top:50px;">
<div class="errorTip">
<p class="Tips"><span class="sp01">!</span>对不起！页面加载失败了！</p>
<%--ul class="text">
<li>提示语句一</li>
<li>提示语句二</li>
</ul>--%>
<div class="button">
<a href="#" runat="server" id="backBtn" class="but01">返回首页</a>
</div>
</div>
</div>
</body>

</html>
