<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemSecurityList.aspx.cs" Inherits="Game.Web.Module.OperationLog.SystemSecurityList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <title></title>
    <script type="text/javascript">
        window.onload = function () {

            SetTableRowColor();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：操作日志 - 安全日志
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 30%">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
                     <colgroup>
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">帐号查询：
                        </td>
                        <td class="td2">
                            <asp:TextBox ID="txtKeyword" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlOperatingName" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnSearch_OnClick" />
                            <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr>
                            <td class="listTitle2">标识
                            </td>
                            <td class="listTitle2">操作时间
                            </td>
                            <td class="listTitle2">操作帐号
                            </td>
                            <td class="listTitle2">操作
                            </td>
                            <td class="listTitle2">操作IP
                            </td>
                            <td class="listTitle2">操作内容
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#  Eval( "RecordID" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "OperatingTime", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%#  Eval( "OperatingAccounts" ).ToString( )%>
                                </td>
                                <td>
                                    <%#  Eval( "OperatingName" ).ToString( )%>
                                </td>
                                <td title="<%# GetAddressWithIP( Eval( "OperatingIP" ).ToString( ) )%>">
                                    <%# Eval( "OperatingIP" ).ToString( ) %>
                                </td>
                                <td title="<%# Eval( "OperatingContent")%>">
                                    <%#FormatString(Eval("OperatingContent").ToString(),50)%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#  Eval( "RecordID" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "OperatingTime", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%#  Eval( "OperatingAccounts" ).ToString( )%>
                                </td>
                                <td>
                                    <%#  Eval( "OperatingName" ).ToString( )%>
                                </td>
                                <td title="<%# GetAddressWithIP( Eval( "OperatingIP" ).ToString( ) )%>">
                                    <%# Eval( "OperatingIP" ).ToString( ) %>
                                </td>
                                 <td title="<%# Eval( "OperatingContent")%>">
                                    <%#FormatString(Eval("OperatingContent").ToString(),50)%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg"></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
