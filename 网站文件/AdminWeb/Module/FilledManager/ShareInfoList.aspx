<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareInfoList.aspx.cs" Inherits="Game.Web.Module.FilledManager.ShareInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：充值系统 - 充值记录
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                     <colgroup>
                        <col width="8%" />
                        <col width="25%" />
                        <col width="9%" />
                        <col width="9%" />
                        <col width="28%" />
                        <col />
                    </colgroup>
                    <tr>

                        <td class="td1">日期查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtStartDate" CssClass="text" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                        至:
                            <asp:TextBox ID="txtEndDate" CssClass="text" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td  class="td2" >
                            <asp:DropDownList ID="ddlGlobalShareInfo" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td  class="td2">
                             <asp:DropDownList ID="ddlCardType" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnQueryTD" runat="server" Text="今天" CssClass="btn_operate" OnClick="btnQueryTD_Click" />
                            <asp:Button ID="btnQueryYD" runat="server" Text="昨天" CssClass="btn_operate" OnClick="btnQueryYD_Click" />
                            <asp:Button ID="btnQueryTW" runat="server" Text="本周" CssClass="btn_operate" OnClick="btnQueryTW_Click" />
                            <asp:Button ID="btnQueryYW" runat="server" Text="上周" CssClass="btn_operate" OnClick="btnQueryYW_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                     <colgroup>
                        <col width="8%" />
                        <col width="12%" />
                        <col width="10%" />
                        <col width="9%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">用户查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" CssClass="text" runat="server"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按游戏ID</asp:ListItem>
                                <asp:ListItem Value="3">按销售商</asp:ListItem>
                                <asp:ListItem Value="4">实卡卡号</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQueryAcc" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQueryAcc_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr>
                            <th>充值时间
                            </th>
                            <th>服务类型
                            </th>
                            <th>用户帐号
                            </th>
                            <th>游戏ID
                            </th>
                            <th>充值卡号
                            </th>
                            <th>订单号码
                            </th>
                            <th>订单金额
                            </th>
                            <th>实付金额
                            </th>
                            <th>卡名称
                            </th>
                            <th>卡价格
                            </th>
                            <th>赠送金币
                            </th>
                            <th>充值前金币
                            </th>
                            <th>充值地址
                            </th>
                            <th>操作用户
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptShareInfo" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# Eval("ApplyDate")%>
                                </td>
                                <td>
                                    <%# GetShareName((int)Eval("ShareID"))%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('../AccountManager/AccountsInfo.aspx?param=<%#Eval("UserID").ToString() %>','<%#Eval("UserID").ToString() %>',850,600);">
                                        <%#Eval("Accounts") %></a>
                                </td>
                                <td>
                                    <%# Eval("GameID")%>
                                </td>
                                <td>
                                    <%# Eval( "SerialID" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval("OrderID")%>
                                </td>
                                <td>
                                    <%# Eval("OrderAmount")%>
                                </td>
                                <td>
                                    <%# Eval("PayAmount")%>
                                </td>
                                <td>
                                    <%# GetCardTypeName(int.Parse(Eval( "CardTypeID" ).ToString()))%>
                                </td>
                                <td>
                                    <%# Eval("CardPrice")%>
                                </td>
                                <td>
                                    <%# Eval( "CardGold" )%>
                                </td>
                                <td>
                                    <%# Eval("BeforeGold")%>
                                </td>
                                <td title=" <%# Eval( "IPAddress" ).ToString( )%>">
                                    <%# GetAddressWithIP( Eval( "IPAddress" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# (int)Eval("OperUserID") == (int)Eval("UserID") ? "&nbsp;" : GetAccounts((int)Eval("OperUserID"))%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# Eval("ApplyDate")%>
                                </td>
                                <td>
                                    <%# GetShareName((int)Eval("ShareID"))%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('../AccountManager/AccountsInfo.aspx?param=<%#Eval("UserID").ToString() %>','<%#Eval("UserID").ToString() %>',850,600);">
                                        <%#Eval("Accounts") %></a>
                                </td>
                                <td>
                                    <%# Eval("GameID")%>
                                </td>
                                <td>
                                    <%# Eval( "SerialID" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval("OrderID")%>
                                </td>
                                <td>
                                    <%# Eval("OrderAmount")%>
                                </td>
                                <td>
                                    <%# Eval("PayAmount")%>
                                </td>
                                <td>
                                    <%# GetCardTypeName(int.Parse(Eval( "CardTypeID" ).ToString()))%>
                                </td>
                                <td>
                                    <%# Eval("CardPrice")%>
                                </td>
                                <td>
                                    <%# Eval( "CardGold" )%>
                                </td>
                                <td>
                                    <%# Eval("BeforeGold")%>
                                </td>
                                <td title=" <%# Eval( "IPAddress" ).ToString( )%>">
                                    <%# GetAddressWithIP( Eval( "IPAddress" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# (int)Eval("OperUserID") == (int)Eval("UserID") ? "&nbsp;" : GetAccounts((int)Eval("OperUserID"))%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <tr runat="server" id="trPayStat">
                        <td colspan="6" style="height: 40px;" class="bold">合计：</td>
                        <td class="bold">
                            <asp:Literal ID="ltOrderAmounts" runat="server"></asp:Literal></td>
                        <td class="bold">
                            <asp:Literal ID="ltPayAmounts" runat="server"></asp:Literal></td>
                        <td class="bold"></td>
                        <td class="bold">
                            <asp:Literal ID="ltCardPrice" runat="server"></asp:Literal></td>
                        <td class="bold">
                            <asp:Literal ID="ltGrantGold" runat="server"></asp:Literal></td>
                        <td colspan="3"></td>
                    </tr>
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
