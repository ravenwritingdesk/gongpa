<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyAdd.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyAdd" %>

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
                <li><a href="/SysRoot/Members.aspx">代理管理</a></li>
                <li><a href="/SysRoot/ProxyAdd.aspx">添加代理</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>基本信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>代理帐号：</label><input name="" type="text" class="dfinput" runat="server" id="txtUserName" /><i>
                        <asp:RegularExpressionValidator ID="revUserName" runat="server" ErrorMessage="账户名称范围为6-20个字符" ControlToValidate="txtUserName" Display="Dynamic" ValidationExpression="\w{6,20}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="账户名不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>帐号密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword" /><i><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="密码不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>真实姓名：</label><input name="" type="text" class="dfinput" runat="server" id="txtRealName" /><i></i></li>
                <li>
                    <label>电话号码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPhone" /><i></i></li>
                <li>
                    <label>QQ号码：  </label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQQ" /></li>
                <li>
                    <label>代理级别：</label><%= DimoNetwork.QPProxyWeb.SystemSetHelper.GetProxyLevelName(this.Proxy.ProxyLevel + 1)  %></li>
              <%--  <li>
                    <label>佣金占成：</label><input name="" type="text" value="0" class="dfinput" runat="server" id="txtAssignProportion" />%<i>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="佣金占成必须为0-100之间的整数" ControlToValidate="txtAssignProportion" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\d{1,3}"></asp:RegularExpressionValidator>
                    </i></li>--%>
                <li>
                    <label>占成：</label><input name="" type="text" value="0" class="dfinput" runat="server" id="txtProfitProportion" />%<i>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="分红比例必须为0-100之间的整数" ControlToValidate="txtProfitProportion" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\d{1,3}"></asp:RegularExpressionValidator>
                    </i></li>
                <li style="display: <%= Proxy.authority ? "block":"none"%>">
                    <label>上下分权限：</label><asp:CheckBox ID="cbAuthority" runat="server" /></li>
                <li>
                    <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" />&nbsp;<input class="cancel" name="" type="button" onclick="window.history.go(-1);" value="返回" /></li>
            </ul>
        </div>
    </form>
</body>
</html>
