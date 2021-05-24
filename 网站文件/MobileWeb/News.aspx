<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="OfficialWap.Web.News" %>
<%@ MasterType VirtualPath="/SiteMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="center_mold mt20">
        <h2 class="NewsTitle" id="NewsTitle" runat="server"></h2>
        <div class="plr10">
            <p class="pl40 tl mb20"  id="NewsDate" runat="server"></p>
            <div class="Games list p15 lh180 ww" id="NewsBody" runat="server" >
                
            </div>
        </div>
    </section>
</asp:Content>
