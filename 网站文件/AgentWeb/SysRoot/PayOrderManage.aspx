<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayOrderManage.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.PayOrderManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <link href="/css/ui-dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/js/dialog-min.js"></script>
    <script type="text/javascript" src="/js/dialog-plus-min.js"></script>
    <script src="/js/Common.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select1").uedSelect({
                width: 245
            });
            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&rblOrderStatus=" + $("input[type=radio]:checked").val();
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
                <li><a href="#">上分下分</a></li>
                <li><a href="/SysRoot/PayOrderManage.aspx">订单管理</a></li>
            </ul>
        </div>

        <div class="formbody">


            <div id="usual1" class="usual">

                <div class="itab">
                    <ul>
                        <li><a href="#tab1">订单管理</a></li>
                        <li><a href="#tab2" onclick="location.href='/SysRoot/UpDownScore.aspx#tab2'">会员上分下分</a></li>
                        <li><a href="#tab3" onclick="location.href='/SysRoot/ProxyUpScore.aspx#tab3'">代理上分下分</a></li>
                        <li style="display: <%=this.Proxy.belongsAgent == -1 ? "" : "none"%>"><a href="#tab4" onclick="location.href='/SysRoot/PayOrders.aspx#tab4'">充值提现历史</a></li>
                    </ul>
                </div>
                <div id="tab1" class="tabson">
                    <div class="tabson">
                        <ul class="seachform">
                            <li>
                                <label>订单状态</label></li>
                            <li>
                                <asp:RadioButtonList ID="rblOrderStatus" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblOrderStatus_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="0">未处理订单</asp:ListItem>
                                    <asp:ListItem Value="1">已完成订单</asp:ListItem>
                                    <asp:ListItem Value="-1">已取消订单</asp:ListItem>
                                </asp:RadioButtonList>
                            </li>

                        </ul>

                        <input type="hidden" id="hdOrderByType" runat="server" value="" />
                        <input type="hidden" id="hdOrderByField" runat="server" value="" />
                        <table class="tablelist" id="dataTable">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>订单号</th>
                                    <th>用户ID</th>
                                    <th>所属代理</th>
                                    <th><a href='javascript:OrderByClick("PayAmount","");' id="OrderByA_PayAmount" class="tablelink">实际金额(元)</a></th>
                                    <th><a href='javascript:OrderByClick("GameAmount","");' id="OrderByA_GameAmount" class="tablelink">游戏金币</a></th>
                                    <th><a href='javascript:OrderByClick("OrderTime","");' id="OrderByA_OrderTime" class="tablelink">下单时间</a></th>
                                    <th>备注</th>
                                    <th>订单状态</th>
                                    <th>订单类型</th>
                                    <th>处理者帐号</th>
                                    <th><a href='javascript:OrderByClick("HandlerTime","");' id="OrderByA_HandlerTime" class="tablelink">处理时间</a></th>
                                    <th colspan="2">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="reptDataPager" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("RowIndex")%></td>
                                            <td><%#Eval("OrderNo")%></td>
                                            <td><%#Eval("UserId")%></td>
                                            <td><%#GetBelongName(Convert.ToInt16(Eval("UserId")))%></td>
                                            <td><%#FormatMoney(Eval("PayAmount"))%></td>
                                            <td><%#FormatMoney(Eval("GameAmount"))%></td>
                                            <td><%#Eval("OrderTime")%></td>
                                            <td><%# Eval("OrderStatus").ToString() == "-1" ? Eval("CancelRemark") : Eval("SubmitRemark")%></td>
                                            <td><%# GetOrderStatus(Eval("OrderStatus").ToString())%></td>
                                            <td><%#Eval("OrderType").ToString() == "200" ? "充值" : "兑奖"%></td>
                                            <td><%#Eval("HandlerUserAccount")%></td>
                                            <td><%#Eval("HandlerTime")%></td>
                                            <td>
                                                <input type="button" style="display: <%# Eval("OrderStatus").ToString() == "0" ? "block" : "none"%>" class="seachform scbtn" onclick="OrderMgr(<%#Eval("UserId")%>,<%#Eval("OrderId")%>,'<%#Eval("OrderNo")%>    ',<%#Eval("OrderType")%>,<%# Eval("PayAmount")%>,<%# Eval("GameAmount")%>)" value="<%#Eval("OrderType").ToString() == "200" ? "充值" : "提现"%>"></input></td>
                                            <td>
                                                <input type="button" style="display: <%# Eval("OrderStatus").ToString() == "0" ? "block" : "none"%>" class="seachform scbtn" onclick="OrderCancel(<%#Eval("OrderId")%>)" value="取消订单"></input></td>
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
            </div>
        </div>
        <ul class="seachform" id="searchform" style="display: none">
            <li>
                <label>取消原因</label></li>
            <li>
                <div class="vocation">
                    <select id="remark" class="select1">
                        <option value="客户充值金额输入错误">客户充值金额输入错误</option>
                        <option value="客户不想充值了">客户不想充值了</option>
                        <option value="我们提交的转账方式客户没有">我们提交的转账方式客户没有</option>
                        <option value="客户不想提现了">客户不想提现了</option>
                        <option value="客户提现数量输入错误">客户提现数量输入错误</option>
                        <option value="客户重复提交订单">客户重复提交订单</option>
                    </select>
                </div>
            </li>
        </ul>
        <script type="text/javascript">
            $(function(){
                var orderStatus="<%=this.rblOrderStatus.SelectedValue %>";
                if(orderStatus=="0")
                {
                    $("#dataTable tr").each(function(k,v){
                        $(v).children().each(function(k1,td){
                            if($(td).index()==10 || $(td).index()==11)
                            {
                                $(td).hide();
                            }
                        });
                    });
                }
            });

            $("#usual1 ul").idTabs("tab1");

            $('.tablelist tbody tr:odd').addClass('odd');

            function OrderMgr(uid, orderId, orderNo, oType, payAmount, gameAmount) {
                var d = dialog({
                    title: '订单管理',
                    content: '<table class="tablelist">' +
                        '<thead><tr><th>订单号</th><th>用户ID</th><th>实际金额(元)</th><th>游戏金币</th><th>订单类型</th></tr></thead>' +
                        '<tbody>' +
                        '<td>' + orderNo + '</td><td>' + uid + '</td><td>' + payAmount + '</td><td>' + gameAmount + '</td><td>' + (oType == "200" ? "充值" : "提现") + '</td>' +
                        '</tbody>' +
                        '</table>' +
                        '<div class="tabson"><label>请输入交易密码：<input id="property-BankPassword" type="password" autofocus value="" class="scinput"/></label></div>',
                    okValue: '确定',
                    ok: function() {
                        var cValue = $('#property-BankPassword').val();
                        if (cValue.length == 0 || cValue == '') {
                            $('#property-BankPassword').focus();
                            return false;
                        } else {
                            $.ajax({
                                url: "/ProxyHandler/Member.ashx?rd=" + Math.random(),
                                data:
                                {
                                    action: "ordermgr",
                                    orderid: orderId,
                                    bankpass: cValue
                                },
                                type: "POST",
                                async: false,
                                cache: false,
                                success: function(data) {
                                    switch (data) {
                                        case "-1":
                                            {
                                                alert("交易密码错误");
                                            }break;
                                        case "0":
                                            {
                                                alert("订单处理完成！");
                                                setTimeout(function() {
                                                    d.close().remove();
                                                }, 3000);
                                                window.location.reload();
                                            }
                                            break;
                                        case "3":
                                            {
                                                if (oType == 200) {
                                                    alert("您的金币余额不足，请联系上级代理充值后继续！");
                                                } else {
                                                    alert("玩家银行余额不足！");
                                                }
                                            }break;
                                        default:
                                            {
                                                if(data.indexOf("转账")>-1)
                                                {
                                                    alert(data);
                                                }else{
                                                    alert('请求失败,请稍后重试！');
                                                }
                                            }break;
                                    }
                                },
                                error: function() {
                                }
                            });
                        }
                    }
                });
                d.showModal();
            }

            var cancalSelect = $("#searchform");
            function OrderCancel(orderId) {
                var d = dialog({
                    title: '取消订单',
                    content: cancalSelect,
                    okValue: '确定',
                    ok: function() {
                        var cValue = $('#remark').val();
                        if (cValue.length == 0 || cValue == '') {
                            $('#remark').focus();
                            return false;
                        } else {
                            $.ajax({
                                url: "/ProxyHandler/Member.ashx?rd=" + Math.random(),
                                data:
                                {
                                    action: "ordercancel",
                                    orderid: orderId,
                                    remark: cValue
                                },
                                type: "POST",
                                async: false,
                                cache: false,
                                success: function(data) {
                                    if (data == "0") {
                                        alert("订单处理完成！");
                                    } else {
                                        alert("订单处理失败，请稍后重试！");
                                    }
                                    setTimeout(function() {
                                        d.close().remove();
                                    }, 3000);
                                    window.location.reload();
                                },
                                error: function() {
                                }
                            });
                        }
                    }
                });
                d.showModal();
            }
        </script>
    </form>
</body>
</html>
