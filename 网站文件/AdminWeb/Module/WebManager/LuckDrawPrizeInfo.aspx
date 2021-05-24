<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuckDrawPrizeInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.LuckDrawPrizeInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/plugins/code/prettify.js"></script>
    <title></title>
    <script type="text/javascript">

        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtIntroduction', {
                cssPath: '/scripts/kindEditor/plugins/code/prettify.css',
                uploadJson: '/scripts/kindEditor/asp.net/upload_json.ashx?type=Introduction',
                allowFileManager: true
            });
            prettyPrint();
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 奖品管理</td>
            </tr>
        </table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>奖品管理
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">奖品类型：</td>
                <td id="addTd" runat="server">
                    <asp:DropDownList ID="ddlType" runat="server" Width="200">
                        <asp:ListItem Value="0">金币</asp:ListItem>
                        <asp:ListItem Value="1">奖券</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">奖品名称：</td>
                <td>
                    <asp:TextBox ID="txtPrizeName" runat="server" CssClass="text" Width="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">奖励值：</td>
                <td id="Td1" runat="server">
                    <asp:TextBox ID="txtPrizeValue" runat="server" CssClass="text" Width="200"  onblur="this.value=this.value.replace(/[^\d\.]/g,'')"></asp:TextBox>
                </td>
            </tr>
        </table>
        <input type="hidden" id="hiddenId" name="hiddenId" runat="server"  />
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <colgroup>
                <col width="18%;" />
                <col  />
            </colgroup>
            <tr>
                <td style="float:right;">
                    <input type="button" value="返回" class="btn_operate" onclick="Redirect('LuckDrawPrizeList.aspx')" />
                    <input class="btnLine" type="button" />
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" OnClick="btnSave_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
