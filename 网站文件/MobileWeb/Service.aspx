<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="OfficialWap.Web.Service" %>
<%@ MasterType VirtualPath="/SiteMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="center_mold mt20">
        <h2>客服中心</h2>
        <div class="plr10">
            <div class="Service list p15 ptb30 lh200" style="text-align:center;">
                <p>扫描二维码，联系在线客服</p>
                <p><img src="/images/QRCode/IndexWeixinQr.png" /></p>
                
            </div>
        </div>
    </section>

    <section class="center_mold mt20">
        <h2>常见问题</h2>
        <div class="plr10">
            <dl class="Service list p15 lh150">
                <dt>1. 如何进入游戏 </dt>
                <dd>您好，请先注册游戏帐号，注册完毕下载游戏。 </dd>
                <dt>2. 开户是否要填写真实姓名 </dt>
                <dd>您好，基于安全理由，所以请您在注册时填写的姓名必须为真实姓名。 </dd>
                <dt>3. 可以注册多个账号吗 </dt>
                <dd>您好，为给平台一个公平的游戏环境，一个真实姓名最多只能注册一个游戏账号。 </dd>
                <dt>4. 逃跑与网络中断说明，支持断线重连 </dt>
                <dd>您好，玩家如果在已经开始游戏情况下，逃跑或者自身问题断线，电脑会按照系统的托管规则进行托管出牌，重新登录即可断线重连，如果由于服务器网络原因造成游戏中断，本局游戏将自动取消，输赢结果无效。 </dd>

            </dl>
        </div>
    </section>
</asp:Content>
