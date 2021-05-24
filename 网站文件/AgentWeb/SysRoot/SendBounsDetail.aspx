<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendBounsDetail.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.SendBounsDetail" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/js/DatePicker/WdatePicker.js"></script>
    <script src="/js/Common.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select1").uedSelect({
                width: 345
            });
            $(".select2").uedSelect({
                width: 167
            });
            $(".select3").uedSelect({
                width: 100
            });
            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&ProxyIdText=" + $("#<%=ProxyIdText.ClientID %>").val() + "&txtStartTime=" + $("#<%=txtStartTime.ClientID %>").val() + "&txtEndTime=" + $("#<%=txtEndTime.ClientID %>").val()
                                            + "&isSummaryChecked=" + $("#<%=isSummaryChecked.ClientID %>").is(":checked");
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
            </ul>
        </div>

        <div class="rightinfo">
            <div class="itab">
                <%-- <ul id="tabUl">
                    <li><a href="#tab1" onclick="location.href='/SysRoot/ProxyProfit.aspx#tab1'">代理分成利润</a></li>
                    <li><a href="#tab2" onclick="location.href='/SysRoot/ProxyProfitByTax.aspx#tab2'">代理佣金利润</a></li>
                    <li><a href="#tab3" onclick="location.href='/SysRoot/MemberWinLostScore.aspx#tab3'">会员盈亏报表</a></li>
                    <li><a href="#tab4">发放利润明细</a></li>
                </ul>--%>
                <ul id="tabUl">
                    <li><a href="#tab1" onclick="location.href='/SysRoot/ProxyProfit.aspx#tab1'">代理利润</a></li>
                    <li><a href="#tab2">发放利润明细</a></li>
                </ul>

            </div>
            <br />
            <div class="tabson">


                <ul class="seachform">

                    <li>
                        <label>代理ID</label></li>
                    <li>
                        <div class="vocation">
                            <input name="ProxyIdText" type="text" class="scinput" runat="server" id="ProxyIdText" />
                        </div>
                    </li>
                    <li>
                        <label>日期</label><input name="" id="txtStartTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtEndTime\',{d:-365});}',maxDate:'#F{$dp.$D(\'txtEndTime\',{d:0});}'})" type="text" class="scinput" />-<input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtBeginTime\',{d:0});}'})" runat="server" type="text" class="scinput" />
                    </li>
                    <li>
                        <label>是否汇总</label></li>
                    <li>
                        <input type="checkbox" runat="server" style="margin-top: 60%;" name="isSummaryChecked" id="isSummaryChecked" />
                    </li>
                    <li>
                        <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn" runat="server" Text="查询" OnClick="btnQuery_Click" />
                    </li>
                </ul>

                <input type="hidden" id="hdOrderByType" runat="server" value="" />
                <input type="hidden" id="hdOrderByField" runat="server" value="" />
                <table class="tablelist">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>发出方ID</th>
                            <th>发出方账号</th>
                            <th>接收方ID</th>
                            <th>接收方账号</th>
                            <th><a href='javascript:OrderByClick("BonusNumber","");' id="OrderByA_BonusNumber" class="tablelink">发出值(金币)</a></th>
                            <th>发出时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="reptDataPager" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowIndex")%></td>
                                    <td><%#Eval("SenderProxyId")%></td>
                                    <td><%#Eval("SendAccount")%></td>
                                    <td><%# Eval("ReciverProxyId")%></td>
                                    <td><%#Eval("RecAccount")%></td>
                                    <td><%#FormatMoney(Eval("BonusNumber"))%></td>
                                    <td><%# Eval("CreateTime")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowIndex")%></td>
                                    <td><%#Eval("SenderProxyId")%></td>
                                    <td><%#Eval("SendAccount")%></td>
                                    <td><%# Eval("ReciverProxyId")%></td>
                                    <td><%#Eval("RecAccount")%></td>
                                    <td><%#FormatMoney(Eval("BonusNumber"))%></td>
                                    <td>--</td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>


            </div>
            <div class="pagination pull-right">
                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="|<" LastPageText=">|" NextPageText=">" PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
            </div>
        </div>

        <script type="text/javascript">
            $("#tabUl").idTabs("tab2");
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>

