<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyOperatorAdd.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyOperatorAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/Members.aspx">客服管理</a></li>
                <li>客服</li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>基本信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>客服帐号：</label><input name="" type="text" class="dfinput" runat="server" id="txtUserName" /><i>
                        <asp:RegularExpressionValidator ID="revUserName" runat="server" ErrorMessage="账户名称范围为4-20个字符" ControlToValidate="txtUserName" Display="Dynamic" ValidationExpression="\w{4,20}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="账户名不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>登入密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword" /><i><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="登入密码不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>交易密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtOperatePassword" /><i><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOperatePassword" ErrorMessage="交易密码不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>限额：</label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQuotaScore"  value="0" /></li>
                <li>
                    <label>微信号码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPhone" /></li>
                <li>
                    <label>QQ号码：  </label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQQ" /></li>
                <li>
                    <label>是否启用：</label><asp:CheckBox ID="cbIsEnabled" runat="server" /></li>
                <li>
                    <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" />&nbsp;<input class="cancel" name="" type="button" onclick="window.history.go(-1);" value="返回" /></li>
            </ul>
        </div>
    </form>
</body>
</html>
