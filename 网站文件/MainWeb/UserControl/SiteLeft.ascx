<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteLeft.ascx.cs" Inherits="Game.FrontWeb.SiteLeft" %>

<div class="leftMold fl">
    <a id="linksA" href="RedirectPage.aspx?transferKey=PCDownloadUrl" target="_blank">
        <div class="download">
            <img src="/images/download.jpg" alt="">
        </div>
    </a>
    <div class="comRegister">
        <ul class="clearfix">
            <li><a href="/Registered.aspx" class="A01">快速注册</a></li>
            <li><a href="/Recharge.aspx" class="A02">账号充值</a></li>
            <li><a href="/Shop/PrizeList.aspx" class="A03">奖品商城</a></li>
            <li><a href="/User/UserIndex.aspx" class="A04">个人中心</a></li>
        </ul>
    </div>
    <div class="comActivity p10">
        <a href="#">
            <img src="/images/adv01.jpg" alt="" />
        </a>
    </div>
    <div class="comService comMold">
        <dl id="dl1" runat="server">
            <dt class="clearfix">
                <p class="fl">
                    <img src="/images/ico-Service.png" alt="">
                </p>
            </dt>
            <dd class="plr20 ptb10 lh200">例行维护：<span runat="server" id="Span1"><%=maintainTime %></span><br />
            </dd>
            <dd class="plr20 ptb10 tc">
                <p class="p01 tc">
                    <img id="Img1" src="<%=weixinQrImg %>" style="padding: 10px; width:186px;height:186px;" alt="">
                </p>
                <p>
                    <img src="/images/weixin01.gif" alt="">
                </p>
                <dd>
                    <img src="/images/ico-Service01.png" alt=""></dd>
            </dl>
        <dl  id="dl2" runat="server">
            <div class="comPrize comMold mt10">
                <dl>
                    <dt class="clearfix">
                        <p class="fl">
                            <img src="/images/ico-PrizeTop.png" alt="">
                        </p>
                    </dt>
                    <table>
                        <tr>
                            <th>用户</th>
                            <th>商品名称</th>
                            <th>状态</th>
                        </tr>
                        <tbody runat="server" id="TopExchange" >
                            <%=TopExchangeHtml %>
               
                        </tbody>
                    </table>
                   
                </dl>
            </div>
        </dl>
    </div>
</div>
