<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Game.FrontWeb.Index" %>

<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>
<%@ Register Src="~/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>


<!DOCTYPE HTML>
<html>
<uc1:SiteHead runat="server" ID="SiteHead" />
<script type="text/javascript">
    $(function () {
        if ('<%=errorMessage %>' != '') {
            alert('<%=errorMessage %>');
        }

        setInterval('GameScroll()', 2000);
        ExChangeImg(3);
    });

        var index = 0;
        function GameScroll() {
            if (index + 4 > $("#gameList").children().length) {
                index = 0;
            }
            $("#gameList").children().hide();
            $("#gameList").children().each(function (k, v) {
                if ((k < index + 4) && k >= index) {
                    $(v).attr("style", "display:inline");
                } else {
                    $(v).attr("style", "display:none");
                }
            });
            index++;
        }

        function ExChangeImg(imgIndex) {
            if (imgIndex > 7) {
                imgIndex = 3;
            }
            $("#exchangeImg").attr("src", "/images/adv0" + imgIndex + ".jpg");
            imgIndex++;
            setTimeout('ExChangeImg(' + imgIndex + ')', 2000);
        }

        if(1=1){}
</script>
<body>

    <uc1:SiteMenu runat="server" ID="SiteMenu" />

    <div id="wrapper">

        <div class="Poster wrap"></div>
        <div class="wrap clearfix tl">
            <uc1:SiteLeft runat="server" ID="SiteLeft" />

            <div class="rightMold fr">
                <div class="d1 clearfix">
                    <div class="w500 fl">
                        <div class="carouselBox">
                            <img src="/images/adv06.jpg" alt="" id="exchangeImg">
                        </div>
                        <div class="comNews comMold mt10">
                            <dl>
                                <dt class="clearfix">
                                    <p class="fl">
                                        <a href="javascript:void(0)">
                                        <img src="/images/ico-News.png" alt="">
                                        </a>
                                        <a href="/Games/IntroductionList.aspx">
                                            <img src="/images/ico-Games.png" alt="">
                                        </a>
                                    </p>
                                    <p class="fr">
                                        <a href="NewList.aspx" title="更多&gt;&gt;">
                                            <img src="/images/ico-more.png" alt="更多&gt;&gt"></a>
                                    </p>
                                </dt>

                                <ul class="p10" runat="server" id="rptNews">
                        
                                </ul>
                            </dl>
                        </div>
                    </div>
                    <div class="w210 fr">
                        <a id="aBypc" target="_blank" href="<%=downloadQrTransferUrl %>">
                            <div class="QRcode">
                                <p class="p01 tc">
                                    <img id="downloadImgUrl" runat="server" src="/images/QRCodeImages/IndexDownloadQr.png" style="padding-top: 10px;" alt="">
                                </p>
                                <p>
                                    <img src="/images/youxi01.gif" alt="">
                                </p>   </div>
                       </a>
                        <div class="comPrize comMold mt10">
                            <dl>
                                <dt class="clearfix">
                                    <p class="fl">
                                        <img src="/images/ico-PrizeTop.png" alt="">
                                    </p>
                                    <p class="fr">
                                        <a href="/Shop/PrizeList.aspx" title="更多&gt;&gt;">
                                            <img src="/images/ico-more.png" alt="更多&gt;&gt"></a>
                                    </p>
                                </dt>
                                <ul class="p10 icon" runat="server" id="ExchangeRankingUl">
                                   
                                </ul>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="d2 mt10">
                    <div class="comHotGames comMold mt10">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-hotGames.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="javascript:void(0);" title="更多&gt;&gt;">
                                        <img src="/images/ico-more.png" alt="更多&gt;&gt"></a>
                                </p>
                            </dt>
                            <ul class="p10 clearfix" id="gameList" runat="server">
                            
                            </ul>
                        </dl>
                    </div>
                </div>
            </div>

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
