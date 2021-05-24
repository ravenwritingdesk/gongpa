<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.MemberEdit" %>

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
                <li><a href="/SysRoot/Members.aspx">会员管理</a></li>
                <li><a href="/SysRoot/MemberAdd.aspx">修改会员</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>基本信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>帐号名称：</label><input name="" type="text" class="dfinput" runat="server" id="txtUserName" readonly="readonly" /></li>
                <li>
                    <label>登录密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword" /></li>
                <li>
                    <label>银行密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtBankPassword" /></li>
                <li>
                    <label>真实姓名：</label><input name="" type="text" class="dfinput" runat="server" id="txtRealName" /><i></i></li>
                <li>
                    <label>电话号码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPhone" /><i></i></li>
                <li>
                    <label>QQ号码：  </label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQQ" /><i>多个关键字用,隔开</i></li>
                <li>
                    <label>所属代理：</label><input name="" type="text" class="dfinput" runat="server" id="txtBelongsProxyId" /><i>如没有，可以为空，不填写，如果填写，则必须为代理帐号</i></li>
                <li>
                    <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" />&nbsp;<input class="cancel" name="" type="button" onclick="window.history.go(-1);" value="返回" /></li>
            </ul>

        </div>
        <ul class="forminfo">
            <li>
                <table class="tablelist">
                    <tbody>
                        <tr>
                            <td>抽水值：<asp:Literal ID="ltTax" runat="server"></asp:Literal></td>

                            <td>总上分：<asp:Literal ID="ltUpScore" runat="server"></asp:Literal></td>
                            <td>总下分：<asp:Literal ID="ltDownScore" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td>当前盈利：<asp:Literal ID="ltTotalWin" runat="server"></asp:Literal></td>
                            <td>账户余额：<asp:Literal ID="ltScore" runat="server"></asp:Literal></td>
                            <td>推荐人：<asp:Literal ID="ltRecommendUserName" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td>账号状态：<asp:Literal ID="ltUserStatus" runat="server"></asp:Literal></td>
                            <td>注册时间：<asp:Literal ID="ltRegisterDate" runat="server"></asp:Literal></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </li>
        </ul>
    </form>
</body>
</html>
