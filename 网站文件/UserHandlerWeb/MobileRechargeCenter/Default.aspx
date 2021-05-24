<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserHandlerWeb.MobileRechargeCenter._Default" %>

<%@ Import Namespace="UserHandlerWeb.MobileRechargeCenter" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>充值中心</title>
    <link href="/style/base.css" rel="stylesheet" />
    <link href="/style/public-blue.css" rel="stylesheet" />
    <%--黄金版：<link href="/style/public-golden.css" rel="stylesheet" />--%>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <link href="/plugin/sweetalert/sweetalert.css" rel="stylesheet" />
    <script src="/plugin/sweetalert/sweetalert.min.js"></script>
    <script src="/js/dateformat.js"></script>
</head>
<body>
    <section class="Recharge">
        <ul class="tab_menu clearfix">
            <li data-id="1" data-name="recharge" class="cur">我要充值</li>
            <li data-id="2" data-name="rechargelist">充值记录</li>
            <li data-id="3" data-name="exchange">我要兑奖</li>
            <li data-id="4" data-name="exchangelist">兑奖记录</li>
            <li data-id="5" data-name="gifting">赠 送</li>
            <li data-id="6" data-name="giftinglist">赠送记录</li>
        </ul>
        <div class="tab_box">
            <div data-name="recharge">
                <div class="DivBg p10">
                    <ul class="rechMode clearfix">
                        <li class="fb">选择充值方式：</li>
                        <li>
                            <input id="R01" checked="true" name="rechMode" type="radio" value="1" /><label for="R01">订单充值</label></li>
                        <li style="<%= string.IsNullOrWhiteSpace(rechageType) ? "display:none": ""%>">
                            <input id="R02" name="rechMode" type="radio" value="2" /><label for="R02">在线充值</label></li>
                        <li>
                            <input id="R03" name="rechMode" type="radio" value="3" /><label for="R03">点卡充值</label></li>
                    </ul>
                    <div class="mt10" data-name="订单充值" id="tbOrder1">
                        <table border="0" cellpadding="0" cellspacing="0" class="table01" width="100%">
                            <colgroup>
                            <col width="40%" />
                            <col />
                        </colgroup>
                            <tr>
                                <th scope="row" height="50px;" >充值金额：</th>
                                <td>
                                    <input id="txtOrderAmount" class="com_input h_inp w100" name="receiveId1"  type="number" value=""   />&nbsp;元
                                    <span class="red pl10">最小充值:<span id="minAmountSpan1" runat="server" class="spanWarning">10</span>元</span></td>
                            </tr>
                            <tr>
                                <th scope="row" valign="top">备注：</th>
                                <td>
                                    <textarea id="txtRemark" class="com_input w200" cols="20" name="remark" rows="3" maxlength="30"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">&nbsp;</th>
                                <td>
                                    <br />
                                    <input id="btnOrderSubmit" class="button11 cp" type="button" value="提 交" /></td>
                            </tr>
                        </table>
                    </div>
                    <form id="frmMain" method="post" name="frmMain">
                        <div class="mt10 none" data-name="在线充值" id="tbOrder2" style="<%= string.IsNullOrWhiteSpace(rechageType) ? "display:none": ""%>">
                            <table border="0" cellpadding="0" cellspacing="0" class="table01" width="100%">
                                <colgroup>
                                    <col width="40%" />
                                    <col />
                                </colgroup>
                                <tr>
                                    <th scope="row" valign="top">账号：</th>
                                    <td>
                                        <input id="UserName" class="com_input h_inp w200" name="UserName" size="20" type="text" value="<%= UserName %>" readonly="readonly" /><br />
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" valign="top">充值金额(RMB)：</th>
                                    <td>
                                        <input id="rechargeMoney" class="com_input h_inp w200" name="rechargeMoney" size="20" type="number" value=""    />&nbsp;元
                                        <span class="red pl10">最小充值:<span id="minAmountSpan" runat="server" class="spanWarning">10</span>元</span></td>
                                </tr>
                                <tr>
                                    <th scope="row" valign="top">充值方式：</th>
                                    <td>
                                        <ul>
                                            <li <%=rechageType.IndexOf("0")>-1?"":"style='display:none;'" %>>
                                                <input type="radio" value="UNIONPAY" name="payType" id="upop" runat="server" />
                                                <label title="银联在线支付" for="upop">银联在线支付</label>
                                            </li>
                                            <li <%=rechageType.IndexOf("1")>-1?"":"style='display:none;'" %>>
                                                <input type="radio" id="alipay" name="payType" value="ALIPAY" runat="server" />
                                                <label for="alipay" title="支付宝">支付宝</label>
                                            </li>
                                            <li <%=rechageType.IndexOf("2")>-1?"":"style='display:none;'" %>>
                                                <input type="radio" id="shengpay" name="payType" value="WECHATQR" runat="server" />
                                                <label for="shengpay" title="微信支付">微信支付</label>
                                            </li>
                                            <li <%=rechageType.IndexOf("3")>-1?"":"style='display:none;'" %>>
                                                <input type="radio" id="YBPay" name="payType" value="YB" runat="server" />
                                                <label for="shengpay" title="易宝支付">易宝支付</label>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td height="80">
                                        <input id="btnOnlinePaySubmit" class="button11 cp" type="button" value="提交" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="mt10 none" data-name="点卡充值" id="tbOrder3">
                            <table border="0" cellpadding="0" cellspacing="0" class="table01" width="100%">
                                <colgroup>
                                    <col width="40%" />
                                    <col />
                                </colgroup>
                                <tr>
                                    <th scope="row" valign="top">账号：</th>
                                    <td>
                                        <%= UserName %><br />
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" valign="top">卡号：</th>
                                    <td>
                                        <input id="CardNo" class="com_input h_inp w200" name="CardNo" size="20" type="text" value="" /><br />
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" valign="top">密码：</th>
                                    <td>
                                        <input id="CardPass" class="com_input h_inp w200" name="CardPass" size="20" type="text" value="" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td height="80">
                                        <input id="btnCardSubmit" class="button11 cp" type="button" value="提交" /></td>
                                </tr>
                            </table>
                        </div>
                    </form>

                </div>
            </div>
            <div class="none" data-name="rechargelist">
                <div class="DivBg">
                    <div class="mt10">
                        <table border="0" cellpadding="0" cellspacing="0" class="table02" width="100%" data-name="rechargelist">
                            <colgroup>
                                <col width="10%" />
                                <col width="20%" />
                                <col width="10%" />
                                <col width="20%" />
                                <col width="15%" />
                                <col width="15%" />
                            </colgroup>
                            <tr class="tr01">
                                <th scope="col">序号</th>
                                <th scope="col">申请单号</th>
                                <th scope="col">人民币</th>
                                <th scope="col">备注</th>
                                <th scope="col">状态</th>
                                <th scope="col">操作</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="none" data-name="exchange">
                <div class="DivBg">
                    <table border="0" cellpadding="0" cellspacing="0" class="table01" width="100%">
                        <colgroup>
                            <col width="40%" />
                            <col />
                        </colgroup>
                        <tr>
                            <td align="center" colspan="2" height="50" scope="row"><span style="padding-right: 40px;">保险柜余额：<label id="lbExchangeInsureScore"></label>元</span> <span>待兑奖：<label id="lbExchangeAmount"></label>
                            </span></td>
                        </tr>
                        <tr>
                            <th height="40" scope="row">兑奖金额(RMB)：</th>
                            <td>
                                <input id="txtExPayAmount" class="com_input h_inp w120" name="receiveId5"  type="number" value=""    />&nbsp;元
                                <span class="red pl10">最小提现:<span id="minAmountSpan2" runat="server" class="spanWarning">10</span>元</span></td>

                            </td>
                        </tr>
                        <tr>
                            <th height="50" scope="row">交易密码：</th>
                            <td>
                                <input id="txtExPass" class="com_input h_inp w200" name="receiveId" type="password" value="" /></td>
                        </tr>
                        <tr>
                            <th scope="row" valign="top">备注：</th>
                            <td>
                                <textarea id="txtExRemark" class="com_input w200" cols="20" name="txtExRemark" rows="3"  maxlength="30"></textarea></td>
                        </tr>
                        <tr>
                            <th scope="row">&nbsp;</th>
                            <td>
                                <input id="btnExchange" class="button11 cp" type="button" value="申请兑奖" /></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="none" data-name="exchangelist">
                <div class="DivBg">
                    <div class="mt10">
                        <table border="0" cellpadding="0" cellspacing="0" class="table02" width="100%" data-name="exchangelist">
                            <colgroup>
                                <col width="10%" />
                                <col width="30%" />
                                <col width="10%" />
                                <col width="20%" />
                                <col width="10%" />
                                <col width="20%" />
                            </colgroup>
                            <tr contextmenu="title" class="tr01">
                                <th scope="col">序号</th>
                                <th scope="col">申请单号</th>
                                <th scope="col">人民币</th>
                                <th scope="col">备注</th>
                                <th scope="col">状态</th>
                                <th scope="col">操作</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="none" data-name="gifting">
                <div class="DivBg">
                    <table border="0" cellpadding="0" cellspacing="0" class="table01" width="100%">
                        <colgroup>
                            <col width="40%" />
                            <col />
                        </colgroup>
                        <tr>
                            <td align="center" colspan="2" height="50" scope="row"><span style="padding-right: 40px;">保险柜余额：<label id="lbInsureScore"></label>金币</span>&nbsp; <span class="red pl10">最小赠送:<span id="minAmountSpan3" runat="server" class="spanWarning">10</span>金币</span></td>
                        </tr>
                        <tr>
                            <th height="40" scope="row">收款账号：</th>
                            <td>
                                <input id="txtReciveAccount" class="com_input h_inp w200" name="txtGiftAmount0" size="20" type="text" value="" /></td>
                        </tr>
                        <tr>
                            <th height="40" scope="row">赠送金额(金币)：</th>
                            <td class="f12 inp_tip">
                                <input id="txtGiftAmount" class="com_input h_inp w150" name="txtGiftAmount"  type="number" value=""    />
                                <%= RevenueRateTransfer==0?"":(RevenueRateTransfer.ToString()+"‰的手续费") %>
                            </td>
                        </tr>
                        <tr>
                            <th height="50" scope="row">交易密码：</th>
                            <td>
                                <input id="txtGiftPass" class="com_input h_inp w200" name="txtGiftPass" type="password" value="" /></td>
                        </tr>
                        <tr>
                            <th scope="row">&nbsp;</th>
                            <td>
                                <input id="btnGiftSubmit" class="button11 cp" type="button" value="赠 送" /></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="none" data-name="giftinglist">
                <div class="DivBg">
                    <div class="mt10">
                        <table border="0" cellpadding="0" cellspacing="0" class="table02" width="100%" data-name="giftinglist">
                            <colgroup>
                                <col width="10%" />
                                <col width="20" />
                                <col width="25%" />
                                <col width="20%" />
                                <col width="25%" />
                            </colgroup>
                            <tr contextmenu="title" class="tr01">
                                <th scope="col">序号</th>
                                <th scope="col">收款账号</th>
                                <th scope="col">赠送金币</th>
                                <th scope="col">交易费</th>
                                <th scope="col">时间</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </section>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        var tabs = "<%= Tabs%>";
        //主导航切换
        $("ul[class='tab_menu clearfix'] >li").each(function () {
            if (tabs.indexOf($(this).attr("data-id")) == -1) {
                var dataname = $(this).attr("data-name");
                $("div.tab_box > div[data-name='" + dataname + "']").remove();
                $(this).remove();
            }
        });

        //主导航切换
        $("ul[class='tab_menu clearfix'] >li").click(function () {
            loadNavTabContent(this);
        });

        function loadNavTabContent(obj) {
            $(obj).parent().children("li").removeClass("cur");
            $(obj).attr("class", "cur");
            var dataname = $(obj).attr("data-name");
            $("div.tab_box > div[data-name]").attr("class", "none");
            $("div.tab_box > div[data-name='" + dataname + "']").attr("class", "");

            if ($(obj).attr("data-name") == "exchange") {
                var orderType = 201;
                getExchageAmount(orderType);
            }
            if ($(obj).attr("data-name") == "gifting") {
                getExchageAmount(orderType);
            }
            //订单列表
            var table;
            if ($(obj).attr("data-name") == "rechargelist") {
                table = $("table[data-name='rechargelist']");
                rechargeList(200, table);
                return;
            }
            //兑换列表
            if ($(obj).attr("data-name") == "exchangelist") {
                table = $("table[data-name='exchangelist']");
                rechargeList(201, table);
                return;
            }
            //赠送列表
            if ($(obj).attr("data-name") == "giftinglist") {
                table = $("table[data-name='giftinglist']");
                giftingList(table);
                return;
            }
        }

        //支付方式内容选择
        $("input[name='rechMode']").bind("click", function () {
            $(this).attr("checked", "checked");
            var checkMode = $(this).val();
            $("div[id^='tbOrder'][id!='tbOrder" + checkMode + "']").attr("class", "mt10 none");
            $("div[id='tbOrder" + checkMode + "']").attr("class", "mt10");
        });

        $("#btnCardSubmit").bind("click", orderSubmit);
        $("#btnOnlinePaySubmit").bind("click", orderSubmit);
    });

    //订单充值
    $("#btnOrderSubmit").click(function () {

        var amount = $("#txtOrderAmount").val();
        var password = $("#txtOrderPayPass").val();
        var minAmount = $("#minAmountSpan").text() == "" ? 10 : parseInt($("#minAmountSpan").text());
        var remark = $("#txtRemark").val();
        var isNumberic = true;
        var reg = /^[1-9]\d{0,6}$/;
        if (!reg.test(amount)) {
            alert(12 + "   amount;" + amount);
            isNumberic = false;
        }
        if (amount < minAmount || amount > 1000000) {
            isNumberic = false;
        }

        if (!isNumberic) {
            sweetAlert("每笔充值金额请在" + minAmount + "-1000,000之间！");
            $("#txtOrderAmount").val("");
            $("#txtOrderAmount").focus();
            return false;
        }

        var regRemark = /[0-9a-zA-Z\u4e00-\u9fa5]{0,20}/;
        if (!regRemark.test(remark)) {
            sweetAlert("备注只能由中文、字母或者数字组成！");
            return false;
        }


        $("#btnOrderSubmit").val("提交中.....");
        $("#btnOrderSubmit").enabled = false;
        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "recharge",
                userid: "<%= UserId%>",
                token: "<%= Token%>",
                payAmount: amount,
                submitRemark: remark,
                password: password,
                orderType: 200
            },
            type: "GET",
            //async: false,
            cache: false,
            success: function (data) {
                var result = eval("(" + data + ")");
                if (result.Code == 0) {
                    sweetAlert(result.Msg);
                    $("#txtOrderAmount").val("");
                    $("#txtOrderPayPass").val("");
                    $("#txtRemark").val("");
                } else {
                    sweetAlert(result.Msg);
                    $('#txtOrderPayPass').focus();
                }
            },
            complete: function () {
                $("#btnOrderSubmit").enabled = true;
                $("#btnOrderSubmit").val("提交");
            }
        });

    });

    //在线充值提交
    function orderSubmit() {

        var rechargeMode = $("input[name='rechMode']:checked").val();

        rechargeMode = isNaN(rechargeMode) ? "1" : rechargeMode;
        console.log(rechargeMode);
        var minAmount = $("#minAmountSpan").text() == "" ? 10 : parseInt($("#minAmountSpan").text());
        switch (rechargeMode) {
            case "2":
                {
                    var isNumberic = true;
                    var amount = $("#rechargeMoney").val();
                    var reg = /^[1-9]\d{0,6}$/;
                    if (!reg.test(amount)) {
                        isNumberic = false;
                    }
                    if (!reg.test(amount)) {
                        isNumberic = false;
                    }
                    if (amount < minAmount || amount > 1000000) {
                        isNumberic = false;
                    }
                    if (!isNumberic) {
                        sweetAlert("单笔充值金额请在" + minAmount + "-1000,000之间！");
                        $("#rechargeMoney").val("");
                        $("#rechargeMoney").focus();
                        return false;
                    }

                    $("#frmMain").attr("action", "<%="/MobileRechargeCenter/PayConfirm.aspx?rurl=" + DimoNetwork.Common.DEncrypt.TextEncrypt.Base64Encode(this.Request.Url.PathAndQuery)%>");
                }
                break;
            case "3":
                {
                    $("#frmMain").attr("action", "<%="/MobileRechargeCenter/PayCardFillByPC.aspx?rurl=" + DimoNetwork.Common.DEncrypt.TextEncrypt.Base64Encode(this.Request.Url.PathAndQuery)%>");
                }
                break;
            default:
                {
                    $("#frmMain").attr("action", "");
                }
        }
        $("#frmMain").submit();
    }

    //获取充值\提现记录
    function rechargeList(oType, objTable) {
        var rechargeDate = new Date();
        var pageIndex = 1;
        var pageSize = 10;

        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "getrecharge",
                userid: "<%= UserId%>",
                token: "<%= Token%>",
                orderType: oType,
                date: rechargeDate,
                currentPageIndex: pageIndex,
                pageSize: pageSize
            },
            type: "GET",
            //async: false,
            cache: false,
            success: function (data) {
                var result = $.parseJSON(data);
                if (result.Code == 0) {
                    if (result.Data != null) {
                        parseHtml(result.Data, objTable);
                    }
                } else {
                    sweetAlert(result.Msg);
                    result = false;
                }
            }
        });
    }

    //兑奖提交
     $("#btnExchange").click(function () {
        var amount = $("#txtExPayAmount").val();
        var remark = $("#txtExRemark").val();
        var password = $("#txtExPass").val();

        var isNumberic = true;
        var minAmount = $("#minAmountSpan2").text() == "" ? 10 : parseInt($("#minAmountSpan2").text());
        var reg = /^[1-9]\d{0,6}$/;
        if (!reg.test(amount)) {
            isNumberic = false;
        }
        if (amount < minAmount || amount > 10000000) {
            isNumberic = false;
        }
        if (!isNumberic) {
            sweetAlert("单笔兑奖金额请在" + minAmount + "-1000,000之间！");
            $("#txtExPayAmount").val("");
            $("#txtExPayAmount").focus();
            return false;
        }

        if (password == "" || password == undefined)
        {
            sweetAlert("交易密码不能为空。");
            return;
        }

        $("#btnExchange").val("提交中.....");
        $("#btnExchange").enabled = false;
        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "recharge",
                userid: "<%= UserId%>",
                token: "<%= Token%>",
                payAmount: amount,
                submitRemark: remark,
                password: password,
                orderType: 201
            },
            type: "GET",
            //async: false,
            cache: false,
            success: function (data) {
                var result = eval("(" + data + ")");
                if (result.Code == 0) {
                    sweetAlert(result.Msg);
                    $("#txtExPayAmount").val("");
                    $("#txtExRemark").val("");
                    $("#txtExPass").val("");
                } else {
                    sweetAlert(result.Msg);
                    $('#txtExPass').focus();
                }
            },
            complete: function () {
                $("ul.tab_menu.clearfix>li.cur").trigger("click");
                $("#btnExchange").enabled = true;
                $("#btnExchange").val("申请兑奖");
            }
        });
     });

    //getExchageAmount
    function getExchageAmount(oType) {
        if (isNaN(oType)) oType = 201;
        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "getExchageAmount",
                userid: "<%= UserId%>",
                token: "<%= Token%>",
                orderType: oType
            },
            type: "GET",
            //async: false,
            cache: false,
            success: function (data) {
                var result = $.parseJSON(data);
                if (result.Code == 0) {
                    if (result.Data != null) {
                        $("#lbExchangeAmount").text(result.Data);
                        $("#lbExchangeInsureScore").text(parseFloat(result.insureScore) / parseFloat(result.rate));
                        $("#lbInsureScore").text(result.insureScore);
                    }
                } else {
                    sweetAlert(result.Msg);
                    result = false;
                }
            }
        });
    }
    //获取状态名称
    function getStatusName(statusCode) {
        var statusName = "待处理";
        switch (statusCode) {
            case -1:
                {
                    statusName = "已撤销";
                }
                break;
            case 0:
                {
                    statusName = "待处理";
                }
                break;
            case 1:
                {
                    statusName = "成功";
                }
                break;
            case 2:
                {
                    statusName = "成功";
                }
                break;
        }
        return statusName;
    }

    //获取赠送记录
    function giftingList(objTable) {
        var pageIndex = 1;
        var pageSize = 10;

        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "getgift",
                userid: "<%= UserId%>",
            token: "<%= Token%>",
                tradeType: 4,
                currentPageIndex: pageIndex,
                pageSize: pageSize

            },
            type: "GET",
            cache: false,
            success: function (data) {
                var result = $.parseJSON(data);
                if (result.Code == 0) {
                    if (result.Data != null) {
                        parseGiftHtml(result.Data, objTable);
                    }
                } else {
                    sweetAlert(result.Msg);
                    result = false;
                }
            }
        });
    }

    var htmGiftListHeader = "<colgroup><col width=\"10%\" /><col width=\"20%\" /><col width=\"30%\" /><col width=\"20%\" /><col width=\"15%\" /></colgroup>" +
    "<tr contextmenu=\"title\" class=\"tr01\"><th scope=\"col\">序号</th><th scope=\"col\">收款账号</th><th scope=\"col\">赠送金币</th><th scope=\"col\">交易费</th><th scope=\"col\">时间</th></tr>";

    var tmplGiftListInitHtml = "<tr data-show=\"true\"><td>$SeqNo</td><td>$DescAccount</td><td>$Amount</td><td>$Revenue</td><td>$Time</td></tr>";

    function parseGiftHtml(jsonData, objDataBind) {
        var htmlList = "";
        var tempHtml = "";
        $(objDataBind).children("tr[data-show=\"true\"]").remove();

        $.each(jsonData, function (index, item) {
            var datetime = item.CollectDate;//.Format("yyyy-MM-dd HH:mm:ss");
            tempHtml = tmplGiftListInitHtml.replace("$SeqNo", (index + 1))
                .replace("$DescAccount", item.DestAccount).replace("$Amount", item.SwapScore)
                .replace("$Revenue", item.Revenue).replace("$Time", datetime);

            htmlList += tempHtml;
            tempHtml = tmplGiftListInitHtml;
        });
        $(objDataBind).html(htmGiftListHeader + htmlList);
    }

    

    var htmlHeader = "<colgroup><col width=\"10%\" /><col width=\"30%\" /><col width=\"10%\" /><col width=\"20%\" /><col width=\"10%\" /><col width=\"20%\" /></colgroup>" +
    "<tr contextmenu=\"title\" class=\"tr01\"><th scope=\"col\">序号</th><th scope=\"col\">申请单号</th><th scope=\"col\">人民币</th><th scope=\"col\">备注</th><th scope=\"col\">状态</th><th scope=\"col\">操作</th></tr>";

    var tmplInitHtml = "<tr data-show=\"true\"><td>$SeqNo</td><td>$OrderNo</td><td>$Amount</td><td>$Remark</td><td>$Status</td><td><a href=\"#\" data-id=\"$OrderNo\">$Cancel</a></td></tr>";

    function parseHtml(jsonData, objDataBind) {
        var htmlList = "";
        var tempHtml = "";
        $(objDataBind).children("tr[data-show=\"true\"]").remove();
        $.each(jsonData, function (index, item) {
            tempHtml = tmplInitHtml.replace("$SeqNo", (index + 1)).replace("$OrderNo", item.OrderNo).replace("$Amount", item.PayAmount).replace("$Remark", item.SubmitRemark).replace("$Status", getStatusName(item.OrderStatus));
            if (item.OrderStatus == 0) {
                tempHtml = tempHtml.replace("$Cancel", "撤销").replace("data-id=\"$OrderNo\"", "data-id=\"" + item.OrderId + "\"");
            } else {
                tempHtml = tempHtml.replace("$Cancel", "    ");
            }
            htmlList += tempHtml;
            tempHtml = tmplInitHtml;
        });
        $(objDataBind).html(htmlHeader + htmlList);
        //将click事件绑定到动态生成的HTML元素
        $("a[data-id]").on("click", function () {
            var orderNo = $(this).attr("data-id");
            rechargeCancel(orderNo);
        });
    }

    //取消订单
    function rechargeCancel(orderno) {
        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "ExchangeCancel",
                userid: "<%= UserId%>",
                token: "<%= Token%>",
                ApplyNumber: orderno,
                CancelReason: ""
            },
            type: "GET",
            //async: false,
            cache: false,
            success: function (data) {
                var result = eval("(" + data + ")");
                if (result.Code == 0) {
                    sweetAlert(result.Msg);
                } else {
                    sweetAlert(result.Msg);
                }
                //重新激发li的点击事件
                $("ul.tab_menu.clearfix>li.cur").trigger("click");
                return false;
            }
        });
    }



   

    $("#btnGiftSubmit").bind("click", function () {
        var amount = $("#txtGiftAmount").val();
        var password = $("#txtGiftPass").val();
        var reciveAccount = $("#txtReciveAccount").val();
        if (reciveAccount == "") {
            sweetAlert("请输入赠送账号！");
            $("#txtReciveAccount").focus();
            return false;
        }
        var isNumberic = true;
        var minAmount = $("#minAmountSpan3").text() == "" ? 10 : parseInt($("#minAmountSpan3").text());
        var reg = /^[1-9]\d{0,6}$/;
        if (!reg.test(amount)) {
            isNumberic = false;
        }
        if (amount < minAmount) {
            isNumberic = false;
        }
        if (amount > 1000000000) {
            isNumberic = false;
        }
        if (!isNumberic) {
            sweetAlert("单笔赠送金币请在" + minAmount + "-1000,000之间！");
            $("#txtGiftAmount").val("");
            $("#txtGiftAmount").focus();
            return false;
        }

        $("#btnGiftSubmit").val("提交中.....");
        $("#btnGiftSubmit").enabled = false;
        $.ajax({
            url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
            data:
            {
                platform: "<%= Platform%>",
                action: "gifting",
                userid: "<%= UserId%>",
                token: "<%= Token%>",
                payAmount: amount,
                targetAccount: reciveAccount,
                password: password,
                tradeType: 4
            },
            type: "GET",
            //async: false,
            cache: false,
            success: function (data) {
                var result = eval("(" + data + ")");
                if (result.Code == 0) {
                    var msg = "金币已赠送到收款账号的银行中！";
                    sweetAlert(msg);

                    $("#txtGiftAmount").val("");
                    $("#txtGiftPass").val("");
                    $("#txtReciveAccount").val("");
                } else {
                    sweetAlert(result.Msg);
                    $('#txtGiftPass').focus();
                }
            },
            complete: function () {
                $("ul.tab_menu.clearfix>li.cur").trigger("click");

                $("#btnGiftSubmit").enabled = true;
                $("#btnGiftSubmit").val("赠 送");
            }
        });
    });
</script>
