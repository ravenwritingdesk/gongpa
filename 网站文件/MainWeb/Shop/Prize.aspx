<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prize.aspx.cs" Inherits="Game.FrontWeb.Shop.Prize" %>

<%@ Register Src="/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>
<%@ Register Src="/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>

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
                    <div class="comPrizeList comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-Prize.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                            </dt>
                            <div class="body p20">
                                <div class="w">
                                    <div class="user_demoBox js_user_demoBox">

                                        <div class="tab_box w">
                                            <div class="sort">
                                                <b class="lh30 f14">奖品详情</b><b class="fr lh30 f14"><a href="Prizelist.aspx">返回</a></b>
                                            </div>
                                            <div class="Prize p10">
                                                <form id="form1" runat="server">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tbody>
                                                            <tr>
                                                                <td width="40%" valign="top">
                                                                    <p class="img">
                                                                        <img runat="server" id="PrizeImage" src="/images/Product/434.jpg" alt="">
                                                                    </p>
                                                                </td>
                                                                <td valign="top">
                                                                    <ul class="info">
                                                                        <li><b  class="title f16 fb mb10" id="name" runat="server">腾讯QQ币20个</b><span style="float:right;">您当前奖券：<b class="fb f16 red"  id="balance" runat="server">1532.00</b></span></li>
                                                                        <li>价格：<b class="fb f16 red" id="value" runat="server">1532.00</b>&nbsp;奖券</li>
                                                                        <li id="liPprizeId" runat="server">编号：193</li>
                                                                        <li id="counts" runat="server">库存：1422 件</li>
                                                                        <li>收&nbsp;货&nbsp;人&nbsp;：<input type="text" id="txtRecUserName" runat="server" /><span style="color:red;" >*</span></li>
                                                                        <li>收货电话：<input type="text" id="txtRecUserPhone" runat="server" /><span style="color:red;" >*</span></li>
                                                                        <li>收货邮编：<input type="text" id="txtRecUserZipcode" runat="server" /><span style="color:red;" >*</span></li>
                                                                        <li>收货地址：<input type="text" id="txtRecUserAddress" runat="server" style="width:300px;" /><span style="color:red;" >*</span></li>

                                                                        <li id="btnli" runat="server">
                                                                            <p class="mt10">
                                                                                <asp:Button ID="btnExchange" runat="server" CssClass="button01 w200 h40 lh40 f14 br3" Text="立即兑换" OnClientClick="return ExchangeClientClick(this)" OnClick="btnExchange_Click" />
                                                                            </p>
                                                                        </li>
                                                                        <li  id="btnli2" runat="server">
                                                                            <p class="mt10"><a href="javascript:void();" class="button02 w200 h40 lh40 f14 br3">暂无库存</a></p>
                                                                        </li>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" class="explain">
                                                                    <h2>奖品说明</h2>
                                                                    <div class="product ww p10" runat="server" id="IntroDiv">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <input type="hidden" runat="server" id="prizeIdHidden" />
                                                </form>

                                            </div>

                                        </div>
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

</body>
</html>

<script type="text/javascript">
    function ExchangeClientClick(e) {
        if ($("#<%=this.txtRecUserName.ClientID %>").val()=="")
        {
            alert("收货姓名不能为空。");
            return false;
        }
        if ($("#<%=this.txtRecUserPhone.ClientID %>").val() == "") {
            alert("收货电话不能为空。");
            return false;
        }
        if ($("#<%=this.txtRecUserZipcode.ClientID %>").val() == "") {
            alert("收货邮编不能为空。");
            return false;
        }
        if ($("#<%=this.txtRecUserAddress.ClientID %>").val() == "") {
            alert("收货地址不能为空。");
            return false;
        }
        if ($("#<%=this.balance.ClientID %>").text() < $("#<%=this.value.ClientID %>").text()) {
            alert("奖券余额不足，兑换失败。");
            return false;
        }

        var allClass = $(e).attr("class");
        var value = $(e).attr("value");
        if (value == "立即兑换") {
            $(e).attr("class", "button02 w200 h40 lh40 f14 br3").val("正在兑换，请稍候…");
            return true;
        } else {
            return false;
        }
    }
</script>

