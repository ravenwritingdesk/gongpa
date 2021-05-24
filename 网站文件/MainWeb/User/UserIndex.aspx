<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserIndex.aspx.cs" Inherits="Game.FrontWeb.User.UserIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rightMold fr">
        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt=""></p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">基本信息</span></h2>
                    <div class="gray_box user_table_box page_box plr50 ptb30 mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col width="20%">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td colspan="2" class="f14">尊敬的 <span class="red fb"><%=currentAccountsInfo.Accounts %></span> ,欢迎您来到用户个人中心。 </td>
                                </tr>
                                <tr>
                                    <th scope="row">昵称：</th>
                                    <td><%=currentAccountsInfo.NickName %></td>
                                </tr>
                                <tr>
                                    <th scope="row">性别：</th>
                                    <td><%=currentAccountsInfo.Gender==0?"男":"女" %></td>
                                </tr>
                                <tr>
                                    <th scope="row">注册日期：</th>
                                    <td><%=currentAccountsInfo.RegisterDate.ToString() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">银行余额：</th>
                                    <td><%=currentAccountsInfo.InsureScore %></td>
                                </tr>
                                <tr>
                                    <th scope="row">背包余额：</th>
                                    <td><%=currentAccountsInfo.BackScore %></td>
                                </tr>
                                  <tr>
                                    <th scope="row">奖券：</th>
                                    <td><%=currentAccountsInfo.Gold %></td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </dl>
        </div>
    </div>
</asp:Content>

