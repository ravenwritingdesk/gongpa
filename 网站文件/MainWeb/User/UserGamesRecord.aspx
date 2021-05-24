<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserGamesRecord.aspx.cs" Inherits="Game.FrontWeb.User.UserGamesRecord" %>

<%@ MasterType VirtualPath="~/User/User.Master" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="/js/DatePicker/WdatePicker.js"></script>
    <div class="rightMold fr">

        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt="">
                    </p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">游戏记录</span></h2>
                    <div class="orange_box p20 mt10">
                        <form action="" method="post">
                            <table class="ser_table" width="100%">
                                <colgroup>
                                    <col width="10%">
                                    <col>
                                    <col>
                                    <col width="10%">
                                    <col width="7%">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>日期查询：</td>
                                        <td>
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"></asp:TextBox>
                                            至
                                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="text"  onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"></asp:TextBox>
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="btnSelect" Text="查 询" runat="server" CssClass="button03 p3 plr30 mr20 cp" OnClick="btnSelect_Click" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="user_table_box02 page_box mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th scope="col">开始时间</th>
                                <th scope="col">结束时间</th>
                                <th scope="col">游戏</th>
                                <th scope="col">房间</th>
                                <th scope="col">税收</th>
                                <th scope="col">输赢</th>
                            </tr>
                            <tbody id="tbodyRows" runat="server">
                                <tr>
                                    <td>2015-10-01</td>
                                    <td>abc</td>
                                    <td>dddd</td>
                                    <td>充值</td>
                                    <td>100.00</td>
                                    <td>0.00</td>
                                    <td>0.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="mold-page mt20">
                        <webdiyer:AspNetPager ID="anpPage" runat="server" AlwaysShow="true" FirstPageText="首页"
                            LastPageText="末页" PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0"
                            LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="共 %PageCount% 页"
                            UrlPaging="false" OnPageChanging="anpPage_PageChanging" ShowCustomInfoSection="Never">
                        </webdiyer:AspNetPager>
                    </div>
                </div>
            </dl>
        </div>
    </div>
</asp:Content>
