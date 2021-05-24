<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteFooter.ascx.cs" Inherits="Game.FrontWeb.SiteFooter" %>
<div class="common_footer oh mt20">
    <div class=" mt50 mb20"><a id="toTop" class="to_top" href="#top">返回顶部</a></div>
    <div class="mfoot">
        <p class="pb10 lh20">
            健康游戏忠告：抵制不良游戏，拒绝盗版游戏;
                注意自我保护，谨防受骗上当，适度游戏益脑;
                沉迷游戏伤身，合理安排时间，享受健康生活;
                <br />
            &copy; <span onclick="versionClick()">2015 <%=webName %>科技有限公司</span>
            <span style="display:none;" id="versionSpan" runat="server" ></span>
        </p>
    </div>
</div>

<div class="none">
    <!--统计代码-->
</div>
<%--<div class="qq">
    <span>在线客服</span>
    <%=serviceWindow %>
    <a href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qianniao&menu=yes" target="_blank">
        <div class="qq_in">123456</div>
    </a>
    <div class="phone_in">123456</div>
    <div class="weixin_in">123456</div>
</div>--%>

<script type="text/javascript">
    function closeClick()
    {
        $("div[class=max]").hide();
    }


    function versionClick() {
        if ($("#<%=versionSpan.ClientID %>").attr("style") == "display: none;") {
            $("#<%=versionSpan.ClientID %>").attr("style", "display:inline;");
        } else {
            $("#<%=versionSpan.ClientID %>").attr("style", "display: none;");
        }
    }
</script>
<style type="text/css">
.max{
	position: fixed;
	left: 80px;
	top: 8%;
	width: 152px;
	height: 259px;
}

    .Lelem {
        width: 181px;
        height: 304px;
        position: relative;
        z-index: 10000;
        cursor: pointer;
    }

    .BackDiv {
        display: block;
        cursor: default;
        position: absolute;
        left: 0px;
        width: 180px;
        height: 49px;
    }

        .BackDiv img {
            width: 181px;
            height: 48px;
        }

    .iconDivMain1 {
        z-index: 10085;
        left: 1px;
        top: 165px;
        width: 181px;
        height: 304px;
        overflow: hidden;
        position: absolute;
    }

    .qqImg {
        display: block;
        cursor: default;
        position: absolute;
        top: 209px;
        left: 22px;
        z-index: 10014;
        width: 16px;
        height: 16px;
    }

    .qqDiv {
        display: block;
        cursor: pointer;
        position: absolute;
        left: 52px;
        width: 90px;
        height: 17px;
        color: rgb(255, 255, 255);
    }

        .qqDiv span {
            vertical-align: top;
            font-size: 12px;
            line-height: 17px;
            color: rgb(255, 243, 171);
            font-family: 微软雅黑;
        }
</style>

<div class="max">
    <div class="iconDivMain1">
        <div class="Lelem">
            <%=serviceWindow %>
        </div>
    </div>
</div>
