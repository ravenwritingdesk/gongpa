<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="OfficialWap.Web.ErrorPage" %>

<%@ MasterType VirtualPath="/SiteMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="center_mold mt20">
        <h2>系统提示</h2>
        <div class="plr10">
            <div style="text-align: center; font-size: 12px; margin-top: 20px;">
                <div class="errorTip">
                    <p class="Tips"><span class="sp01">!</span>对不起！页面加载失败了！</p>
                    <div class="button">
                        <a href="Index.aspx" class="but01">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>


