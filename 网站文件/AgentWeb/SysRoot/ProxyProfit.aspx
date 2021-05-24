<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyProfit.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyProfit" %>

<%--<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script src="/js/DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/Index.aspx">首页</a></li>
                <li><a href="/SysRoot/ProxyProfit.aspx">代理利润</a></li>
            </ul>
        </div>
        <div class="rightinfo">

            <div class="itab">
                <ul id="tabUl">
                    <li><a href="#tab1">代理利润</a></li>
                    <%--<li><a href="#tab2"  onclick="location.href='/SysRoot/ProxyProfitByTax.aspx#tab2'">代理佣金利润</a></li>--%>
                    <%--<li><a href="#tab3" onclick="location.href='/SysRoot/MemberWinLostScore.aspx#tab3'">会员盈亏报表</a></li>--%>
                  <%-- style="display: <%=this.Proxy.belongsAgent == -1 ? "" : "none"%>"--%> <li ><a href="#tab2" onclick="location.href='/SysRoot/SendBounsDetail.aspx#tab2'">发放利润明细</a></li>
                </ul>
            </div>
            <br />
            <ul class="seachform">

                <li>
                    <label>日期</label><input name="" id="txtBeginTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'txtEndTime\');}'})" type="text" class="scinput" />-
                        <input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtBeginTime\');}'})" runat="server" type="text" class="scinput" /></li>

                <li>
                    <div class="vocation">
                        <asp:DropDownList ID="ddlQueryType" CssClass="select3" runat="server">
                            <asp:ListItem Text="代理ID" Value="0"></asp:ListItem>
                            <asp:ListItem Text="代理账号" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </li>

                <li>
                    <input name="" type="text" class="scinput" runat="server" id="txtKeyword" /></li>
                <li>
                    <div class="vocation">
                        <asp:DropDownList ID="ddlHandleType" CssClass="select3" runat="server">
                            <asp:ListItem Text="--选择类型--" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="未结算" Value="0"></asp:ListItem>
                            <asp:ListItem Text="已结算" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </li>

                <li>
                    <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn1" runat="server" Text="查询"  OnClick="btnQuery_Click" />
                    <input id="Button4" type="button" value="今天" class="scbtn1" onclick="searchClick('0')" />
                    <input id="Button5" type="button" value="昨天" class="scbtn1" onclick="searchClick('1')" />
                    <input id="Button1" type="button" value="前天" class="scbtn1" onclick="searchClick('2')" />
                </li>

            </ul>

            <b class="unitclass">单位：金币</b>
            <table class="tablelist">
                <thead>
                    <tr>
                        <th>代理帐号</th>
                        <th>代理级数</th>
                        <th>所属代理</th>
                        <th>占成</th>
                        <%--<th>佣金占成</th>--%>
                        <th>利润来源</th>
                        <th>盈亏</th>
                      <%--  <th>抽水</th>
                        <th>总计</th>--%>
                        <th>应收下线</th>
                        <th>分成结果</th>
                        <th>本级利润</th>
                        <%--<th>佣金结果</th>--%>
                        <%--<th>盈亏结果</th>--%>
                        <th>应交上级</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (row != null)
                        {
                    %>
                    <tr>
                        <td rowspan="2"><%=row["account"]%></td>
                        <td rowspan="2"><%=row["LevelName"]%></td>
                        <td rowspan="2"><%=row["PAccount"]%></td>
                        <td rowspan="2"><%=row["ProfitProportion"]%>%</td>
                        <%--<td rowspan="2"><%=row["assignProportion"]%>%</td>--%>
                        <td>直属会员</td>
                        <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]))%></td>
                       <%-- <td><%=row["MemberTempTax"]%></td>
                        <td><%=Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]) + Convert.ToInt64(row["MemberTempTax"])%></td>--%>
                        <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]))%></td>
                        <td><%=FormatMoney(row["MemberProfit"])%></td>
                        <td><%=FormatMoney(row["MemberProfit"])%></td>
                        <%--<td><%=row["MemberTaxProfit"]%></td>--%>
                        <%--<td><%=Convert.ToInt64(row["MemberProfit"]) + Convert.ToInt64(row["MemberTaxProfit"])%></td>--%>
                        <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]) + Convert.ToInt64(row["MemberTempTax"]) - Convert.ToInt64(row["MemberProfit"]) - Convert.ToInt64(row["MemberTaxProfit"]))%></td>
                        <td><a class="tablelink" href="javascript:void(0)"   onclick ="getMemberProfitDetailClick()">查看盈亏明细</a></td>
                    </tr>
                    <tr>
                        <td>直属代理</td>
                        <td><%=FormatMoney(Convert.ToInt64(row["NextProxyWinScore"]) + Convert.ToInt64(row["NextProxyLostScore"]))%></td>
                   <%--     <td><%=row["NextProxyTempTax"]%></td>
                        <td><%=row2["StatScore"]%></td>--%>
                        <td><%=FormatMoney(row2["RecNextProxy"])%></td>
                        <td><%=FormatMoney(row["ProxyProfit"])%></td>
                        <td><%=FormatMoney(Convert.ToInt64(row2["RecNextProxy"]) - Convert.ToInt64(row2["ParentTotalProfitWinLost2"]))%></td>
                        <%--<td><%=row["ProxyTaxProfit"]%></td>--%>
                        <%--<td><%=Convert.ToInt64(row["ProxyProfit"]) + Convert.ToInt64(row["ProxyTaxProfit"])%></td>--%>
                        <td><%=FormatMoney(row2["ParentTotalProfitWinLost2"])%></td>
                        <td><a class="tablelink" href="javascript:void(0)"   onclick ="getProxyProfitDetailClick()">查看盈亏明细</a></td>
                    </tr>
                    <tr style="background-color: #e5ebee">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>统计</td>
                        <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]) + Convert.ToInt64(row["NextProxyWinScore"]) + Convert.ToInt64(row["NextProxyLostScore"]))%></td>
                      <%--  <td><%=Convert.ToInt64(row["MemberTempTax"]) + Convert.ToInt64(row["NextProxyTempTax"])%></td>
                        <td><%=row["TotalWinLost"]%></td>--%>
                        <td><%=FormatMoney(Convert.ToInt64(row2["RecNextProxy"]) + Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]))%></td>
                        <td><%=FormatMoney(row["MyProfit"])%></td>
                        <%--<td><%=row["MyTaxProfit"]%></td>--%>
                        <%--<td><%=row["TotalProfitWinLost"]%></td>--%>
                        <td><%=FormatMoney(Convert.ToInt64(row2["RecNextProxy"]) - Convert.ToInt64(row2["ParentTotalProfitWinLost2"])+Convert.ToInt64(row["MemberProfit"]))%></td>
                        <td><%=FormatMoney(Convert.ToInt64(row["TotalWinLost"]) - Convert.ToInt64(row["TotalProfitWinLost"]))%></td>
                        <td></td>
                    </tr>
                    <%}
                        else
                        { %>
                    <tr>
                        <td colspan="13">没有符合条件的记录。</td>
                    </tr>
                    <%} %>
                </tbody>
            </table>



        </div>
        &nbsp;
    </form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".tiptop a").click(function () {
            $(".tip").fadeOut(200);
        });

        $(".sure").click(function () {
            $(".tip").fadeOut(300);
        });

        $(".cancel").click(function () {
            $(".tip").fadeOut(100);
        });

        $(".select1").uedSelect({
            width: 345
        });
        $(".select2").uedSelect({
            width: 167
        });
        $(".select3").uedSelect({
            width: 100
        });

        $("tbody td").each(function (k, v) {
            if (($(v).index() > 4 && $(v).index() != 8 && $(v).index() != 6 || ($(v).parent().index() == 1 && $(v).index() > 0 && $(v).index() != 4 && $(v).index() != 2)) && $(v).text() != "" && $(v).text() != "查看盈亏明细") {
                var text = $(v).text();
                if ($(v).text().indexOf("-") == 0) {
                    $(v).html("<font color='red'>" + text + "</font>");
                } else {
                    $(v).html("<font color='green'>" + text + "</font>");
                }
            }
        });
    });
    $("#tabUl").idTabs("tab1");

    $(".click").click(function () {
        $(".tip").fadeIn(200);
    });

    $('.tablelist tbody tr:odd').addClass('odd');

    <% if (row != null)
       {%>
    function getMemberProfitDetailClick() {
        location.href= "/SysRoot/MemberProfitDetail.aspx?StartTime=" + $("#<%=this.txtBeginTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.txtEndTime.ClientID%>").val() +
                "&SearchPorxyId=" +'<%=row["ProxyId"]%>' +"&SearchPorxyAccount=" + '<%=row["account"]%>' +
                 "&SearchPorxyLevel=" + '<%=row["LevelName"]%>' +"&HandleType=" + $("#<%=this.ddlHandleType.ClientID%>").val();
    }

    function getProxyProfitDetailClick() {
        location.href= "/SysRoot/ProxyProfitDetail.aspx?StartTime=" + $("#<%=this.txtBeginTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.txtEndTime.ClientID%>").val() +
                "&SearchPorxyId=" + '<%=row["ProxyId"]%>' + "&SearchPorxyAccount=" + '<%=row["account"]%>' +
                 "&SearchPorxyLevel=" + '<%=row["LevelName"]%>' + "&HandleType=" + $("#<%=this.ddlHandleType.ClientID%>").val();
    }
    <% }%>

    function searchClick(dayKey)
    {
        var startTime='';
        var endTime = '';
        var date = dayKey;
        switch (dayKey) {
            case "0":
                startTime = '<%=DateTime.Now.Date.ToString("yyyy-MM-dd 00:00:00") %>';
                endTime = '<%=DateTime.Now.Date.ToString("yyyy-MM-dd 23:59:59") %>';
                break;
            case "1":
                startTime = '<%=DateTime.Now.AddDays(-1).Date.ToString("yyyy-MM-dd 00:00:00") %>';
                endTime = '<%=DateTime.Now.AddDays(-1).Date.ToString("yyyy-MM-dd 23:59:59") %>';
                break;
            case "2":
                startTime = '<%=DateTime.Now.AddDays(-2).Date.ToString("yyyy-MM-dd 00:00:00") %>';
                endTime = '<%=DateTime.Now.AddDays(-2).Date.ToString("yyyy-MM-dd 23:59:59") %>';
                break;
            default:
                startTime = '<%=DateTime.Now.Date.ToString("yyyy-MM-dd 00:00:00") %>';
                endTime = '<%=DateTime.Now.Date.ToString("yyyy-MM-dd 23:59:59") %>';
                break;
        }
        $("#<%=txtBeginTime.ClientID%>").val(startTime);
        $("#<%=txtEndTime.ClientID%>").val(endTime);
        $("#<%=btnQuery.ClientID %>").click();
    }
</script>


