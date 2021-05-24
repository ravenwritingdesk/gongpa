<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return_ali_url.aspx.cs" Inherits="Game.FrontWeb.return_ali_url" %>

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
        <div class="payTitle">
            <ul>
                <li><span>充值帐号：</span><asp:Label ID="lblAccounts" runat="server"></asp:Label></li>
                <li><span>帐 号 ID：</span><asp:Label ID="lblUserID" runat="server"></asp:Label></li>
                <li><span>充值金额：</span><asp:Label ID="lblOrderAmount" runat="server"></asp:Label></li>
                <li><span>赠送金币：</span><asp:Label ID="lblPresentScore" runat="server"></asp:Label></li>
                <li><span>订 单 号：</span><asp:Label ID="lblOrderID" runat="server"></asp:Label></li>
            </ul>
        </div>
    </div>
</body>
</html>
