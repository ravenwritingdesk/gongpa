<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderKQList.aspx.cs" Inherits="Game.Web.Module.FilledManager.OrderKQList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <title></title>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：充值系统 - 快钱记录
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <div class="winQuery">

            <div class="searchList" style="height: 40px; margin-right: 40%">
                <table cellspacing="0" cellpading="0">
                    <tr>

                        <td class="td1">日期查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtStartDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">至:
                            <asp:TextBox ID="txtEndDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Value="0">全部</asp:ListItem>
                                <asp:ListItem Value="10">支付成功</asp:ListItem>
                                <asp:ListItem Value="11">支付失败</asp:ListItem>
                            </asp:DropDownList>
                        </td>

                        <td >
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnQueryTD" runat="server" Text="今天" CssClass="btn_operate" OnClick="btnQueryTD_Click" />
                            <asp:Button ID="btnQueryYD" runat="server" Text="昨天" CssClass="btn_operate" OnClick="btnQueryYD_Click" />
                            <asp:Button ID="btnQueryTW" runat="server" Text="本周" CssClass="btn_operate" OnClick="btnQueryTW_Click" />
                            <asp:Button ID="btnQueryYW" runat="server" Text="上周" CssClass="btn_operate" OnClick="btnQueryYW_Click" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px; margin-right: 50%">
                <table cellspacing="0" cellpading="0">
                    <tr>
                        <td class="td1">用户查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" CssClass="text" runat="server"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按订单号码</asp:ListItem>
                                <asp:ListItem Value="2">按交易号码</asp:ListItem>
                                <asp:ListItem Value="3">按交易地址</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td>
                            <asp:Button ID="btnQueryOrder" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQueryOrder_Click" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px; margin-right: 90%">
                <table cellspacing="0" cellpading="0">
                    <tr>
                        <td class="td1">
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td></td>
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
                            <th>订单号码
                            </th>
                            <th>快钱交易号
                            </th>
                            <th>订单金额
                            </th>
                            <th>实付金额
                            </th>
                            <th>手续费
                            </th>
                            <th>订单日期
                            </th>
                            <th>交易日期
                            </th>
                            <th>支付结果
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptKQDetail" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (string)Eval("PayResult") == "10" ? "&nbsp;" : "<input name='cid' type='checkbox' value='" + Eval("DetailID") + "'/>"%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0)" onclick="javascript:openWindowOwn('OrderKQInfo.aspx?id=<%# Eval("DetailID")%>','<%# Eval("OrderID")%>',850,600)">
                                        <%# Eval("OrderID")%></a>
                                </td>
                                <td>
                                    <%# Eval("DealID")%>
                                </td>
                                <td>
                                    <%# Eval("OrderAmount")%>
                                </td>
                                <td>
                                    <%# Eval("PayAmount")%>
                                </td>
                                <td>
                                    <%# Eval("Fee")%>
                                </td>
                                <td>
                                    <%# Eval("OrderTime")%>
                                </td>
                                <td>
                                    <%# Eval("DealTime")%>
                                </td>
                                <td>
                                    <%# (string)Eval("PayResult") == "10" ? "<span class='lan'>成功<span>" : "<span class='hong'>失败<span>"%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (string)Eval("PayResult") == "10" ? "&nbsp;" : "<input name='cid' type='checkbox' value='" + Eval("DetailID") + "'/>"%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0)" onclick="javascript:openWindowOwn('OrderKQInfo.aspx?id=<%# Eval("DetailID")%>','<%# Eval("OrderID")%>',850,600)">
                                        <%# Eval("OrderID")%></a>
                                </td>
                                <td>
                                    <%# Eval("DealID")%>
                                </td>
                                <td>
                                    <%# Eval("OrderAmount")%>
                                </td>
                                <td>
                                    <%# Eval("PayAmount")%>
                                </td>
                                <td>
                                    <%# Eval("Fee")%>
                                </td>
                                <td>
                                    <%# Eval("OrderTime")%>
                                </td>
                                <td>
                                    <%# Eval("DealTime")%>
                                </td>
                                <td>
                                    <%# (string)Eval("PayResult") == "10" ? "<span class='lan'>成功<span>" : "<span class='hong'>失败<span>"%>
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
