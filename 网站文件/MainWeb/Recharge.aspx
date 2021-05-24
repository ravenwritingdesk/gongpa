<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recharge.aspx.cs" Inherits="Game.FrontWeb.Recharge" %>

<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>
<%@ Register Src="~/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>


<!DOCTYPE HTML>
<html>
<uc1:SiteHead runat="server" ID="SiteHead" />

<script type="text/javascript">

    function UpdateImage() {
        document.getElementById("picVerifyCode").src = "/ValidateImage.aspx?r=" + Math.random();
    }


</script>
<body>
    <uc1:SiteMenu runat="server" ID="SiteMenu" />

    <div id="wrapper">

        <div class="Poster01 wrap"></div>
        <div class="wrap clearfix tl">
            <!-- leftMold-->
            <uc1:SiteLeft runat="server" ID="SiteLeft" />

            <!-- leftMold /-->

            <!-- rightMold-->
            <div class="rightMold fr">

                <div class="d2">
                    <div class="comRecharge comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-Recharge.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>

                            </dt>
                            <div class="body p30">
                                <div class="w">
                                    <div class="user_demoBox js_user_demoBox">
                                        <ul class="tab_menu clearfix" id="tabUl">
                                            <li class="cur" >在线充值</li>
                                            <li class="">自发卡充值</li>
                                            <%-- <li class="">一卡通充值</li>
                                            <li class="">手机卡充值</li>--%>
                                        </ul>
                                        <form method="post" id="form1" action="/PayConfirm.aspx">
                                            <div class="orange_box p20 f14 lh30" id="orange_box">
                                                <p>
                                                    <label for="UserName" class="cp mr5">充值用户</label><input type="text" runat="server" name="UserName" onfocus="usernameFocus()" id="UserName" class="com_input w150" value=""><span class="red pl10" id="accountWarn"></span>
                                                </p>
                                                <div id="rechargeMoneyDiv">
                                                    <p>
                                                        <label for="rechargeMoney" class="cp mr5">充值金额</label><input type="text" runat="server" name="rechargeMoney" id="rechargeMoney" class="com_input w150" value="" onkeyup="this.value=this.value.replace(/[^\d\.]/g,'')"><i class="pl5">元</i><span class="red pl10">充值最小金额：<span id="minAmountSpan" runat="server" class="spanWarning">10</span>元</span>
                                                    </p>
                                                </div>
                                                <div id="FillCardDiv" style="display: none">
                                                    <p>
                                                        <label for="CardNo" class="cp mr5">实卡卡号</label><input type="text" name="CardNo" id="CardNo" class="com_input w150" value="">
                                                    </p>
                                                    <p>
                                                        <label for="CardPass" class="cp mr5">实卡密码</label><input type="password" name="CardPass" id="CardPass" class="com_input w150" value="">
                                                    </p>
                                                </div>
                                                <p id="FillVerifyCode">
                                                    <label for="VerifyCode" class="cp mr5">验&nbsp;证&nbsp;码&nbsp;</label>
                                                    <input type="text" name="VerifyCode" id="VerifyCode" class="com_input w150" value="">
                                                    <img src="ValidateImage.aspx" name="picVerifyCode" id="picVerifyCode" onclick="UpdateImage()" style="cursor: pointer; border: 1px solid #333333; width: 70px; height: 24px;" title="点击更换验证码图片!" />
                                                </p>
                                            </div>
                                            <div class="tab_box w" id="contentDiv">
                                                <div date-name="网银充值" class="">
                                                    <div class="gray_box user_table_box user_bank p30">
                                                        <h5 class="step2 mt20">第三方支付平台</h5>
                                                        <ul class="threeport">
                                                            <li <%=rechageType.IndexOf("0")>-1?"":"style='display:none;'" %>>
                                                                <input type="radio" value="UNIONPAY" name="payType" id="upop" runat="server">
                                                                <label title="银联在线支付" for="upop"><span class="unionpay">银联在线支付</span></label>
                                                            </li>
                                                            <li <%=rechageType.IndexOf("1")>-1?"":"style='display:none;'" %>>
                                                                <input type="radio" id="alipay" name="payType" value="ALIPAY" runat="server">
                                                                <label for="alipay" title="支付宝"><span class="alipay">支付宝</span></label>
                                                            </li>
                                                            <li <%=rechageType.IndexOf("2")>-1?"":"style='display:none;'" %>>
                                                                <input type="radio" id="shengpay" name="payType" value="WECHATQR" runat="server">
                                                                <label for="shengpay" title="微信支付"><span class="shengpay">微信支付</span></label>
                                                            </li>
                                                            <li <%=rechageType.IndexOf("3")>-1?"":"style='display:none;'" %>>
                                                                <input type="radio" id="YBPay" name="payType" value="YB" runat="server">
                                                                <label for="shengpay" title="易宝支付"><span class="YBPay">易宝支付</span></label>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="none" date-name="点卡充值">
                                                </div>
                                            </div>
                                            <br />
                                            <div class="tc" >
                                                <input type="submit" value="确认提交" onclick="return Validate()" class="button03 cp p10 plr40" id="dosubmit">
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </dl>
                    </div>
                </div>
            </div>
            <!-- rightMold /-->

        </div>
    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />

    <script type="text/javascript" src="js/Bottom.js"></script>
    <script type="text/javascript">
        //$(function () { $('.js_user_demoBox').Tabs({ event: 'click' }); });
        $(function () {
            if ("<%=rechageType.Length %>" == "0" || "<%=rechageType.Trim() %>"=="" )
            {
                $("#tabUl").children().removeClass("cur").eq(1).addClass("cur");
                $("#form1").attr("action", "/PayCardFillByPC.aspx");
                $("#dosubmit").attr("onclick", "return Validate1()")
                $("#rechargeMoneyDiv").hide();
                $("#FillCardDiv").show();
                $("#contentDiv").children().eq(0).attr("style", "display:none;")
            }
            $("#tabUl").children().each(function (k, v) {
                $(v).click(function () {
                    if (k == 0) {
                        if ($(".threeport li").length == $(".threeport li[style='display:none;']").length)
                        {
                            alert("平台暂未开放在线充值，请联系管理员。");
                            return;
                        }
                        $("#form1").attr("action", "/PayConfirm.aspx");
                        $("#dosubmit").attr("onclick", "return Validate()")
                        $("#rechargeMoneyDiv").show();
                        $("#FillCardDiv").hide();
                    } else if (k == 1) {
                       // $("#btnDiv").show();
                        $("#form1").attr("action", "/PayCardFillByPC.aspx");
                        $("#dosubmit").attr("onclick", "return Validate1()")
                        $("#rechargeMoneyDiv").hide();
                        $("#FillCardDiv").show();
                    }
                    $("#tabUl").children().removeClass("cur").eq(k).addClass("cur");
                    $("#contentDiv").children().attr("style", "display:none").eq(k).attr("style", "display:inline")
                });
            });
        });

        function usernameFocus() {
            $("#accountWarn").text("");
        }

        function Validate() {
            var username = $("#<%=this.UserName.ClientID %>").val();
            var rechargeMoney = $("#<%=this.rechargeMoney.ClientID %>").val();
            var minAmountSpan = $("#<%=this.minAmountSpan.ClientID %>").text();
            var verifyCode = $("#VerifyCode").val();

            
            if (username == undefined || username == "") {
                $("#accountWarn").text("充值用户不能为空。");
                return false;
            }
            if (verifyCode == undefined || verifyCode == "") {
                alert("请输入验证码。");
                return false;
            }
            if (rechargeMoney == undefined || rechargeMoney == "") {
                alert("充值金额不能为空。");
                return false;
            } else if (payMoney.indexOf(".") > 0 || isNaN(payMoney) || parseInt(rechargeMoney) < parseInt(minAmountSpan)) {
                alert("充值金额必须为大于" + minAmountSpan + "的整数。");
                return false;
            }
            return true;
        }

        function Validate1() {
            var username = $("#<%=this.UserName.ClientID %>").val();
            var cardNo = $("#CardNo").val();
            var cardPass = $("#CardPass").val();
            var verifyCode = $("#VerifyCode").val();

            
            if (username == undefined || username == "") {
                $("#accountWarn").text("充值用户不能为空。");
                return false;
            }
            if (verifyCode == undefined || verifyCode == "") {
                alert("请输入验证码。");
                return false;
            }
            if (cardNo == undefined || cardNo == "") {
                alert("实卡卡号不能为空。");
                return false;
            }
            if (cardPass == undefined || cardPass == "") {
                alert("实卡密码不能为空。");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
	
	
	<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/styles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script>
    $(function() {
        // 悬浮窗口
        $(".yb_conct").hover(function() {
            $(".yb_conct").css("right", "5px");
            $(".yb_bar .yb_ercode").css('height', '200px');
        }, function() {
            $(".yb_conct").css("right", "-127px");
            $(".yb_bar .yb_ercode").css('height', '53px');
        });
	// 返回顶部
	$(".yb_top").click(function() {
		$("html,body").animate({
			'scrollTop': '0px'
		}, 300)
	});
});
</script>
</head>

<body>
<div class="yb_conct">
  <div class="yb_bar">
    <ul>
      <li class="yb_top">返回顶部</li>
      <li class="yb_phone">4008-123-456</li>
      <li class="yb_QQ">
      	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=954502368&amp;site=qq&amp;menu=yes&amp;from=message&amp;isappinstalled=0" title="即刻发送您的需求">在线咨询</a>
      </li>
      <li class="yb_ercode" style="height:53px;">扫一扫 关注我 <br>
        <img class="hd_qr" src="images/weixin.jpg" width="125" alt="关注你附近"> </li>
    </ul>
  </div>
</div>
<div style="text-align:center;">
<p>欢迎光临:<a href="http://www.8899qpw.com" target="_blank">九龍娱乐</a></p>
</div>
</body>
</html>
