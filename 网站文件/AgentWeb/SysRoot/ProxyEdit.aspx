<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyEdit.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyEdit" %>

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
                <li><a href="/SysRoot/ProxyManage.aspx">代理管理</a></li>
                <li><a href="#">代理编辑</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>基本信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>代理帐号：</label><input name="" type="text" class="dfinput" runat="server" id="txtUserName" readonly="readonly" /><i>
                    </i></li>
                <li>
                    <label>帐号密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword" /></li>
                <li>
                    <label>真实姓名：</label><input name="" type="text" class="dfinput" runat="server" id="txtRealName" /><i><asp:RequiredFieldValidator ID="rfvRealName" runat="server" ControlToValidate="txtRealName" ErrorMessage="真实姓名不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>电话号码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPhone" /><i><asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="电话号码不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></i></li>
                <li>
                    <label>QQ号码：  </label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQQ" /></li>
                <li>
                    <label>代理级别：</label><%= DimoNetwork.QPProxyWeb.SystemSetHelper.GetProxyLevelName(this.Proxy.ProxyLevel + 1)  %></li>
               <%-- <li>
                    <label>佣金占成：</label><input name="" type="text" value="0" class="dfinput" runat="server" id="txtAssignProportion" />%<i>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="分红比例必须为0-100！" ControlToValidate="txtAssignProportion" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\d{1,3}"></asp:RegularExpressionValidator>
                    </i></li>--%>
                 <li>
                    <label>占成：</label><input name="" type="text" value="0" class="dfinput" runat="server" id="txtProfitProportion" />%<i>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="分红比例必须为0-100" ControlToValidate="txtProfitProportion" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\d{1,3}"></asp:RegularExpressionValidator>
                    </i></li>
                <li style="display: <%= Proxy.authority ? "block":"none"%>">
                    <label>上下分权限：</label><asp:CheckBox ID="cbAuthority" runat="server" /></li>

                <li>
                    <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" />&nbsp;<input class="cancel" name="" type="button" onclick="window.history.go(-1);" value="返回" /></li>
            </ul>

        </div>
        <ul class="forminfo">
            <li>
                <table class="tablelist">
                    <tbody>
                        <tr>
                            <td>账户余额：<asp:Literal ID="ltScore" runat="server"></asp:Literal></td>

                            <td>会员数量：<asp:Literal ID="ltMemberCount" runat="server"></asp:Literal></td>
                            <td>有效会员：<asp:Literal ID="ltActiveMember" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td>所属代理：<asp:Literal ID="ltBelongsProxy" runat="server"></asp:Literal></td>
                            <td>注册时间：<asp:Literal ID="ltRegDate" runat="server"></asp:Literal></td>
                            <td>账号状态：<asp:Literal ID="ltUserStatus" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </li>
        </ul>
    </form>
</body>
</html>

