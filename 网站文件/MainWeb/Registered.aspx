<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="Game.FrontWeb.Registered" %>

<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>
<%@ Register Src="~/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>


<!DOCTYPE HTML>
<html>
<uc1:SiteHead runat="server" ID="SiteHead" />


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
                    <form id="Form1" runat="server">
                        <div class="comRegistered comMold">
                            <dl>
                                <dt class="clearfix">
                                    <p class="fl">
                                        <img src="/images/ico-Registered.png" alt="">
                                    </p>
                                    <p class="fr">
                                        <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                            <img id="backImg" src="/images/btnback.png" />
                                        </a>
                                    </p>
                                </dt>
                                <div class="body clearfix">
                                    <div class="p10 plr50 mt20">
                                        <p class="ptb10">
                                            <label>游戏帐号：</label><input runat="server" type="text" maxlength="12" name="txtUserName" id="txtUserName" onblur="IsEtis()" class="com_input w200"><b id="spanUserName" class="pl10 blue02">6-10位之间，由字母或数字组成。</b>
                                        </p>
                                        <p class="ptb10">
                                            <label>登录密码：</label><input runat="server" name="txtPassword" maxlength="16" id="txtPassword" type="password" class="com_input w200"><b id="spanPassword" class="pl10 blue02">6-20位之间，由字母、数字或特殊符号组成。</b>
                                        </p>
                                        <p class="ptb10">
                                            <label>确认密码：</label><input runat="server" name="txtPassword2" maxlength="16" id="txtPassword2" type="password" class="com_input w200"><b id="spanPassword2" class="pl10 blue02">请再次输入登录密码。</b>
                                        </p>

                                        <p class="sex ptb10" id="rnameP" runat="server">
                                            <label>推&nbsp 荐&nbsp 人：</label><input runat="server" name="rname" maxlength="16" id="rname" type="text" class="com_input w200"><b class="pl10 blue02"><span id="spRename" runat="server">必须填写</span></b>
                                        </p>
                                        <p class="sex ptb10">
                                            <label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 性别：</label>&nbsp<label class="sex_x">男：</label><input type="radio" id="maleRadio" runat="server" name="sex" value="0" checked=""><label class="sex_x">&nbsp&nbsp 女：</label><input runat="server" type="radio" name="sex" value="1">
                                        </p>
                                        <p class="yanzma ptb10">
                                            <label>验&nbsp;证&nbsp;码：</label>
                                            <input type="text" name="txtValidate" runat="server" id="txtValidate" maxlength="4" class="com_input w100">
                                            <img src="ValidateImage.aspx" name="picVerifyCode" id="picVerifyCode" onclick="UpdateImage()" style="cursor: pointer; border: 1px solid #333333; width: 70px; height: 26px;" title="点击更换验证码图片!" />
                                            <a href="javascript:void();" onclick="UpdateImage()">换一个</a>
                                        </p>
                                        <p class="ok ptb10">
                                            <input type="checkbox" id="cbxEnable" name="cbxEnable" checked="checked"><b> 已阅读并同意《<a title="用户服务协议" href="Treaty.aspx" target="_blank">用户服务协议</a>》</b>
                                        </p>
                                        <p class="tc">
                                            <asp:Button Text="确认提交" runat="server" ID="submit" CssClass="button01 cp p10 plr40" OnClick="butSubmit_Click" OnClientClick="return validateInput()" />
                                        </p>
                                    </div>
                                </div>
                            </dl>
                        </div>
                        <input type="hidden" runat="server" id="uidhidden" name="uidhidden" />
                    </form>
                </div>
            </div>
            <!-- rightMold /-->

        </div>

    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />
</body>
</html>

<script type="text/ecmascript">
    function UpdateImage() {
        document.getElementById("picVerifyCode").src = "/ValidateImage.aspx?r=" + Math.random();
    }

    function validateInput() {
        if (!$("#cbxEnable").is(":checked")) {
            alert('请同意用户服务协议！');
            return false;
        }
        var regUname = /[a-zA-Z0-9]{6,10}?/g;
        var regPassword = /[a-zA-Z0-9]{5,20}?/g;
        var uname = $("#txtUserName").val();
        var password = $("#txtPassword").val();
        var cword = $("#txtPassword2").val();
        var rname = $("#rname").val();
        var txtValidate = $("#txtValidate").val();
        var sex = $("input[name='sex']:checked").val();
        var message = "";
        if (txtValidate == "" || txtValidate == undefined) {
            message += '验证码不能为空！';
        }
        if (!regUname.test(uname)) {
            message += '账号格式错误，必须大于6位小于等于10位！';
        }
        if (!regPassword.test(password)) {
            message += '密码不对，必须大于5位小于20位！';
        }
        if (cword != password) {
            message += '确认密码需要和输入密码一致！';
        }
        if (sex == null || sex == '') {
            message += '请选择性别！';
        }
        if (message != "") {
            alert(message);
            return false;
        } else {
            return true;
        }
    }
</script>
	
	
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
