<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserEditInfo.aspx.cs" Inherits="Game.FrontWeb.User.UserEditInfo" %>
<%@ MasterType VirtualPath="~/User/User.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rightMold fr">

        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt=""></p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">修改信息</span></h2>
                    <div class="gray_box user_table_box page_box p30 mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col width="120">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">帐号：</th>
                                    <td><asp:Label ID="lblAccounts" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th scope="row">ID 号码：</th>
                                    <td><asp:Label ID="lblGameID" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th scope="row">性别：</th>
                                    <td>
                                        <input type="radio" runat="server" id="maleRadio" name="sex" value="0"  ><label for="true" class="mr10">男</label><input type="radio" runat="server" id="womanRadio"  name="sex" value="1" checked="" ><label for="false">女</label>
                                        <span class="red"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">个性签名：</th>
                                    <td>
                                         <asp:TextBox ID="txtUnderWrite" runat="server" CssClass="com_input w" ></asp:TextBox> </td>    
                                </tr>
                                <tr>
                                    <th scope="row">真实姓名：</th>
                                    <td>
                                        <asp:TextBox ID="txtCompellation" runat="server" CssClass="com_input w150"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">手机号码：</th>
                                    <td>
                                        <asp:TextBox ID="txtMobilePhone" runat="server" CssClass="com_input w150"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">固定电话：</th>
                                    <td>
                                        <asp:TextBox ID="txtSeatPhone" runat="server" CssClass="com_input w150"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">QQ/MSN：</th>
                                    <td>
                                        <asp:TextBox ID="txtQQ" runat="server" CssClass="com_input w150"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">Email：</th>
                                    <td>
                                        <input type="text" name="tempname" class="com_input w150" id="txtEmail" runat="server" maxlength="30" value="" onblur="checkEmail()">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">详细地址：</th>
                                    <td>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="com_input w" Width="457"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">其它说明：</th>
                                    <td>
                                        <asp:TextBox ID="txtUserNote" runat="server" CssClass="com_input w" Width="490" Height="150" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td>
                                    <asp:Button ID="btnUpdate" runat="server" OnClientClick="return checkEmail()" CssClass="button03 cp p10 plr40" Text="确认修改"  onclick="btnUpdate_Click" />
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </dl>
        </div>
    </div>
        <script type="text/javascript">
            function checkEmail() {
                var regEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                if ($("#<%=txtEmail.ClientID %>").val() != "") {
                    if (!regEmail.test($("#<%=txtEmail.ClientID %>").val())) {
                        alert("Email地址不正确，请重新输入");
                        return false;
                    }
                }
                return true;
            }

	</script> 
</asp:Content>
