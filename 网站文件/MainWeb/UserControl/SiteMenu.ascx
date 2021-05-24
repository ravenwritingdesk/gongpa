<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteMenu.ascx.cs" Inherits="Game.FrontWeb.SiteMenu" %>

<div class="fix-header">
    <div class="HeaderMold wrap tl clearfix">
        <p class="fl">
            <img src="/images/logo.png" width="140" height="44" alt="">
        </p>
        <ul class="navs fr">
            <li style="display:<%=webMenu.Contains("1") ? "inline;" : "none;" %>" <%=(title=="官方首页"?"class='cur'":"") %>><a href="/index.aspx" class="A01">官方首页<%=title %></a></li>
            <li style="display:<%=webMenu.Contains("2") ? "inline;" : "none;" %>" class="<%=title=="游戏下载"?"cur":"" %>"><a href="/Download.aspx" class="A02">游戏下载</a></li>
            <li style="display:<%=webMenu.Contains("3") ? "inline;" : "none;" %>" class="<%=title=="账号充值"?"cur":"" %>"><a href="/Recharge.aspx" class="A03">账号充值</a></li>
            <li style="display:<%=webMenu.Contains("4") ? "inline;" : "none;" %>" class="<%=title=="奖品商城"?"cur":"" %>"><a href="/Shop/PrizeList.aspx"  class="A04">奖品商城</a></li>
            <li style="display:<%=webMenu.Contains("5") ? "inline;" : "none;" %>" class="<%=title=="个人中心"?"cur":"" %>"><a href="/User/UserIndex.aspx" class="A06">个人中心</a></li>
            <li style="display:<%=webMenu.Contains("6") ? "inline;" : "none;" %>" class="<%=title=="关于我们"?"cur":"" %>"><a href="/AboutUS.aspx" class="A05">关于我们</a></li>
        </ul>
    </div>
</div>
