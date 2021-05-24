<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecordExchangeInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.RecordExchangeInfo" %>


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
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 发货管理</td>
            </tr>
        </table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        发货管理
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">商品名称：</td>
                <td>
                    <asp:Literal ID="txtPrizeName" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">商品价格：</td>
                <td>
                    <asp:Literal ID="txtPrizePrice" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">状态：</td>
                <td>
                    <asp:Literal ID="txtHandleType" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">购买者帐号：</td>
                <td>
                    <asp:Literal ID="txtUserAccount" runat="server"></asp:Literal>
                </td>
            </tr>
             <tr>
                <td class="listTdLeft">所属代理：</td>
                <td>
                    <asp:Literal ID="txtBelongAgent" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">收货人姓名：</td>
                <td>
                    <asp:Literal ID="txtRecUserName" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">收货人电话：</td>
                <td>
                    <asp:Literal ID="txtRecUserPhone" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">收货人邮编：</td>
                <td>
                    <asp:Literal ID="txtRecUserZipcode" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">收货人地址：</td>
                <td>
                    <asp:Literal ID="txtRecUserAddress" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">取消原因：</td>
                <td>
                    <asp:TextBox ID="txtCancelReson" runat="server" CssClass="text wd4" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
        </table>
        <input type="hidden" runat="server" id="IdHidden" />
        <br />
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="td4" runat="server" id="operatorTd">
                            <asp:Button ID="btnSuccess" runat="server" Text="发货" CssClass="btn_operate"
                                OnClick="btnSuccess_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn_operate"
                                OnClick="btnCancel_Click" />
                        </td>
                        <td>
                            <input type="button" value="返回" class="btn_operate" onclick="Redirect('RecordExchangeList.aspx')" />

                        </td>
                        <td class="td5"></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>

