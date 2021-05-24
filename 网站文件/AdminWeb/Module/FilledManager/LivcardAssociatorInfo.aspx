<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LivcardAssociatorInfo.aspx.cs" Inherits="Game.Web.Module.FilledManager.LivcardAssociatorInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/comm.js"></script>
    <script type="text/javascript" src="../../scripts/jquery.zclip.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnCopy").zclip({
                path: "../../scripts/ZeroClipboard.swf",
                copy: function () {
                    return $("#rechageLinksTextBox").val();
                },
                afterCopy: function () {
                    alert("复制成功。");
                }
            });

            $("#Button1").click(function () {
                var img = document.getElementById('<%=this.qRCodeImg.ClientID%>');
                var opop = window.open(img.src, "", "width=1,height=1,top=5000,left=5000");
                for (; opop.document.readyState!="complete";) {
                    if(opop.document.readyState=="complete")
                    {
                        break;
                    }
                }
                opop.document.execCommand("saveAs");
                opop.close();
            });
        });
    </script>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：充值系统 - 实卡信息
                </td>
            </tr>
        </table>
        <%--   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="titleOpBg Lpd10">
                <input type="button" value="关闭" class="btn_operate" onclick="javascript:window.close()" />
                 <input class="btnLine" type="button" />
                <asp:Button ID="btnDisable" runat="server" Text="禁用" CssClass="btn_operate" OnClick="btnDisable_Click"  />
                <asp:Button ID="btnEnable" runat="server" Text="启用" CssClass="btn_operate" OnClick="btnEnable_Click"  />
            </td>
        </tr>
    </table>--%>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        基本信息
                    </div>
                </td>
            </tr>
            <tr runat="server" id="rechargeLinksTr">
                <td class="listTdLeft">充值链接：
                </td>
                <td>
                    <asp:TextBox ID="rechageLinksTextBox" CssClass="text" runat="server" Width="350"></asp:TextBox>&nbsp
                    <input type="button" id="btnCopy" class="btn_operate" value="复制" />
                </td>
            </tr>
            <tr runat="server" id="rechargeQrTr">
                <td class="listTdLeft">充值二维码：
                </td>
                <td>
                    <asp:Image ImageUrl="" ID="qRCodeImg" runat="server" />
                    &nbsp
                    <input type="button" id="Button1" class="btn_operate" value="保存二维码" />
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">实卡卡号：
                </td>
                <td>
                    <asp:Literal ID="ltSerialID" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">实卡名称：
                </td>
                <td>
                    <asp:Literal ID="ltCardTypeName" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">生产批次：
                </td>
                <td>
                    <asp:Literal ID="ltBuildID" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">实卡价格：
                </td>
                <td>
                    <asp:Literal ID="ltCardPrice" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">实卡金币：
                </td>
                <td>
                    <asp:Literal ID="ltCardGold" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="listTdLeft">会员等级：
                </td>
                <td>
                    <asp:Literal ID="ltMemberOrder" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="listTdLeft">会员天数：
                </td>
                <td>
                    <asp:Literal ID="ltMemberDays" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="listTdLeft">使用范围：
                </td>
                <td>
                    <asp:Literal ID="ltUseRange" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="listTdLeft">销售商：
                </td>
                <td>
                    <asp:Literal ID="ltSalesPerson" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">禁用状态：
                </td>
                <td>
                    <asp:Literal ID="ltNullity" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">生成日期：
                </td>
                <td>
                    <asp:Literal ID="ltBuildDate" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">有效日期：
                </td>
                <td>
                    <asp:Literal ID="ltValidDate" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        权限信息
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">用户权限：
                </td>
                <td>
                    <asp:CheckBoxList ID="ckbUserRight" runat="server" RepeatDirection="Horizontal" RepeatColumns="6">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr style="display: none;">
                <td class="listTdLeft">服务权限：
                </td>
                <td></td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="lbPayCardMsg" runat="server" Text="充值信息不存在"></asp:Literal>
                    </div>
                </td>
            </tr>
            <asp:Panel ID="plPyaCard" runat="server" Visible="false">
                <tr>
                    <td class="listTdLeft">充值日期：
                    </td>
                    <td>
                        <asp:Literal ID="ltPayDate" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="listTdLeft">用户名(游戏ID)：
                    </td>
                    <td>
                        <asp:Literal ID="ltPayUser" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="listTdLeft">操作用户：
                    </td>
                    <td>
                        <asp:Literal ID="ltPayOperUser" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="listTdLeft">充值前金币：
                    </td>
                    <td>
                        <asp:Literal ID="ltPayBeforeGold" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="listTdLeft">充值地址：
                    </td>
                    <td>
                        <asp:Literal ID="ltPayAddress" runat="server"></asp:Literal>
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 30px;"></td>
                <td>
                    <input type="button" value="关闭" class="btn_operate" onclick="javascript: window.close()" />
                    <input class="btnLine" type="button" />
                    <asp:Button ID="btnDisable2" runat="server" Text="禁用" CssClass="btn_operate" OnClick="btnDisable_Click" />
                    <asp:Button ID="btnEnable2" runat="server" Text="启用" CssClass="btn_operate" OnClick="btnEnable_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

