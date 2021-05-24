<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GamePageItemList.aspx.cs" Inherits="Game.Web.Module.AppManager.GamePageItemList" %>

<%@ Register Src="~/Themes/TabGame.ascx" TagPrefix="Fox" TagName="Tab" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <title></title>
    <script type="text/javascript">
        window.onload = function () {

            SetTableRowColor();
        }
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：游戏系统 - 游戏管理
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <ul class="tab_menu clearfix">
            <li onclick="Redirect('GameGameItemList.aspx')">模块</li>

            <li onclick="Redirect('GameTypeItemList.aspx')">类型</li>

            <li onclick="Redirect('GameKindItemList.aspx')">游戏</li>

            <li onclick="Redirect('GameNodeItemList.aspx')">节点</li>

            <li class="cur" onclick="Redirect('GamePageItemList.aspx')">自定义页</li>
        </ul>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; ">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td4">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('GamePageItemInfo.aspx?cmd=add')" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </th>
                            <th>管理
                            </th>
                            <th>页面标识
                            </th>
                            <th>页面名称
                            </th>
                            <th>游戏名称
                            </th>
                            <th>节点名称
                            </th>
                            <th>操作类型
                            </th>
                            <th>排序
                            </th>
                            <th>资源路径
                            </th>
                            <th>禁用状态
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("PageID")%>' />
                                </td>
                                <td>
                                    <a class="l" href="GamePageItemInfo.aspx?cmd=edit&param=<%#Eval("PageID") %>">更新</a>
                                </td>
                                <td>
                                    <%# Eval( "PageID" )%>
                                </td>
                                <td>
                                    <%# Eval( "DisplayName" )%>
                                </td>
                                <td>
                                    <%# GetGameKindName(int.Parse( Eval( "KindID" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetGameNodeName( int.Parse( Eval( "NodeID" ).ToString( ) ) )%>
                                </td>
                                <td>
                                    <%# GetOperateType(int.Parse(Eval( "OperateType" ).ToString()))%>
                                </td>
                                <td>
                                    <%# Eval("SortID")%>
                                </td>
                                <td>
                                    <%# Eval( "ResponseUrl" )%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("PageID")%>' />
                                </td>
                                <td>
                                    <a class="l" href="GamePageItemInfo.aspx?cmd=edit&param=<%#Eval("PageID") %>">更新</a>
                                </td>
                                <td>
                                    <%# Eval( "PageID" )%>
                                </td>
                                <td>
                                    <%# Eval( "DisplayName" )%>
                                </td>
                                <td>
                                    <%# GetGameKindName(int.Parse( Eval( "KindID" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetGameNodeName( int.Parse( Eval( "NodeID" ).ToString( ) ) )%>
                                </td>
                                <td>
                                    <%# GetOperateType(int.Parse(Eval( "OperateType" ).ToString()))%>
                                </td>
                                <td>
                                    <%# Eval("SortID")%>
                                </td>
                                <td>
                                    <%# Eval( "ResponseUrl" )%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
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
