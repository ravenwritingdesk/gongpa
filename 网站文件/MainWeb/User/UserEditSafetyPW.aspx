<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserEditSafetyPW.aspx.cs" Inherits="Game.FrontWeb.User.UserEditSafetyPW" %>

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
                    <h2><span class="title">修改保险密码</span></h2>
                    <div class="gray_box user_table_box page_box p30 mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col width="120">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">原密码：</th>
                                    <td>
                                        <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" CssClass="com_input w150"></asp:TextBox>&nbsp;
                                        <span id="txtOldPassTip"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">新密码：</th>
                                    <td>
                                        <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="com_input w150"></asp:TextBox>&nbsp;
                                        <span id="txtNewPassTip"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">确认新密码：</th>
                                    <td>
                                        <asp:TextBox ID="txtNewPass2" runat="server" TextMode="Password" CssClass="com_input w150"></asp:TextBox>&nbsp;
                                        <span id="txtNewPass2Tip"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td>
                                        <asp:Button ID="btnUpdate" Text="确 定" runat="server" CssClass="button03 cp p10 plr4" OnClick="btnUpdate_Click" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </dl>
        </div>
    </div>

</asp:Content>
