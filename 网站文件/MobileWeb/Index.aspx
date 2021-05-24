<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="OfficialWap.Web.Index" %>

<%@ MasterType VirtualPath="/SiteMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="img100">
        <img src="images/kv.jpg" width="100%" height="auto" alt="">
    </section>

    <section class="center_mold mt20">
        <h2><span>游戏公告</span><span class="more"><a href="Newslist.aspx">MORE&gt;&gt;</a></span></h2>
        <div class="plr10">
            <ul class="Newslist list tl ptb10" id="NewsListUl" runat="server">
            </ul>
        </div>
    </section>
    <section class="center_mold mt20">
        <h2><span>热门游戏</span></h2>
        <div class="plr10">
            <ul class="Gamelist list tl pb10 clearfix" id="GamelistUl" runat="server">
                <li><a href="Games.aspx">
                    <img src="images/game/dsnh.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/jcby.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/ermj.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/brbjl.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/hyzx.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/brlhd.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/brsm.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/dzpk.png" width="100%" height="auto" alt=""></a></li>
                <li><a href="Games.aspx">
                    <img src="images/game/lkpy.png" width="100%" height="auto" alt=""></a></li>
            </ul>
        </div>
    </section>


</asp:Content>
