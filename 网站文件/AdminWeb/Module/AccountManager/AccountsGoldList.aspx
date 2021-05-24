<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsGoldList.aspx.cs" Inherits="Game.Web.Module.AccountManager.AccountsGoldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--<link href="../../styles/layout.css" rel="stylesheet" type="text/css" />--%>

    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/comm.js"></script>
    <script type="text/javascript">
        //showtable();
        window.onload = function () {

            SetTableRowColor();

        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 66px;
        }
    </style>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 金币管理
                </td>
            </tr>
        </table>

        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center">
                    <colgroup>
                        <col width="10%" />
                        <col width="12%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">普通查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按用户ID</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="td4">
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>游戏ID
                            </th>
                            <th>用户帐号
                            </th>
                            <th>用户昵称
                            </th>
                            <th class="listTitle2" axis="Score">
                                <a href="Javascript:void(0);" onclick='OrderBy("Score")' class="l1">金币</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("InsureScore")' class="l1">银行</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("Score,InsureScore")' class="l1">金币+银行</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("Revenue")' class="l1">税收</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("WinCount,LostCount,DrawCount,FleeCount")' class="l1">总局</a>
                            </th>

                            <th class="auto-style1">
                                <a href="Javascript:void(0);" onclick='OrderBy("WinCount")' class="l1">赢局</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("LostCount")' class="l1">输局</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("DrawCount")' class="l1">和局</a>
                            </th>

                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("FleeCount")' class="l1">逃局</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("AllLogonTimes")' class="l1">登录次数</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("PlayTimeCount")' class="l1">游戏时长</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("OnLineTimeCount")' class="l1">在线时长</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("LastLogonDate")' class="l1">最后登录时间</a>
                            </th>
                            <th>
                                <a href="Javascript:void(0);" onclick='OrderBy("LastLogonIP")' class="l1">最后登录地址</a>
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#GetGameID(int.Parse( Eval( "UserID" ).ToString( )))%>
                                </td>
                                <td title="<%# GetAccounts(int.Parse(Eval( "UserID" ).ToString()))%>">[<%# GetMemberType(int.Parse(Eval( "UserID" ).ToString())) %>]<a class="l" href="javascript:void(0);" onclick="openWindowOwn('AccountsGoldInfo.aspx?param=<%#Eval("UserID").ToString() %>','<%#Eval("UserID").ToString() %>',850,600);">
                                    <%# GetAccounts(int.Parse(Eval( "UserID" ).ToString( ))) %></a>
                                </td>
                                <td>
                                    <%# GetNickNameByUserID( int.Parse( Eval( "UserID" ).ToString( ) ) )%>
                                </td>
                                <td>
                                    <%# Eval( "Score" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "InsureScore" ).ToString( )%>
                                </td>
                                <td>
                                    <%# long.Parse( Eval( "InsureScore" ).ToString( ) ) + long.Parse( Eval( "Score" ).ToString( ) )%>
                                </td>

                                <td>
                                    <%# Eval( "Revenue" ).ToString( )%>
                                </td>
                                <td>
                                    <%# int.Parse( Eval( "WinCount" ).ToString( ) ) + int.Parse( Eval( "LostCount" ).ToString( ) ) + int.Parse( Eval( "DrawCount" ).ToString( ) ) + int.Parse( Eval( "FleeCount" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# Eval( "WinCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "LostCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "DrawCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "FleeCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "AllLogonTimes" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "PlayTimeCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "OnLineTimeCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "LastLogonDate" ).ToString()%>
                                </td>
                                <td title="<%# GetAddressWithIP( Eval("LastLogonIP").ToString())%>">
                                    <%# Eval( "LastLogonIP" ).ToString( ) %>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#GetGameID(int.Parse( Eval( "UserID" ).ToString( )))%>
                                </td>
                                <td title="<%# GetAccounts(int.Parse(Eval( "UserID" ).ToString()))%>">[<%# GetMemberType(int.Parse(Eval( "UserID" ).ToString())) %>]<a class="l" href="javascript:void(0);" onclick="openWindowOwn('AccountsGoldInfo.aspx?param=<%#Eval("UserID").ToString() %>','<%#Eval("UserID").ToString() %>',850,600);">
                                    <%# GetAccounts(int.Parse(Eval( "UserID" ).ToString( ))) %></a>
                                </td>
                                <td>
                                    <%# GetNickNameByUserID( int.Parse( Eval( "UserID" ).ToString( ) ) )%>
                                </td>
                                <td>
                                    <%# Eval( "Score" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "InsureScore" ).ToString( )%>
                                </td>
                                <td>
                                    <%# long.Parse( Eval( "InsureScore" ).ToString( ) ) + long.Parse( Eval( "Score" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# Eval( "Revenue" ).ToString( )%>
                                </td>
                                <td>
                                    <%# int.Parse( Eval( "WinCount" ).ToString( ) ) + int.Parse( Eval( "LostCount" ).ToString( ) ) + int.Parse( Eval( "DrawCount" ).ToString( ) ) + int.Parse( Eval( "FleeCount" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# Eval( "WinCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "LostCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "DrawCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "FleeCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "AllLogonTimes" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "PlayTimeCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "OnLineTimeCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "LastLogonDate" ).ToString()%>
                                </td>
                                <td title="<%# GetAddressWithIP( Eval("LastLogonIP").ToString())%>">
                                    <%#Eval( "LastLogonIP" ).ToString( )%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg" style=""></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpPage" OnPageChanged="anpPage_PageChanged" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%" UrlPaging="false">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
