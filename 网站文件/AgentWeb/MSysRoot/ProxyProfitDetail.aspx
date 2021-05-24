<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/Main.Master" AutoEventWireup="true" CodeBehind="ProxyProfitDetail.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.ProxyProfitDetail" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        th {
            text-align: center;
        }

        .th1 {
            background-color: #e5ebee;
        }
        td {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>代理盈亏明细
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">代理报表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form id="Form1" class="text-right" runat="server">
                <input type="hidden" id="hdStartTime" name="hdStartTime" runat="server" value="" />
                <input type="hidden" id="hdEndTime" name="hdEndTime" runat="server" value="" />
                <input type="hidden" id="hdSearchPorxyId" name="hdSearchPorxyId" runat="server" value="" />
                <input type="hidden" id="hdSearchPorxyAccount" name="hdSearchPorxyAccount" runat="server" value="" />
                <input type="hidden" id="hdSearchPorxyLevel" name="hdSearchPorxyLevel   " runat="server" value="" />
                <input type="hidden" id="hdHandleType" name="hdHandleType" runat="server" value="" />
                <div class="row pad">
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            
                                <span class="box-title" id="searchInfo" runat="server"></span>
                            <div class="input-group-btn">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title" >
                                    <a  href="javascript:void(0);" onclick="goBackClick()">
                                    <input type="button" value="返回上一页" class="btn btn-sm btn-primary" /></a>
                                </h3>
                            </div>
                            <div class="box-body table-responsive">
                                <table id="example1" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th rowspan="2"  class="th1">级别</th>
                                            <th rowspan="2"  class="th1">用户Id</th>
                                            <th rowspan="2"  class="th1">用户帐号</th>
                                            <th>下级代理</th>
                                            <th colspan="5" class="th1">我的输赢</th>
                                        </tr>
                                        <tr>
                                            <th>输赢</th>
                                            <th  class="th1">应收下线</th>
                                            <th  class="th1">占成</th>
                                            <th  class="th1">分成结果</th>
                                            <th  class="th1">本级利润</th>
                                            <th  class="th1">应交上级</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="reptDataPager" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("LevelName")%></td>
                                                    <td><a class="tablelink" href="javascript:void(0);" onclick="gotoProxyProfit('<%#Eval("ProxyID")%>')"><%#Eval("ProxyID")%></a></td>
                                                    <td><%#Eval("account")%></td>
                                                    <td><%#FormatMoney(Convert.ToDecimal(Eval("MemberWinScore")) + Convert.ToDecimal(Eval("MemberLostScore")) + Convert.ToDecimal(Eval("NextProxyWinScore")) + Convert.ToDecimal(Eval("NextProxyLostScore")))%></td>
                                                    <td><%#FormatMoney(Convert.ToDecimal(Eval("TotalWinLost")) - Convert.ToDecimal(Eval("TotalProfitWinLost")))%></td>
                                                    <td><%#FormatMoney(Eval("PProfitProportion"))%></td>
                                                    <td><%#FormatMoney(Eval("ParentProfit"))%></td>
                                                    <td><%#FormatMoney(Convert.ToDecimal(Eval("ParentTotalProfitWinLost")) - Convert.ToDecimal(Eval("TotalProfitWinLost")))%></td>
                                                    <td><%#FormatMoney(Convert.ToDecimal(Eval("TotalWinLost")) - Convert.ToDecimal(Eval("ParentTotalProfitWinLost")))%></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr style="background-color: #e5ebee">
                                            <td></td>
                                            <td></td>
                                            <td>统计</td>
                                            <td><span id="spStatWinLost" runat="server"></span></td>
                                            <td><span id="spRecNextProxy" runat="server"></span></td>
                                            <td></td>
                                            <td><span id="spStatParentProfit" runat="server"></span></td>
                                            <td><span id="spCurrentProfit" runat="server"></span></td>
                                            <td><span id="spParentTotalProfitWinLost2" runat="server"></span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box-footer clearfix">
                                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%" Font-Size="8"></webdiyer:AspNetPager>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <script type="text/javascript">
            function goBackClick() {
                location.href = "/MSysRoot/ProxyProfit.aspx?StartTime=" + $("#<%=this.hdStartTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.hdEndTime.ClientID%>").val() +
                     "&SearchPorxyId=" + $("#<%=this.hdSearchPorxyId.ClientID%>").val() +
                 "&HandleType=" + $("#<%=this.hdHandleType.ClientID%>").val();
            }
            function gotoProxyProfit(proxyId) {
                location.href = "/MSysRoot/ProxyProfit.aspx?StartTime=" + $("#<%=this.hdStartTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.hdEndTime.ClientID%>").val() +
                 "&SearchPorxyId=" + proxyId +
                 "&HandleType=" + $("#<%=this.hdHandleType.ClientID%>").val();
            }

            $(function () {
                $("tbody td").each(function (k, v) {
                    if ($(v).index() > 2 && $(v).index() != 5 && $(v).index() != 7 && $(v).index() != 4) {
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

    </aside>
</asp:Content>
