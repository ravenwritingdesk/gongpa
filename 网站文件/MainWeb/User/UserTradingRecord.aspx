<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserTradingRecord.aspx.cs" Inherits="Game.FrontWeb.User.UserTradingRecord" %>

<%@ MasterType VirtualPath="~/User/User.Master" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="/js/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function QueryInfo() {
            var startDate = document.form1.StartDate.value;
            var endDate = document.form1.EndDate.value;
            if (!isDate(startDate) || !isDate(endDate)) {
                alert("日期格式不正确！");
                return false;
            }
        }
    </script>
    <div class="rightMold fr">

        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt="">
                    </p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">交易明细</span></h2>
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
                                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="com_input"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></asp:TextBox>
                                            -
                                             <asp:TextBox ID="txtEndDate" runat="server" CssClass="com_input"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></asp:TextBox>

                                        </td>
                                        <td>
                                            <select name="ddlType" id="ddlType" runat="server" style="width: 80px;">
                                                <option selected="selected" value="0">全部</option>
                                                <option value="1">存款</option>
                                                <option value="2">取款</option>
                                                <option value="3">转账（出）</option>
                                                <option value="4">转账（入）</option>

                                            </select></td>
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
                            <thead>
                                <tr>
                                    <th scope="col">交易日期</th>
                                    <th scope="col">汇款人</th>
                                    <th scope="col">收款人</th>
                                    <th scope="col">交易类别</th>
                                    <th scope="col">交易金额</th>
                                    <th scope="col">服务费</th>
                                    <th scope="col">交易场所</th>
                                </tr>
                            </thead>
                            <tbody id="tbodyRows" runat="server">
                                <tr>
                                    <td>2015-10-01</td>
                                    <td>abc</td>
                                    <td>dddd</td>
                                    <td>充值</td>
                                    <td>100.00</td>
                                    <td>0.00</td>
                                    <td>网银</td>
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
