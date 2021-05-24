<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsInsureList.aspx.cs" Inherits="Game.Web.Module.AccountManager.AccountsInsureList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 银行记录
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 50%">
                <table cellspacing="0" cellpading="0">
                     <colgroup>
                        <col width="8%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="22%" />
                        <col width="6%" />
                        <col width="26%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">普通查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按汇款用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按汇款游戏ID</asp:ListItem>
                                <asp:ListItem Value="3">按收款用户帐号</asp:ListItem>
                                <asp:ListItem Value="4">按收款游戏ID</asp:ListItem>
                                <asp:ListItem Value="5">游戏ID</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="td2">日期:
                            <asp:TextBox ID="txtStartDate" runat="server"  CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                       至:
                            <asp:TextBox ID="txtEndDate" runat="server"  CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlTradeType" runat="server">
                                <asp:ListItem Value="0" Text="全部"></asp:ListItem>
                                <asp:ListItem Value="1" Text="存款"></asp:ListItem>
                                <asp:ListItem Value="2" Text="取款"></asp:ListItem>
                                <asp:ListItem Value="3" Text="转账"></asp:ListItem>
                                <asp:ListItem Value="4" Text="赠送"></asp:ListItem>
                                <asp:ListItem Value="5" Text="兑换奖券"></asp:ListItem>
                                <asp:ListItem Value="6" Text="抽奖"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="Button2" runat="server" Text="今天" CssClass="btn_operate" OnClick="btnQueryTD_Click" />
                            <asp:Button ID="Button3" runat="server" Text="昨天" CssClass="btn_operate" OnClick="btnQueryYD_Click" />
                            <asp:Button ID="Button4" runat="server" Text="本周" CssClass="btn_operate" OnClick="btnQueryTW_Click" />
                            <asp:Button ID="Button5" runat="server" Text="上周" CssClass="btn_operate" OnClick="btnQueryYW_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>时间
                            </th>
                            <th>汇款人
                            </th>
                            <th>收款人
                            </th>
                            <th>交易类型
                            </th>
                            <th>汇款人背包
                            </th>
                            <th>汇款人银行
                            </th>
                            <th>收款人背包
                            </th>
                            <th>收款人银行
                            </th>
                            <th>交易金币
                            </th>
                            <th>服务费
                            </th>
                            <th>操作场所
                            </th>
                            <th>操作地址
                            </th>
                            <th>游戏
                            </th>
                            <th>房间
                            </th>
                            <th>备注
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptInsure" runat="server" OnItemDataBound="rptInsure_ItemDataBound">
                        <ItemTemplate>
                            <tr align="center" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# Eval("CollectDate")%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('AccountsInfo.aspx?param=<%#Eval("SourceUserID").ToString() %>','<%#Eval("SourceUserID").ToString() %>',850,600);">
                                        <%# GetAccounts((int)Eval("SourceUserID"))%>
                                    </a>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('AccountsInfo.aspx?param=<%#Eval("TargetUserID").ToString() %>','<%#Eval("TargetUserID").ToString() %>',850,600);">
                                        <%# ((byte)Eval("TradeType") == 3 || (byte)Eval("TradeType") == 4) ? GetAccounts((int)Eval("TargetUserID")) : ""%>
                                    </a>
                                </td>
                                <td>
                                    <asp:Label ID="lblTradeType" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <%# Eval("SourceGold")%>
                                </td>
                                <td>
                                    <%# Eval("SourceBank")%>
                                </td>
                                <td>
                                    <%# ((byte)Eval("TradeType") == 3 || (byte)Eval("TradeType") == 4) ? Eval("TargetGold") : "" %>
                                </td>
                                <td>
                                    <%# ((byte)Eval("TradeType") == 3 || (byte)Eval("TradeType") == 4) ? Eval("TargetBank") : "" %>
                                </td>
                                <td>
                                    <%# Eval("SwapScore")%>
                                </td>
                                <td>
                                    <%# Eval("Revenue")%>
                                </td>
                                <td>
                                    <%# (byte)Eval("IsGamePlaza") == 0 ? "大厅" : "网页"%>
                                </td>
                                <td title=" <%# Eval( "ClientIP" ).ToString( )%>">
                                    <%# GetAddressWithIP( Eval( "ClientIP" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# GetGameKindName((int)Eval("KindID"))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName((int)Eval("ServerID"))%>
                                </td>
                                <td>
                                    <%# Eval("CollectNote")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# Eval("CollectDate")%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('AccountsInfo.aspx?param=<%#Eval("SourceUserID").ToString() %>','<%#Eval("SourceUserID").ToString() %>',850,600);">
                                        <%# GetAccounts((int)Eval("SourceUserID"))%>
                                    </a>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('AccountsInfo.aspx?param=<%#Eval("TargetUserID").ToString() %>','<%#Eval("TargetUserID").ToString() %>',850,600);">
                                        <%# ((byte)Eval("TradeType") == 3 || (byte)Eval("TradeType") == 4) ? GetAccounts((int)Eval("TargetUserID")) : ""%>
                                    </a>
                                </td>
                                <td>
                                    <asp:Label ID="lblTradeType" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <%# Eval("SourceGold")%>
                                </td>
                                <td>
                                    <%# Eval("SourceBank")%>
                                </td>
                                <td>
                                    <%# ((byte)Eval("TradeType") == 3 || (byte)Eval("TradeType") == 4) ? Eval("TargetGold") : "" %>
                                </td>
                                <td>
                                    <%# ((byte)Eval("TradeType") == 3 || (byte)Eval("TradeType") == 4) ? Eval("TargetBank") : "" %>
                                </td>
                                <td>
                                    <%# Eval("SwapScore")%>
                                </td>
                                <td>
                                    <%# Eval("Revenue")%>
                                </td>
                                <td>
                                    <%# (byte)Eval("IsGamePlaza") == 0 ? "大厅" : "网页"%>
                                </td>
                                <td title=" <%# Eval( "ClientIP" ).ToString( )%>">
                                    <%# Eval( "ClientIP" ).ToString( )%>
                                </td>
                                <td>
                                    <%# GetGameKindName((int)Eval("KindID"))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName((int)Eval("ServerID"))%>
                                </td>
                                <td>
                                    <%# Eval("CollectNote")%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
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
