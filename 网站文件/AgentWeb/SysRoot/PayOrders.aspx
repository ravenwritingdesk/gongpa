<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayOrders.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.PayOrders" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/DatePicker/WdatePicker.js"></script>
    <script src="/js/Common.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select").uedSelect({
                width: 140
            });
            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&drpOrderType=" + $("#<%=drpOrderType.ClientID %>").val() + "&drpOrderCategory=" + $("#<%=drpOrderCategory.ClientID %>").val()
                            + "&txtBeginTime=" + $("#<%=txtBeginTime.ClientID %>").val() + "&txtEndTime=" + $("#<%=txtEndTime.ClientID %>").val()
                            + "&ddlQueryType=" + $("#<%=ddlQueryType.ClientID %>").val() + "&txtKeyword=" + $("#<%=txtKeyword.ClientID %>").val()
                            + "&txtHandlerUserAccount=" + $("#<%=txtHandlerUserAccount.ClientID %>").val()
                            + "&isStat=" + $("#<%=isStat.ClientID %>").is(":checked");
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
                <li><a href="/SysRoot/ProxyProfit.aspx">代理利润</a></li>
                <li><a href="/SysRoot/PayOrders.aspx">订单列表</a></li>
            </ul>
        </div>

        <div class="rightinfo">

            <div class="itab">
                <ul id="tabUl">
                    <li><a href="#tab1" onclick="location.href='/SysRoot/PayOrderManage.aspx#tab1'">订单管理</a></li>
                    <li><a href="#tab2" onclick="location.href='/SysRoot/UpDownScore.aspx#tab2'">会员上分下分</a></li>
                    <li><a href="#tab3" onclick="location.href='/SysRoot/ProxyUpScore.aspx#tab3'">代理上分下分</a></li>
                    <li><a href="#tab4">充值提现历史</a></li>
                </ul>
            </div>
            <%--style="display: <%=this.Proxy.belongsAgent == -1 ? "" : "none"%>"--%>

            <div class="tabson">
                <ul class="seachform">
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="drpOrderType" CssClass="select" runat="server">
                                <asp:ListItem Text="==订单类型==" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="充值" Value="200"></asp:ListItem>
                                <asp:ListItem Text="兑奖" Value="201"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="drpOrderCategory" CssClass="select" runat="server">
                                <asp:ListItem Text="==支付方式==" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="代理后台操作" Value="100"></asp:ListItem>
                                <asp:ListItem Text="实卡支付" Value="101"></asp:ListItem>
                                <asp:ListItem Text="第三方支付" Value="102"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <label>日期</label></li>
                    <li>
                        <input name="" id="txtBeginTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtEndTime\',{d:-365});}',maxDate:'#F{$dp.$D(\'txtEndTime\',{d:0});}'})" type="text" class="scinput" />-<input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtBeginTime\',{d:0});}'})" runat="server" type="text" class="scinput" />
                    </li>
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlQueryType" CssClass="select" runat="server">
                                <asp:ListItem Text="用户ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="用户名称" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtKeyword" /></li>
                    <li>
                        <label>处理者帐号</label></li>
                    <li>
                        <input name="" id="txtHandlerUserAccount" runat="server" type="text" class="scinput" />
                    </li>
                    <li>
                        <label>统计</label></li>
                    <li>
                        <input type="checkbox" runat="server" name="isStat" id="isStat" />
                    </li>
                    <li>
                        <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn" runat="server" Text="查询" OnClick="btnQuery_Click" />
                    </li>
                    <li></li>
                </ul>


                <input type="hidden" id="hdOrderByType" runat="server" value="" />
                <input type="hidden" id="hdOrderByField" runat="server" value="" />
                <table class="tablelist">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>订单号</th>
                            <th>用户ID</th>
                            <th><a href='javascript:OrderByClick("PayAmount","");' id="OrderByA_PayAmount" class="tablelink">实际金额(元)</a></th>
                            <th><a href='javascript:OrderByClick("GameAmount","");' id="OrderByA_GameAmount" class="tablelink">游戏金币</a></th>
                            <th><a href='javascript:OrderByClick("OrderTime","");' id="OrderByA_OrderTime" class="tablelink">下单时间</a></th>
                            <th>备注</th>
                            <th>订单状态</th>
                            <th>订单类型</th>
                            <th>支付方式</th>
                            <th>处理者</th>
                            <th><a href='javascript:OrderByClick("HandlerTime","");' id="OrderByA_HandlerTime" class="tablelink">处理时间</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="reptDataPager" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowIndex") %></td>
                                    <td><%#Eval("OrderNo") %></td>
                                    <td><%#Eval("UserId") %></td>
                                    <td><%#FormatMoney( Eval("PayAmount")) %></td>
                                    <td><%#FormatMoney(Eval("GameAmount")) %></td>
                                    <td><%#Eval("OrderTime") %></td>
                                    <td><%# Eval("OrderStatus").ToString()== "-1" ? Eval("CancelRemark") : Eval("SubmitRemark") %></td>
                                    <td><%# GetOrderStatus(Eval("OrderStatus").ToString()) %></td>
                                    <td><%#(Eval("OrderType").ToString() == "200" ||Eval("OrderType").ToString() == "202"  ) ? "充值" : "兑奖" %></td>
                                    <td><%# GetOrderCategory(Eval("OrderCategory").ToString()) %></td>
                                    <td><%#Eval("HandlerUserAccount") %></td>
                                    <td><%#Eval("HandlerTime") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div runat="server" id="statDiv" class="statdiv">
                    <span style="margin-left: 5%;">总上(人民币):&nbsp<span class="inSpan" runat="server" id="totalUpScoreSpanRMB"></span></span>
                    <span style="margin-left: 10%;">总上(金币):&nbsp<span class="inSpan" runat="server" id="totalUpScoreSpan"></span></span>
                    <span style="margin-left: 10%;">总下(人民币):&nbsp<span class="inSpan" runat="server" id="totalDownScoreSpanRMB"></span></span>
                    <span style="margin-left: 10%;">总下(金币):&nbsp<span class="inSpan" runat="server" id="totalDownScoreSpan"></span></span>
                </div>
                <div class="pagination pull-right">
                    <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="|<" LastPageText=">|" NextPageText=">" PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(".itab ul").idTabs("tab4");

            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>

