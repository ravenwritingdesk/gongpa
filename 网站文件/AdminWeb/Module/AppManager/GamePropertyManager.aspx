<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GamePropertyManager.aspx.cs" Inherits="Game.Web.Module.AppManager.GamePropertyManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：系统维护 - 道具管理
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 80%">
                <table cellspacing="0" cellpading="0">
                    <tr>
                        <td class="td1"></td>
                        <td height="39" class="titleOpBg">
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDisable" runat="server" Text="禁用" CssClass="btn_operate" OnClick="btnDisable_Click" OnClientClick="return deleteop()" />
                            <asp:Button ID="btnEnable" runat="server" Text="启用" CssClass="btn_operate" OnClick="btnEnable_Click" OnClientClick="return deleteop()" />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </th>
                            <th>管理
                            </th>
                            <th>名称
                            </th>
                            <th>现金价格
                            </th>
                            <th>金币价格
                            </th>
                            <th>折扣价
                            </th>
                            <th>发行范围
                            </th>
                            <th>使用范围
                            </th>
                            <th>赠送魅力
                            </th>
                            <th>接受魅力
                            </th>
                            <th>状态
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# "<input name='cid' type='checkbox' value='" + Eval( "ID" ) + "'/>" %>
                                </td>
                                <td>
                                    <a href="GamePropertyInfo.aspx?param=<%# Eval("ID").ToString()%>" class="l">更新</a>
                                </td>
                                <td>
                                    <%# Eval( "Name" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "Cash" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "Gold" )%>
                                </td>
                                <td>
                                    <%# Eval( "Discount" )%>
                                </td>
                                <td>
                                    <%# GetIssueArea(int.Parse(Eval( "IssueArea" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetServiceArea(int.Parse(Eval( "ServiceArea" ).ToString()))%>
                                </td>
                                <td>
                                    <%# Eval( "SendLoveLiness" )%>
                                </td>
                                <td>
                                    <%# Eval( "RecvLoveLiness" )%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)( Eval( "Nullity" ) ))%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# "<input name='cid' type='checkbox' value='" + Eval( "ID" ) + "'/>" %>
                                </td>
                                <td>
                                    <a href="GamePropertyInfo.aspx?param=<%# Eval("ID").ToString()%>" class="l">更新</a>
                                </td>
                                <td>
                                    <%# Eval( "Name" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "Cash" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "Gold" )%>
                                </td>
                                <td>
                                    <%# Eval( "Discount" )%>
                                </td>
                                <td>
                                    <%# GetIssueArea(int.Parse(Eval( "IssueArea" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetServiceArea(int.Parse(Eval( "ServiceArea" ).ToString()))%>
                                </td>
                                <td>
                                    <%# Eval( "SendLoveLiness" )%>
                                </td>
                                <td>
                                    <%# Eval( "RecvLoveLiness" )%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)( Eval( "Nullity" )))%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg">
                        <span>选择：</span>&nbsp;<a class="l1" href="javascript:SelectAll(true);">全部</a>&nbsp;-&nbsp;<a class="l1" href="javascript:SelectAll(false);">无</a>
                    </td>
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
