<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="Game.FrontWeb.Download" %>

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
                    <div class="comDownload comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-Download.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                            </dt>
                            <div class="body clearfix">
                                <div class="title01 icon"></div>
                                <div class="p10 plr50 mt20">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td width="60%" valign="top" class="lh30 f14">游戏版本：V<span runat="server" id="spVersionPC">1.05</span><br />
                                                    游戏大小：<span runat="server" id="spPCInstallPackage">1.05</span>MB<br />
                                                    应用平台：Win95/97/98/NT/2000/XP/W7<br />
                                                    更新时间：<span runat="server" id="spPCPackLastUpDate">1.05</span></td>
                                                <td valign="top">
                                                    <p class="but01 icon">
                                                        <a id="A1" href="/RedirectPage.aspx?transferKey=PCDownloadUrl" target="_blank">
                                                            <img src="/images/dian.png" width="210" height="61" alt=""></a>
                                                    </p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="title02 icon mt50"></div>
                                <div class="p10 plr50 mt20">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td width="60%" valign="top" class="lh30 f14">游戏版本：V<span runat="server" id="spVersionMobile">1.05</span><br />
                                                    游戏大小：<span runat="server" id="spWapInstallPackage">1.05</span>MB<br />
                                                    应用平台：IOS / Android<br />
                                                    更新时间：<span runat="server" id="spWapPackLastUpDate">1.05</span></td>
                                                <td valign="top">
                                                    <div class="QRcode w210">
                                                        <p class="p01 tc">
                                                            <img id="downloadImgUrl" runat="server" src="/images/youxi.gif" alt="">
                                                        </p>
                                                        <p>
                                                            <img src="/images/youxi01.gif" alt="">
                                                        </p>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

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


