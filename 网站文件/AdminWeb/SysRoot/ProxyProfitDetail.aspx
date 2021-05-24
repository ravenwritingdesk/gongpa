<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyProfitDetail.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyProfitDetail" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>

    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/ProxyProfit.aspx">代理利润</a></li>
                <li><a href="javascript:void(0)">代理盈亏明细</a></li>
            </ul>
        </div>
        <div class="rightinfo">

            <div class="tools">
                <ul class="toolbar1" style="width: 70%">
                    <li id="searchInfo" runat="server"></li>
                </ul>
                <ul class="toolbar1" style="width: 30%; float: right">
                    <li><a href="javascript:void(0);" onclick="goBackClick()">返回上一页</a></li>
                </ul>


            </div>
            <input type="hidden" id="hdStartTime" name="hdStartTime" runat="server" value="" />
            <input type="hidden" id="hdEndTime" name="hdEndTime" runat="server" value="" />
            <input type="hidden" id="hdSearchPorxyId" name="hdSearchPorxyId" runat="server" value="" />
            <input type="hidden" id="hdSearchPorxyAccount" name="hdSearchPorxyAccount" runat="server" value="" />
            <input type="hidden" id="hdSearchPorxyLevel" name="hdSearchPorxyLevel   " runat="server" value="" />
            <input type="hidden" id="hdHandleType" name="hdHandleType" runat="server" value="" />
            <br />

            <table class="tablelist">
                <thead>
                    <tr>
                        <td rowspan="2" class="th1">级别</td>
                        <td rowspan="2" class="th1">用户Id</td>
                        <td rowspan="2" class="th1">用户帐号</td>
                        <th>下级代理</th>
                        <td colspan="5"  class="th1">我的输赢</td>
                    </tr>
                    <tr>
                        <th>输赢</th>
                        <td  class="th1">应收下线</td>
                        <td  class="th1">占成</td>
                        <%--<td  class="th1">佣金占成</td>--%>
                        <td  class="th1">分成结果</td>
                        <td  class="th1">本级利润</td>
                        <%--<td  class="th1">佣金结果</td>--%>
                        <%--<td  class="th1">盈亏结果</td>--%>
                        <td  class="th1">应交上级</td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("LevelName")%></td>
                                <td><a class="tablelink" href="javascript:void(0);" onclick="gotoProxyProfit('<%#Eval("ProxyID")%>')" ><%#Eval("ProxyID")%></a></td>
                                <td><%#Eval("account")%></td>
                                <td><%#Convert.ToDecimal(Eval("MemberWinScore")) + Convert.ToDecimal(Eval("MemberLostScore")) + Convert.ToDecimal(Eval("NextProxyWinScore")) + Convert.ToDecimal(Eval("NextProxyLostScore"))%></td>
                                <%--<td><%#Convert.ToDecimal(Eval("MemberTempTax"))+Convert.ToDecimal(Eval("NextProxyTempTax")) %></td>
                                <td><%#Eval("TotalWinLost") %></td>--%>
                                <td><%#Convert.ToDecimal(Eval("TotalWinLost")) - Convert.ToDecimal(Eval("TotalProfitWinLost"))%></td>
                                <td><%#Eval("PProfitProportion")%></td>
                                <%--<td><%#Eval("PAssignProportion")%></td>--%>
                                <td><%#Eval("ParentProfit")%></td>
                                <td><%#Convert.ToDecimal(Eval("ParentTotalProfitWinLost")) - Convert.ToDecimal(Eval("TotalProfitWinLost"))%></td>
                                <%--<td><%#Eval("ParentTaxProfit")%></td>--%>
                                <%--<td><%#Eval("ParentTotalProfitWinLost")%></td>--%>
                                <td><%#Convert.ToDecimal(Eval("TotalWinLost")) - Convert.ToDecimal(Eval("ParentTotalProfitWinLost"))%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                     <tr style="background-color:#e5ebee" >
                        <td></td>
                        <td></td>
                        <td>统计</td>
                        <td><span id="spStatWinLost" runat="server"></span></td>
                        <%--<td><span id="spStatTax" runat="server"></span></td>
                        <td><span id="spStatScore" runat="server"></span></td>--%>
                        <td><span id="spRecNextProxy" runat="server"></span></td>
                        <td></td>
                        <td><span id="spStatParentProfit" runat="server"></span></td>
                        <td><span id="spCurrentProfit" runat="server"></span></td>
                        <%--<td><span id="spStatParentTaxProfit" runat="server"></span></td>--%>
                        <%--<td><span id="spParentTotalProfitWinLost" runat="server"></span></td>--%>
                        <td><span id="spParentTotalProfitWinLost2" runat="server"></span></td>
                    </tr>
                </tbody>
            </table>


            <div class="pagination pull-right">
                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
            </div>
        </div>
        &nbsp;
    </form>
</body>
</html>
<script type="text/javascript">
    function goBackClick() {
        location.href = "/SysRoot/ProxyProfit.aspx?StartTime=" + $("#<%=this.hdStartTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.hdEndTime.ClientID%>").val() +
                 "&SearchPorxyId=" + $("#<%=this.hdSearchPorxyId.ClientID%>").val() +
                 "&HandleType=" + $("#<%=this.hdHandleType.ClientID%>").val();
    }
    function gotoProxyProfit(proxyId) {
        location.href = "/SysRoot/ProxyProfit.aspx?StartTime=" + $("#<%=this.hdStartTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.hdEndTime.ClientID%>").val() +
                 "&SearchPorxyId=" + proxyId+
                 "&HandleType=" + $("#<%=this.hdHandleType.ClientID%>").val();
    }

    $(function () {
        $("tbody td").each(function (k, v) {
            if ($(v).index() > 2 && $(v).index() != 5 && $(v).index() != 7) {
                var text = $(v).text();
                if ($(v).text().indexOf("-") == 0) {
                    $(v).html("<font color='red'>" + text + "</font>");
                } else {
                    $(v).html("<font color='green'>" + text + "</font>");
                }
            }
        });
    });
</script>




