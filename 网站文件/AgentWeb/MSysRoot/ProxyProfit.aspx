<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/main.Master" AutoEventWireup="true" CodeBehind="ProxyProfit.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.ProxyProfit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        th {
         text-align:center;
        }
    </style>
    <script src="/js/DatePicker/WdatePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>代理利润
                        <small>信息列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">代理利润</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form id="Form1" class="text-right" runat="server">
                <div class="row pad">
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            <div class="btn-group">
                                <button type="button" style="width: 68px; height: 26px;" class="btn btn-default btn-sm btn-flat dropdown-toggle">
                                    <span id="Span2" runat="server">日期</span>
                                </button>
                            </div>
                            &nbsp;<input name="" id="txtBeginTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" style="width: 135px;" />-
                            <input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" runat="server" type="text" style="width: 135px;" />
                            &nbsp;
                            <asp:DropDownList ID="ddlHandleType" CssClass="select3" runat="server">
                                <asp:ListItem Text="--选择类型--" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="未结算" Value="0"></asp:ListItem>
                                <asp:ListItem Text="已结算" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <%-- <button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown1" style="height: 26px; margin-bottom: 2px;">
                                 <span id="HandleTypeDesc" runat="server">-选择类型-</span> <span class="caret"></span>
                             </button>
                            <input runat="server" type="hidden" id="hiddenHandleType" value="0" />
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="javascript:void(0)" onclick="HandleTypeClick(-1,this)">-选择类型-</a></li>
                                <li><a href="javascript:void(0)" onclick="HandleTypeClick(0,this)">未结算</a></li>
                                <li><a href="javascript:void(0)" onclick="HandleTypeClick(1,this)">已结算</a></li>
                            </ul>--%>
                        </div>
                    </div>
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            <div class="btn-group">
                                <%--<button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown" style="height: 26px;">
                                    <span id="QueryTypeDesc" runat="server">代理ID</span> <span class="caret"></span>
                                </button>
                                <input runat="server" type="hidden" id="hiddenQueryType" value="0" />
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="javascript:void(0)" onclick="selectClick(0,this)">代理ID</a></li>
                                    <li><a href="javascript:void(0)" onclick="selectClick(1,this)">代理账号</a></li>
                                </ul>--%>
                                <asp:DropDownList ID="ddlQueryType" runat="server">
                                    <asp:ListItem Text="代理ID" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="代理账号" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            &nbsp;<input name="" class="form-control input-sm" style="width: 77%; margin-right: 12px;" placeholder="Search" type="text" runat="server" id="txtKeyword" />
                            <div class="input-group-btn">
                                <asp:Button ID="btnQuery" class="btn btn-sm btn-primary" runat="server" Text="查询" OnClick="btnQuery_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-body table-responsive">
                                <table id="example1" class="table table-bordered" style="text-align:center;">
                                    <thead>
                                        <tr>
                                            <th>代理帐号</th>
                                            <th>代理级数</th>
                                            <th>所属代理</th>
                                            <th>占成</th>
                                            <th>利润来源</th>
                                            <th>盈亏</th>
                                            <th>应收下线</th>
                                            <th>分成结果</th>
                                            <th>本级利润</th>
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
                                            <td>直属会员</td>
                                            <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]))%></td>
                                            <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]))%></td>
                                            <td><%=FormatMoney(row["MemberProfit"])%></td>
                                            <td><%=FormatMoney(row["MemberProfit"])%></td>
                                            <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]) + Convert.ToInt64(row["MemberTempTax"]) - Convert.ToInt64(row["MemberProfit"]) - Convert.ToInt64(row["MemberTaxProfit"]))%></td>
                                            <td><a class="tablelink" href="javascript:void(0)" onclick="getMemberProfitDetailClick()">查看盈亏明细</a></td>
                                        </tr>
                                        <tr>
                                            <td>直属代理</td>
                                            <td><%=FormatMoney(Convert.ToInt64(row["NextProxyWinScore"]) + Convert.ToInt64(row["NextProxyLostScore"]))%></td>
                                            <td><%=FormatMoney(row2["RecNextProxy"])%></td>
                                            <td><%=FormatMoney(row["ProxyProfit"])%></td>
                                            <td><%=FormatMoney(Convert.ToInt64(row2["RecNextProxy"]) - Convert.ToInt64(row2["ParentTotalProfitWinLost2"]))%></td>
                                            <td><%=FormatMoney(row2["ParentTotalProfitWinLost2"])%></td>
                                            <td><a class="tablelink" href="javascript:void(0)" onclick="getProxyProfitDetailClick()">查看盈亏明细</a></td>
                                        </tr>
                                        <tr style="background-color: #e5ebee">
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td>统计</td>
                                            <td><%=FormatMoney(Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]) + Convert.ToInt64(row["NextProxyWinScore"]) + Convert.ToInt64(row["NextProxyLostScore"]))%></td>
                                            <td><%=FormatMoney(Convert.ToInt64(row2["RecNextProxy"]) + Convert.ToInt64(row["MemberWinScore"]) + Convert.ToInt64(row["MemberLostScore"]))%></td>
                                            <td><%=FormatMoney(row["MyProfit"])%></td>
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
                                        <%}%>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>代理帐号</th>
                                            <th>代理级数</th>
                                            <th>所属代理</th>
                                            <th>占成</th>
                                            <th>利润来源</th>
                                            <th>盈亏</th>
                                            <th>应收下线</th>
                                            <th>分成结果</th>
                                            <th>本级利润</th>
                                            <th>应交上级</th>
                                            <th>操作</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </aside>
    <script type="text/javascript">
        $(document).ready(function () {
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



    <% if (row != null)
       {%>
        function getMemberProfitDetailClick() {
            location.href = "/MSysRoot/MemberProfitDetail.aspx?StartTime=" + $("#<%=this.txtBeginTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.txtEndTime.ClientID%>").val() +
                "&SearchPorxyId=" + '<%=row["ProxyId"]%>' + "&SearchPorxyAccount=" + '<%=row["account"]%>' +
                 "&SearchPorxyLevel=" + '<%=row["LevelName"]%>' + "&HandleType=" + $("#<%=this.ddlHandleType.ClientID%>").val();
        }

        function getProxyProfitDetailClick() {
            location.href = "/MSysRoot/ProxyProfitDetail.aspx?StartTime=" + $("#<%=this.txtBeginTime.ClientID%>").val() + "&EndTime=" + $("#<%=this.txtEndTime.ClientID%>").val() +
                "&SearchPorxyId=" + '<%=row["ProxyId"]%>' + "&SearchPorxyAccount=" + '<%=row["account"]%>' +
                 "&SearchPorxyLevel=" + '<%=row["LevelName"]%>' + "&HandleType=" + $("#<%=this.ddlHandleType.ClientID%>").val();
        }
        <% }%>
    </script>
</asp:Content>
