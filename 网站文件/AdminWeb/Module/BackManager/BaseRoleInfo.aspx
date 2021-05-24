<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseRoleInfo.aspx.cs" Inherits="Game.Web.Module.BackManager.BaseRoleInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：后台系统 - 管理员管理</td>
            </tr>
        </table>
        <ul class="tab_menu clearfix">
            <li class="cur" onclick="Redirect('BaseRoleList.aspx')">角色管理</li>
            <li onclick="Redirect('BaseUserList.aspx')">用户管理</li>
        </ul>


        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>角色信息
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">角色名称：</td>
                <td>
                    <asp:TextBox ID="txtRoleName" runat="server" CssClass="text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">备注：</td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="text"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td4"></td>
                <td class="td3">
                    <input type="button" value="返回" class="btn_operate" onclick="Redirect('BaseRoleList.aspx')" />
                    <input class="btnLine" type="button" />
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate"
                        OnClick="btnSave_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
