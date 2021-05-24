<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/main.Master" AutoEventWireup="true" CodeBehind="PayOrder.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.PayOrder" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <section class="content-header">
            <h1>会员上下分
                        <small>订单管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="/msysroot/memberupdownscore.aspx"><i class="fa fa-laptop"></i>会员上下分</a></li>
                <li class="active">订单管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form id="Form1" class="text-right" runat="server">
                <div class="row pad">
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            <button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                <span id="searchText" runat="server">未处理订单</span> <span class="caret"></span>
                            </button>
                            <input runat="server" type="hidden" id="hiddenQueryType" value="0" />

                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" onclick="selectClick(0,this)">未处理订单</a></li>
                                <li><a href="#" onclick="selectClick(1,this)">已完成订单</a></li>
                                <li><a href="#" onclick="selectClick(-1,this)">已取消订单</a></li>
                            </ul>
                        </div>
                    </div>
                    <div style="display: none;">
                        <asp:Button ID="btnQuery" class="btn btn-sm btn-primary" runat="server" Text="查询" OnClick="rblOrderStatus_SelectedIndexChanged" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="alert alert-success alert-dismissable" style="text-align: left; display: none;" id="message-model">
                                修改成功!
                            </div>
                            <div class="box-body table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>用户ID</th>
                                            <th>金额(元)</th>
                                            <th>金币</th>
                                            <th>时间</th>
                                            <th>类型</th>
                                            <th>处理者帐号</th>
                                            <th>处理时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="reptDataPager" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("UserId") %></td>
                                                    <td><%#FormatMoney(Eval("PayAmount")) %></td>
                                                    <td><%#FormatMoney(Eval("GameAmount")) %></td>
                                                    <td><%#Eval("OrderTime") %></td>
                                                    <td><%#Eval("OrderType").ToString() == "200" ? "充值" : "兑奖" %></td>
                                                    <td><%#Eval("HandlerUserAccount")%></td>
                                                    <td><%#Eval("HandlerTime")%></td>
                                                    <td>
                                                        <a class="btn btn-primary" style="display: <%# Eval("OrderStatus").ToString() == "0" ? "inline" : "none"%>" data-toggle="modal" onclick="showModelClick('<%# Eval("OrderNo")%>',<%# Eval("OrderId")%>, <%# Eval("UserId")%>, <%# Eval("PayAmount")%>, <%# Eval("GameAmount")%>, <%# Eval("OrderType")%>)" data-target="#game-modal"><i class="fa fa-pencil"></i>&nbsp;<%#Eval("OrderType").ToString() == "200" ? "充值" : "兑奖" %></a>
                                                        <a class="btn btn-primary" style="display: <%# Eval("OrderStatus").ToString() == "0" ? "inline" : "none"%>" data-toggle="modal" onclick="showModelClick('<%# Eval("OrderNo")%>',<%# Eval("OrderId")%>, <%# Eval("UserId")%>, <%# Eval("PayAmount")%>, <%# Eval("GameAmount")%>, <%# Eval("OrderType")%>)" data-target="#game-cancel-modal"><i class="fa fa-times"></i>&nbsp;取消</a>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>用户ID</th>
                                            <th>金额(元)</th>
                                            <th>金币</th>
                                            <th>时间</th>
                                            <th>类型</th>
                                            <th>处理者帐号</th>
                                            <th>处理时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%"></webdiyer:AspNetPager>
                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </form>
        </section>
        <!-- /.content -->
    </aside>

    <div class="modal fade" id="game-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" id="butclose" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-edit"></i>订单管理</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>用户ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="ControlOrderNo">201509160649357911</td>
                                    <td id="ControlUserId">4912</td>

                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-bordered">
                            <thead>
                                <tr>

                                    <th>实际金额(元)</th>
                                    <th>游戏金币</th>
                                    <th>订单类型</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="ControlPayAmount">100</td>
                                    <td id="ControlGameAmount">1000000</td>
                                    <td id="ControlOrderType">充值</td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="hidden" id="ControlOrderId" />
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">交易密码:</span>
                            <input name="password" id="password" type="password" class="form-control" placeholder="" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer clearfix">
                    <button type="button" class="btn btn-danger pull-right" onclick="SubmitOrder()" id="btnSubmitGameControl" data-placement="top"><i class="fa fa-edit"></i>确认提交</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="game-cancel-modal" tabindex="-2" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" id="butclose1" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-edit"></i>订单管理</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>用户ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="Td1"></td>
                                    <td id="Td2"></td>

                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>实际金额(元)</th>
                                    <th>游戏金币</th>
                                    <th>订单类型</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="Td3"></td>
                                    <td id="Td4"></td>
                                    <td id="Td5"></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="hidden" id="Hidden1" />
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">原因:</span>
                            <select id="remark" class="form-control">
                                <option value="客户充值金额输入错误">客户充值金额输入错误</option>
                                <option value="客户不想充值了">客户不想充值了</option>
                                <option value="我们提交的转账方式客户没有">我们提交的转账方式客户没有</option>
                                <option value="客户不想提现了">客户不想提现了</option>
                                <option value="客户提现数量输入错误">客户提现数量输入错误</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer clearfix">
                <button type="button" class="btn btn-danger pull-right" onclick="CancelOrder()" id="Button1" data-placement="top"><i class="fa fa-warning"></i>确认提交</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.right-side -->
    <script type="text/ecmascript">
        $(function () {
            var orderStatus = $("#<%=this.hiddenQueryType.ClientID %>").val();
            //if (orderStatus == "0") {
            $("#example1 tr").each(function (k, v) {
                $(v).children().each(function (k1, td) {
                    if (orderStatus == "0") {
                        if ($(td).index() == 5 || $(td).index() == 6) {
                            $(td).hide();
                        }
                    } else {
                        if ($(td).index() == 7) {
                            $(td).hide();
                        }
                    }
                });
            });
            //}
        });

        function selectClick(value, e) {
            $("#<%=searchText.ClientID %>").text($(e).text());
            $("#<%=hiddenQueryType.ClientID %>").val(value);
            document.getElementById("<%=btnQuery.ClientID %>").click();
        }


        function showModelClick(orderNo, orderId, userId, payAmount, gameAmount, orderType) {
            $("#ControlOrderNo").text(orderNo);
            $("#ControlOrderId").val(orderId);
            $("#ControlUserId").text(userId);
            $("#ControlPayAmount").text(payAmount);
            $("#ControlGameAmount").text(gameAmount);
            $("#ControlOrderType").text(orderType == "200" ? "充值" : "兑奖");

            $("#Td1").text(orderNo);
            $("#Hidden1").val(orderId);
            $("#Td2").text(userId);
            $("#Td3").text(payAmount);
            $("#Td4").text(gameAmount);
            $("#Td5").text(orderType == "200" ? "充值" : "兑奖");
            $('#password').val("");
            $("#remark").val("客户充值金额输入错误");
        }

        function SubmitOrder() {
            var cValue = $('#password').val();
            if (cValue.length == 0 || cValue == '') {
                alert("交易密码不能为空!");
                $('#password').focus();
                return false;
            } else {
                document.getElementById("butclose").click();
                $.ajax({
                    url: "/ProxyHandler/Member.ashx?rd=" + Math.random(),
                    data:
                    {
                        action: "ordermgr",
                        orderid: $("#ControlOrderId").val(),
                        bankpass: cValue
                    },
                    type: "POST",
                    async: false,
                    cache: false,
                    success: function (data) {
                        switch (data) {
                            case "-1":
                                {
                                    alert("交易密码错误!");
                                } break;
                            case "0":
                                {
                                    alert("订单处理完成!");
                                    setTimeout('refresh()', 500);
                                }
                                break;
                            case "3":
                                {
                                    if (oType == 200) {
                                        alert("您的金币余额不足，请联系上级代理充值后继续！");
                                    } else {
                                        alert("玩家银行余额不足!");
                                    }
                                } break;
                            default:
                                {
                                    if (data.indexOf("转账") > -1) {
                                        alert(data);
                                    } else {
                                        alert('请求失败,请稍后重试！');
                                    }
                                } break;
                        }
                    },
                    error: function () {
                        alert("订单处理失败，请稍后重试！");
                    }
                });
            }
        }


        function CancelOrder() {
            var cValue = $('#remark').val();
            if (cValue.length == 0 || cValue == '') {
                $('#remark').focus();
                alert("请输入取消原因！");
                return false;
            } else {
                document.getElementById("butclose1").click();
                $.ajax({
                    url: "/ProxyHandler/Member.ashx?rd=" + Math.random(),
                    data:
                    {
                        action: "ordercancel",
                        orderid: $("#Hidden1").val(),
                        remark: cValue
                    },
                    type: "POST",
                    async: false,
                    cache: false,
                    success: function (data) {
                        if (data == "0") {
                            alert("订单处理完成！");
                            setTimeout('refresh()', 500);
                        } else {
                            alert("订单处理失败，请稍后重试！");
                        }
                    },
                    error: function () {
                        alert("订单处理失败，请稍后重试！");
                    }
                });
            }
        }

        function refresh() {
            window.location.reload();
        }


    </script>
</asp:Content>
