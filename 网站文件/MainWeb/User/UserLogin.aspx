<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Game.FrontWeb.User.UserLogin" %>

<%@ Register Src="/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>
<%@ Register Src="/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>

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
                <form runat="server" id="form1">
                    <div class="d2">
                        <div class="comRegistered comMold">
                            <dl>
                                <dt class="clearfix">
                                    <p class="fl">
                                        <img src="/images/ico-Login.png" alt="">
                                    </p>
                                    <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                                </dt>
                                <div class="body clearfix">
                                    <div class="p10 plr100 mt20 f14">
                                        <p class="ptb10">
                                            <label>游戏帐号：</label><input type="text" runat="server" maxlength="12" name="txtAccounts" id="txtAccounts" onblur="IsEtis()" class="com_input w300 br3 h30">
                                        </p>
                                        <p class="ptb10">
                                            <label>登录密码：</label><input name="txtAccountPass" runat="server" maxlength="16" id="txtAccountPass" type="password" class="com_input w300 br3 h30">
                                        </p>
                                        <p class="yanzma ptb10">
                                            <label>验&nbsp;证&nbsp;码：</label>
                                            <input type="text" name="txtValidate" runat="server" id="txtValidate" maxlength="4" class="com_input w150 br3 h30">
                                            <img src="/ValidateImage.aspx" name="picVerifyCode" id="picVerifyCode" onclick="UpdateImage()" style="cursor: pointer; border: 1px solid #333333; width: 70px; height: 36px;" title="点击更换验证码图片!" />
                                            <a href="javascript:void();" onclick="UpdateImage()">换一个</a>
                                        </p>
                                        <p class="pl70 mt20">
                                            <asp:Button ID="btnsubmit" runat="server" Text="立即登录" CssClass="button01 cp p10 plr30 br3" OnClick="btnLogin_Click" OnClientClick="return Validate()" />
                                        </p>
                                    </div>
                                </div>
                            </dl>
                        </div>
                    </div>

                </form>
            </div>
            <!-- rightMold /-->

        </div>

    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />

    <script type="text/javascript">

        function Validate() {
            var txtAccounts = $("#<%=this.txtAccounts.ClientID %>").val();
            var txtAccountPass = $("#<%=this.txtAccountPass.ClientID %>").val();
            var txtValidate = $("#<%=this.txtValidate.ClientID %>").val();
            if (txtAccounts == undefined || txtAccounts == "") {
                alert("用户名不能为空。");
                return false;
            }
            if (txtValidate == undefined || txtValidate == "") {
                alert("验证码不能为空。");
                return false;
            }
            if (txtAccountPass == undefined || txtAccountPass == "") {
                alert("密码不能为空。");
                return false;
            }
            return true;
        }

        function UpdateImage() {
            document.getElementById("picVerifyCode").src = "/ValidateImage.aspx?r=" + Math.random();
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
