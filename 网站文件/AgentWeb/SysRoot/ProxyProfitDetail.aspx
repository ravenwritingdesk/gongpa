<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyProfitDetail.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyProfitDetail" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
        <script src="/js/Common.js"></script>

    <script type="text/javascript">
        $(document).ready(function (e) {
            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
            $('.tablelist tbody tr:odd').addClass('odd');
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&StartTime=" + $("#<%=this.hdStartTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.hdEndTime.ClientID%>").val() +
                "&SearchPorxyId=" + $("#<%=this.hdSearchPorxyId.ClientID%>").val() + "&SearchPorxyAccount=" + $("#<%=this.hdSearchPorxyAccount.ClientID%>").val() +
                 "&SearchPorxyLevel=" + $("#<%=this.hdSearchPorxyLevel.ClientID%>").val() + "&HandleType=" + $("#<%=this.hdHandleType.ClientID%>").val();
            OrderBy(filed, orderByType, parameters);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/ProxyProfit.aspx">代理报表</a></li>
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
            <input type="hidden" id="hdOrderByType" runat="server" value="" />
            <input type="hidden" id="hdOrderByField" runat="server" value="" />
            <input type="hidden" id="hdStartTime" name="hdStartTime" runat="server" value="" />
            <input type="hidden" id="hdEndTime" name="hdEndTime" runat="server" value="" />
            <input type="hidden" id="hdSearchPorxyId" name="hdSearchPorxyId" runat="server" value="" />
            <input type="hidden" id="hdSearchPorxyAccount" name="hdSearchPorxyAccount" runat="server" value="" />
            <input type="hidden" id="hdSearchPorxyLevel" name="hdSearchPorxyLevel   " runat="server" value="" />
            <input type="hidden" id="hdHandleType" name="hdHandleType" runat="server" value="" />
            <br />

            <b class="unitclass">单位：金币</b>
            <table class="tablelist">
                <thead>
                    <tr>
                        <td rowspan="2" class="th1">级别</td>
                        <td rowspan="2" class="th1">用户Id</td>
                        <td rowspan="2" class="th1">用户帐号</td>
                        <th colspan="2">下级代理</th>
                        <td colspan="5"  class="th1">我的输赢</td>
                    </tr>
                    <tr>
                        <th><a href='javascript:OrderByClick("TotalWinLost","");' id="OrderByA_TotalWinLost" class="tablelink">输赢</a></th>
                        <th>占成</th>
                        <td  class="th1"><a href='javascript:OrderByClick("TotalProfit0","");' id="OrderByA_TotalProfit0" class="tablelink">应收下线</a></td>
                        <td  class="th1">占成</td>
                        <td  class="th1"><a href='javascript:OrderByClick("ParentProfit","");' id="OrderByA_ParentProfit" class="tablelink">分成结果</a></td>
                        <td  class="th1"><a href='javascript:OrderByClick("TotalProfit1","");' id="OrderByA_TotalProfit1" class="tablelink">本级利润</a></td>
                        <td  class="th1"><a href='javascript:OrderByClick("TotalProfit2","");' id="OrderByA_TotalProfit2" class="tablelink">应交上级</a></td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("LevelName")%></td>
                                <td><a class="tablelink" href="javascript:void(0);" onclick="gotoProxyProfit('<%#Eval("ProxyID")%>')" ><%#Eval("ProxyID")%></a></td>
                                <td><%#Eval("account")%></td>
                                <td><%#FormatMoney(Eval("TotalWinLost"))%></td>
                                <td><%#FormatMoney(Eval("ProfitProportion"))%></td>
                                <td><%#FormatMoney(Eval("TotalProfit0"))%></td>
                                <td><%#FormatMoney(Eval("PProfitProportion"))%></td>
                                <td><%#FormatMoney(Eval("ParentProfit"))%></td>
                                <td><%#FormatMoney(Eval("TotalProfit1"))%></td>
                                <td><%#FormatMoney(Eval("TotalProfit2"))%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                     <tr style="background-color:#e5ebee" >
                        <td></td>
                        <td></td>
                        <td>统计</td>
                        <td><span id="spStatWinLost" runat="server"></span></td>
                        <td></td>
                        <td><span id="spRecNextProxy" runat="server"></span></td>
                        <td></td>
                        <td><span id="spStatParentProfit" runat="server"></span></td>
                        <td><span id="spCurrentProfit" runat="server"></span></td>
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
            if ($(v).index() > 2 && $(v).index() != 6 && $(v).index() != 8 && $(v).index() != 5 && $(v).index() != 4) {
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




