<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return_un_url.aspx.cs" Inherits="UserHandlerWeb.return_un_url" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="bodyBox" style="padding-left: 100px; line-height: 40px;">
        <h2 id="titleH2" runat="server">&nbsp;&nbsp; 充值结果</h2>
        <p runat="server" id="resultSuccess" style="color: green; display: none;">&nbsp;&nbsp;&nbsp; 恭喜您,充值成功</p>
        <p runat="server" id="resultError" style="color: red; display: none;">抱歉,充值失败</p>

    </div>
</body>
</html>
