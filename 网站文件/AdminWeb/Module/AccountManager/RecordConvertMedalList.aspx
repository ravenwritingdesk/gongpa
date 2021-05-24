﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecordConvertMedalList.aspx.cs" Inherits="Game.Web.Module.AccountManager.RecordConvertMedalList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--<link href="../../styles/layout.css" rel="stylesheet" type="text/css" />--%>
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/comm.js"></script>
    <script  type="text/javascript" src="../../scripts/JQuery.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 奖牌兑换记录
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 50%">
                <table cellspacing="0" cellpading="0">
                    <tr>

                        <td class="td1">日期查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtStartDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">至:
                            <asp:TextBox ID="txtEndDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                            <asp:Button ID="btnQueryTD" runat="server" Text="今天" CssClass="btn_operate" OnClick="btnQueryTD_Click" />

                            <asp:Button ID="btnQueryYD" runat="server" Text="昨天" CssClass="btn_operate" OnClick="btnQueryYD_Click" />
                            <asp:Button ID="btnQueryTW" runat="server" Text="本周" CssClass="btn_operate" OnClick="btnQueryTW_Click" />
                            <asp:Button ID="btnQueryYW" runat="server" Text="上周" CssClass="btn_operate" OnClick="btnQueryYW_Click" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px; margin-right: 80%">
                <table cellspacing="0" cellpading="0">
                    <tr>
                        <td class="td1">用户查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" CssClass="text" runat="server"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按游戏ID</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery1_Click" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>

                        <tr align="center">
                            <th>序号
                            </th>
                            <td class="listTitle">兑换日期
                        </th>
                        <th>用户
                        </th>
                                <th>兑换奖牌数
                                </th>
                                <th>兑换前奖牌数
                                </th>
                                <th>兑换前银行金币
                                </th>
                                <th>兑换后银行金币
                                </th>
                                <th>兑换比例
                                </th>
                                <th>兑换场所
                                </th>
                                <th>地址
                                </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# anpNews.PageSize * ( anpNews.CurrentPageIndex - 1 ) + ( Container.ItemIndex + 1 )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# GetAccounts( Convert.ToInt32( Eval("UserID").ToString()))%>
                                </td>
                                <td>
                                    <%# Eval( "ConvertUserMedal" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CurUserMedal" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CurInsureScore" ).ToString( )%>
                                </td>
                                <td>
                                    <%#  Convert.ToInt64( Eval( "CurInsureScore" ).ToString( ) ) + Convert.ToInt64( Eval( "ConvertUserMedal" ).ToString( ) ) * Convert.ToInt64( Convert.ToDouble( Eval( "ConvertRate" ).ToString( ) ) )%>
                                </td>
                                <td>1:<%# Convert.ToInt32( Eval( "ConvertRate" ) )%>
                                </td>
                                <td>
                                    <%# GetExchangePlace(int.Parse( Eval( "IsGamePlaza" ).ToString()) )%>
                                </td>
                                <td>
                                    <%# GetAddressWithIP( Eval( "ClientIP" ).ToString( ) )%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# anpNews.PageSize * ( anpNews.CurrentPageIndex - 1 ) + ( Container.ItemIndex + 1 )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# GetAccounts( Convert.ToInt32( Eval("UserID").ToString()))%>
                                </td>
                                <td>
                                    <%# Eval( "ConvertUserMedal" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CurUserMedal" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CurInsureScore" ).ToString( )%>
                                </td>
                                <td>
                                    <%#  Convert.ToInt64( Eval( "CurInsureScore" ).ToString( ) ) + Convert.ToInt64( Eval( "ConvertUserMedal" ).ToString( ) ) * Convert.ToInt64( Convert.ToDouble( Eval( "ConvertRate" ).ToString( ) ) )%>
                                </td>
                                <td>1:<%# Convert.ToInt32( Eval( "ConvertRate" ) )%>
                                </td>
                                <td>
                                    <%# GetExchangePlace(int.Parse( Eval( "IsGamePlaza" ).ToString()) )%>
                                </td>
                                <td>
                                    <%# GetAddressWithIP( Eval( "ClientIP" ).ToString( ) )%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
        </div>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right" class="page">
                    <gsp:AspNetPager ID="anpNews" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20" NextPageText="下页"
                        PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%"
                        UrlPaging="True">
                    </gsp:AspNetPager>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
