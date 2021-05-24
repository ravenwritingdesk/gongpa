<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameRoomInfoList.aspx.cs" Inherits="Game.Web.Module.AppManager.GameRoomInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
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
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：游戏系统 - 房间管理</td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">房间名称：
                        </td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="text"></asp:TextBox>

                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate"
                                OnClick="btnQuery_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <td class="listTitle2">管理</td>
                            <td class="listTitle2">房间标识</td>
                            <td class="listTitle2">房间名称</td>
                            <td class="listTitle2">排序</td>
                            <td class="listTitle2">模块名称</td>
                            <td class="listTitle2">桌子数量</td>
                            <td class="listTitle2">房间类型</td>
                            <td class="listTitle2">服务端口</td>
                            <td class="listTitle2">单位金币</td>
                            <td class="listTitle2">税收比例</td>
                            <td class="listTitle2">限制金币</td>
                            <td class="listTitle2">最低金币</td>
                            <td class="listTitle2">最小进入金币</td>
                            <td class="listTitle2">最大进入金币</td>
                            <td class="listTitle2">最大人数</td>
                            <td class="listTitle2">冻结状态</td>
                            <td class="listTitle2">创建时间</td>
                            <td class="listTitle1">修改时间</td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptGameRoomInfo" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <a class="l" href='/Module/AppManager/GameRoomInfoInfo.aspx?cmd=edit&amp;param=<%#Eval("ServerID") %>'>更新</a>
                                </td>
                                <td><%# Eval("ServerID")%></td>
                                <td><%# Eval("ServerName")%></td>
                                <td><%# Eval("SortID")%></td>
                                <td><%# GetGameGameName(int.Parse( Eval("GameID").ToString()))%></td>
                                <td><%# Eval("TableCount")%></td>
                                <td><%#GetSupporTypeName( Eval( "ServerType" ) )%></td>
                                <td><%# Eval("ServerPort")%></td>
                                <td><%# Eval("CellScore")%></td>
                                <td><%# Eval("RevenueRatio")%></td>
                                <td><%# Eval("RestrictScore")%></td>
                                <td><%# Eval("MinTableScore")%></td>
                                <td><%# Eval("MinEnterScore")%></td>
                                <td><%# Eval("MaxEnterScore")%></td>
                                <td><%# Eval("MaxPlayer")%></td>
                                <td><%# GetNullityStatus((byte)Eval("Nullity"))%></td>
                                <td><%# Eval("CreateDateTime")%></td>
                                <td><%# Eval("ModifyDateTime")%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <a class="l" href='/Module/AppManager/GameRoomInfoInfo.aspx?cmd=edit&amp;param=<%#Eval("ServerID") %>'>更新</a>
                                </td>
                                <td><%# Eval("ServerID")%></td>
                                <td><%# Eval("ServerName")%></td>
                                <td><%# Eval("SortID")%></td>
                                <td><%# GetGameGameName(int.Parse( Eval("GameID").ToString()))%></td>
                                <td><%# Eval("TableCount")%></td>
                                <td><%#GetSupporTypeName( Eval( "ServerType" ) )%></td>
                                <td><%# Eval( "ServerPort" )%></td>
                                <td><%# Eval("CellScore")%></td>
                                <td><%# Eval("RevenueRatio")%></td>
                                <td><%# Eval("RestrictScore")%></td>
                                <td><%# Eval("MinTableScore")%></td>
                                <td><%# Eval("MinEnterScore")%></td>
                                <td><%# Eval("MaxEnterScore")%></td>
                                <td><%# Eval("MaxPlayer")%></td>
                                <td><%# GetNullityStatus((byte)Eval("Nullity"))%></td>
                                <td><%# Eval("CreateDateTime")%></td>
                                <td><%# Eval("ModifyDateTime")%></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg"><span>选择：</span>&nbsp;<a class="l1" href="javascript:SelectAll(true);">全部</a>&nbsp;-&nbsp;<a class="l1" href="javascript:SelectAll(false);">无</a></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20"
                            NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table" NumericButtonCount="5"
                            CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
