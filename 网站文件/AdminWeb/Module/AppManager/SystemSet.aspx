<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemSet.aspx.cs" Inherits="Game.Web.Module.AppManager.SystemSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.validate.js"></script>

    <script type="text/javascript" src="../../scripts/messages_cn.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.metadata.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery.metadata.setType("attr", "validate");
            jQuery("#<%=form1.ClientID %>").validate();
        });
    </script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：游戏系统 - 系统设置
                </td>
            </tr>
        </table>
        <div id="tipDiv" runat="server">
            <ul class="tab_menu clearfix">
            </ul>
        </div>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2" id="table1" runat="server">
            <tr>
                <td class="listTdLeft">键名：
                </td>
                <td>
                    <asp:TextBox ID="txtStatusName" runat="server" CssClass="text" Width="120px" MaxLength="50" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">键值：
                </td>
                <td>
                    <asp:TextBox ID="txtStatusValue" runat="server" CssClass="text" Width="120px" MaxLength="50" validate="{digits:true}"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">名称：
                </td>
                <td>
                    <asp:TextBox ID="txtStatusTip" runat="server" CssClass="text" Width="250px" MaxLength="50" validate="{required:true}"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">备注：
                </td>
                <td>
                    <asp:TextBox ID="txtStatusString" runat="server" CssClass="text" Width="450px" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">描述：
                </td>
                <td>
                    <asp:TextBox ID="txtStatusDescription" runat="server" CssClass="text" TextMode="MultiLine" Width="450px" Height="150px"></asp:TextBox>
                </td>
            </tr>
        </table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2"  id="table2" runat="server">
            <tr>
                <td height="35" colspan="2">
                   
                </td>
            </tr>
             <tr>
                <td height="35" colspan="2">
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Repeater ID="rptModuleMapping" runat="server" OnItemDataBound="rptModule_ItemDataBound">
                        <ItemTemplate>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
                                <tr>
                                    <td height="35" class="f14 bold Lpd10 Rpd10">
                                        <div class="hg3  pd7">
                                            <asp:Label ID="lblName" runat="server"></asp:Label>&nbsp;<asp:CheckBox runat="server" ID="chkStatusName" name="chkStatusName" />
                                            <input type="hidden" runat="server" id="hdID" name="hdID" />
                                            <input type="hidden" runat="server" id="hdKind" name="hdKind" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvSubModuleMapping" runat="server" Width="100%" AutoGenerateColumns="false" CellPadding="0" CellSpacing="0" GridLines="None"
                                            ShowHeader="false" OnRowDataBound="gvSubModule_RowDataBound">
                                            <Columns>
                                                 <asp:TemplateField ItemStyle-CssClass="listTdLeft">
                                                    <ItemTemplate>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBoxList runat="server" ID="cblSubModule" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td4"></td>
                <td class="td4">
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" OnClick="btnSave_Click" />
                </td>
                <td class="td4"></td>
            </tr>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">
    function SelectAllTable(flag, tableID) {
        var m_list_table = document.getElementById(tableID);

        var m_list_checkbox = GelTags("input", m_list_table);
        for (var i = m_list_checkbox.length - 1; i >= 0; i--) {
            m_list_checkbox[i].checked = flag;
        }
    }
</script>
