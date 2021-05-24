<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyPassword.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ModifyPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li>修改密码</li>
            </ul>
        </div>
        <div class="formbody">
            <div id="usual1" class="usual">

                <div class="itab">
                    <ul>
                        <li><a href="#tab1" onclick="location.href='/SysRoot/ModifyPassword.aspx#tab1'">修改登录密码</a></li>
                        <li><a href="#tab2" onclick="location.href='/SysRoot/ModifyPassword.aspx#tab2'">修改交易密码</a></li>
                    </ul>
                </div>

                <div id="tab1" class="tabson">

                    <ul class="forminfo">
                        <li>
                            <label>原始密码：</label><input name="" type="password" class="dfinput" runat="server" id="txtOldPassword" /><i><asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="*" Display="Dynamic" ValidationGroup="Password"></asp:RequiredFieldValidator></i></li>
                        <li>
                            <label>新密码：</label><input name="" type="password" class="dfinput" runat="server" id="txtPassword" /><i><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="密码不能为空！" Display="Dynamic" ValidationGroup="Password"></asp:RequiredFieldValidator></i></li>
                        <li>
                            <label>确认新密码：</label><input name="" type="password" class="dfinput" runat="server" id="txtConfirmPassword" />
                            <asp:CompareValidator ID="cvNewPassword" runat="server" ControlToCompare="txtPassword" Display="Dynamic" ErrorMessage="两次输入的登入密码不一致！" ControlToValidate="txtConfirmPassword" ValidationGroup="Password"></asp:CompareValidator>
                        </li>
                        <li>
                            <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" ValidationGroup="Password" /></li>
                    </ul>
                </div>
                <div id="tab2" class="tabson">

                    <ul class="forminfo">
                        <li>
                            <label>原始密码：</label><input name="" type="password" class="dfinput" runat="server" id="txtBOldPassword" /><i><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBOldPassword" ErrorMessage="*" Display="Dynamic" ValidationGroup="BankPassword"></asp:RequiredFieldValidator></i></li>
                        <li>
                            <label>新密码：</label><input name="" type="password" class="dfinput" runat="server" id="txtBPassword" /><i><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBPassword" ErrorMessage="密码不能为空！" Display="Dynamic" ValidationGroup="BankPassword"></asp:RequiredFieldValidator></i></li>
                        <li>
                            <label>确认新密码：</label><input name="" type="password" class="dfinput" runat="server" id="txtBConfirmPassword" />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtBPassword" Display="Dynamic" ErrorMessage="两次输入的交易密码不一致！" ControlToValidate="txtBConfirmPassword"></asp:CompareValidator>
                        </li>
                        <li>
                            <label>&nbsp;</label><asp:Button ID="btnBSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnBSubmit_Click" ValidationGroup="BankPassword" /></li>
                    </ul>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $("#usual1 ul").idTabs("tab1");
        </script>
    </form>
</body>
</html>
