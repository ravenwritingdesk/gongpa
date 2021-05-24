<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberAdd.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.OpRoot.MemberAdd" %>

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
                <li><a href="/OpRoot/Members.aspx">会员管理</a></li>
                <li><a href="/OpRoot/MemberAdd.aspx">添加会员</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>基本信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>帐号名称：</label><input name="" type="text" class="dfinput" runat="server" id="txtUserName" /><i>
                        <asp:RegularExpressionValidator ID="revUserName" runat="server" ErrorMessage="账户名称范围为6-20个字符" ControlToValidate="txtUserName" Display="Dynamic" ValidationExpression="\w{6,20}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="账户名不能为空！"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>帐号密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword" /><i><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>真实姓名：</label><input name="" type="text" class="dfinput" runat="server" id="txtRealName" /><i><span></span></i></li>
                <li>
                    <label>电话号码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPhone" /><i><span></span></i></li>
                <li>
                    <label>QQ号码：  </label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQQ" /><i>多个QQ用,隔开</i></li>
                <li>
                    <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" />&nbsp;<input class="cancel" name="" type="button" onclick="window.history.go(-1);" value="返回" /></li>
            </ul>
        </div>
    </form>
</body>
</html>


