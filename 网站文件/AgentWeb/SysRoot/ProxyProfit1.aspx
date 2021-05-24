<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyProfit1.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyProfit1" %>

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
    <script src="/js/DatePicker/WdatePicker.js"></script>

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
        });
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
                <ul id="tabUl">
                    <li><a href="#tab1">代理分成利润</a></li>
                    <li><a href="#tab2"  onclick="location.href='/SysRoot/ProxyProfitByTax.aspx#tab2'">代理佣金利润</a></li>
                     <li><a href="#tab3" onclick="location.href='/SysRoot/MemberWinLostScore.aspx#tab3'">会员盈亏报表</a></li>
                    <li style="display:<%=this.Proxy.belongsAgent == -1 ? "" : "none"%>"><a href="#tab4" onclick="location.href='/SysRoot/SendBounsDetail.aspx#tab4'">发放利润明细</a></li>
                </ul>
            </div>
            <br />
            <ul class="seachform">

                <li>
                    <label>日期</label><input name="" id="txtBeginTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'txtEndTime\');}'})" type="text" class="scinput" />-
                        <input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtBeginTime\',{d:0});}'})" runat="server" type="text" class="scinput" /></li>

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
                    <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn" runat="server" Text="查询" OnClick="btnQuery_Click" />
                </li>

            </ul>

            <table class="tablelist">
                <thead>
                    <tr>
                        <th>序号<i class="sort"><img src="/images/px.gif" /></i></th>
                        <th>代理帐号</th>
                        <th>所属代理</th>
                        <th>代理级数</th>
                        <th>会员盈亏</th>
                        <th>下级代理盈亏</th>
                        <th>占成</th>
                        <th>利润</th>
                        <th>纯利润</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("RowIndex")%></td>
                                <td><%#Eval("account")%></td>
                                <td><%#Eval("PAccount")%></td>
                                <td><%#Eval("ProxyLevel")%></td>
                                <td><a href="javascript:void(0)"  class="tablelink" onclick="getMemberWinLostClick(0,<%#Eval("ProxyId")%>)"><%#Convert.ToInt64(Eval("MemberWinScore"))+Convert.ToInt64(Eval("MemberLostScore"))%></a> </td>
                                <td><%#Convert.ToInt64(Eval("NextProxyWinScore"))+Convert.ToInt64(Eval("NextProxyLostScore")) %></td>
                                <td><%#Eval("ProfitProportion")%>%</td>
                                <td><%#Eval("Profit")%></td>
                                <td><%#Eval("PureProfit")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="pagination pull-right">
                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
            </div>

        </div>
        &nbsp;
    <script type="text/javascript">
        $("#tabUl").idTabs("tab1");

        $(".click").click(function () {
            $(".tip").fadeIn(200);
        });

        $('.tablelist tbody tr:odd').addClass('odd');

        /* ddlHandleType.SelectedValue = Request.QueryString["ddlHandleType"];
                ddlQueryType.SelectedValue = Request.QueryString["ddlQueryType"];
                txtBeginTime.Value = Request.QueryString["startTime"];
                txtEndTime.Value = Request.QueryString["endTime"];
                txtKeyword.Value = Request.QueryString["txtKeyword"];*/
        function getMemberWinLostClick(key,proxyId)
        {
            location.href = "/SysRoot/MemberWinLostScore.aspx?ddlHandleType=" + $("#<%=this.ddlQueryType.ClientID %>").val() +
                "&ddlHandleType=0&txtKeyword=" + proxyId +
                "&txtBeginTime=" + $("#<%=this.txtBeginTime.ClientID %>").val() + "&txtEndTime=" + $("#<%=this.txtEndTime.ClientID %>").val();
               // + "&searchTypeHiddent=" + key;
        }
    </script>
    </form>
</body>
</html>

