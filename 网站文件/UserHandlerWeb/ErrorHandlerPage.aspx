<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorHandlerPage.aspx.cs" Inherits="UserHandlerWeb.ErrorHandlerPage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>错误提示</title>
    <link href="/style/base.css" rel="stylesheet" />
    <link href="/style/public-blue.css" rel="stylesheet" />
    <%--<link href="/style/public-golden.css" rel="stylesheet" />--%>
    <link href="/plugin/sweetalert/sweetalert.css" rel="stylesheet" />
</head>
<body>
    <section class="Recharge">
        <div data-name="recharge">
            <div class="p10">
                <div class="mt10" style="margin-top: 20%; margin-left: 30%; font-size: 40px;font-weight:bold;">
                    <span class="red pl10">连接超时，请重新登入游戏！</span>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
