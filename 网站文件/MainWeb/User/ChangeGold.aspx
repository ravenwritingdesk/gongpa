<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ChangeGold.aspx.cs" Inherits="Game.FrontWeb.User.ChangeGold" %>

<%@ MasterType VirtualPath="~/User/User.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rightMold fr">
        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt="">
                    </p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">兑换奖券</span></h2>
                    <div class="gray_box user_table_box page_box p30 mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col width="120">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">银行余额：</th>
                                    <td><%=currentAccountsInfo.InsureScore %></td>
                                </tr>
                                <tr>
                                    <th scope="row">我的奖券：</th>
                                    <td><%=currentAccountsInfo.Gold %></td>
                                </tr>
                                <tr>
                                    <th scope="row">兑换比例：</th>
                                    <td><b class="fb f16 red" id="b1" runat="server">1</b>奖券=<b class="fb f16 red" id="b2"><%=goldChangeScale %></b>金币,
                                        您目前最多可以兑换<b class="fb f16 red" id="maxChange"><%=currentAccountsInfo.InsureScore/Convert.ToInt32(goldChangeScale) %></b>奖券</td>
                                </tr>
                                <tr>
                                    <th scope="row">兑换数量：</th>
                                    <td>
                                        <input id="changeCount" runat="server" onblur="changeCountBlur(this)" type="text" value=""></td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td>
                                        <asp:Button Text="确认兑换" runat="server" ID="submit" CssClass="button03 cp p10 plr40" OnClick="submit_Click" OnClientClick="return Validate()" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </dl>
        </div>
    </div>
    <script>
        function changeCountBlur(e) {
            var val = $(e).val();
            var maxChange = $("#maxChange").text();
            if (parseFloat(maxChange) < parseFloat(val) || isNaN(val) || parseFloat(val) <= 0 || val.indexOf(".")>-1)
            {
                alert("兑换数量只能为1-" + maxChange + "正整数！");
                $(e).val("");
                return;
            }
        }

        function Validate()
        {
            var val = $("#<%=changeCount.ClientID %>").val();
            var maxChange = $("#maxChange").text();
            if (parseFloat(maxChange) < parseFloat(val) || isNaN(val) || parseFloat(val) <= 0 || val.indexOf(".") > -1 || val=="") {
                alert("兑换数量只能为1-" + maxChange + "正整数！");
                $(e).val("");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
