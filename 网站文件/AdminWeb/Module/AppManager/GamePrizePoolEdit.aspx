<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GamePrizePoolEdit.aspx.cs" Inherits="Game.Web.Module.AppManager.GamePrizePoolEdit" %>

<%@ Register Src="~/Themes/TabGame.ascx" TagPrefix="Fox" TagName="Tab" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                <div class="arr">
                </div>
            </td>
            <td width="1232" height="25" valign="top" align="left">
                你当前位置：游戏系统 - 游戏管理 - 奖池配置
            </td>
        </tr>
    </table>

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
        <tr>
            <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                <div class="hg3  pd7">
                    <asp:Literal ID="litInfo" runat="server"></asp:Literal>模块信息</div>
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                游戏：
            </td>
            <td>
                <asp:DropDownList ID="ddlGameId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGameId_SelectedIndexChanged">
                                <asp:ListItem Value="0">==全部游戏==</asp:ListItem>
                            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                房间：
            </td>
            <td>
                <asp:DropDownList ID="ddlRoomId" runat="server">
                                <asp:ListItem Value="0">==全部房间==</asp:ListItem>
                            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                奖池金额：
            </td>
            <td>
                <asp:TextBox ID="txtPrizePool" runat="server" CssClass="text" CausesValidation="True" ></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrizePool" Display="Dynamic" ErrorMessage="奖池金额：0~1,000,000,000" SetFocusOnError="True" ValidationExpression="^[1-9]\d{1,9}|0$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPrizePool" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                奖池类型： </td>
            <td>
                <asp:CheckBox ID="cbGamePrize" runat="server" Text="游戏奖池" /> <asp:CheckBox ID="cbRoomPrize" runat="server" Text="房间奖池" />
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                税收比例：
            </td>
            <td>
                <asp:TextBox ID="txtRateOfTax" runat="server" CssClass="text" Text="0" CausesValidation="True"></asp:TextBox>
                ‱(万分比)
                <asp:RangeValidator ID="rvRateOfTax" runat="server" Display="Dynamic" ErrorMessage="税收比例为 0~10000 的整数!" ControlToValidate="txtRateOfTax" MaximumValue="10000" MinimumValue="0" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                中奖比例：
            </td>
            <td>
                <asp:TextBox ID="txtRateOfPrize" runat="server" CssClass="text" Text="0" CausesValidation="True"></asp:TextBox>
                ‱(万分比)
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="中奖比例为 0~10000 的整数!" ControlToValidate="txtRateOfPrize" Display="Dynamic" MaximumValue="10000" MinimumValue="0" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">
                中奖是否发送跑马灯： </td>
            <td>
                <asp:CheckBox ID="cbIsSendMsg" runat="server" /> 
            </td>
        </tr>
        </table>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="titleOpBg Lpd10">
                <input type="button" value="返回" class="btn_operate" onclick="Redirect('GamePrizePoolList.aspx')" />
                <input class="btnLine" type="button" />
                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn_operate" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

