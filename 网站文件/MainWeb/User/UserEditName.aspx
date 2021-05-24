<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserEditName.aspx.cs" Inherits="Game.FrontWeb.User.UserEditName" %>

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
                    <h2><span class="title">修改昵称</span></h2>
                    <div class="gray_box user_table_box page_box p30 mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col width="120">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">当前昵称：</th>
                                    <td><%=currentAccountsInfo.NickName %></td>
                                </tr>
                                <tr>
                                    <th scope="row">ID 号码：</th>
                                     <td><%=currentAccountsInfo.UserID %></td>
                                </tr>
                                <tr>
                                    <th scope="row">新昵称：</th>
                                    <td>
                                        <input type="text" runat="server"  name="txtNickName" onfocus="usernameFocus()" class="com_input w150" id="txtNickName" maxlength="30" value=""><span id="warnSpan" style="color:red"></span></td>
                                </tr>
                                <tr>
                                    <th scope="row">&nbsp;</th>
                                    <td>
                                        <%--<input type="submit" value="确认修改" onclick="return Validate()" class="button03 cp p10 plr40" id="dosubmit">--%>
                                            <asp:Button Text="确认修改" runat="server" ID="submit" CssClass="button03 cp p10 plr40" OnClick="butSubmit_Click" OnClientClick="return Validate()" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </dl>
        </div>
    </div>
       <script type="text/javascript">
           function usernameFocus() {
               $("#warnSpan").text("");
           }

           function Validate() {
               if ($.trim($("#<%=this.txtNickName.ClientID %>").val()) == "") {
                   $("#warnSpan").text("请输入您的新昵称!");
                   $("#txtNickName").focus();
                   return false;
               }

               var reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
               if (!reg.test($("#txtNickName").val())) {
                   $("#warnSpan").text("昵称是由字母、数字、下划线和汉字的组合！");
                   return false;
               }

               if (byteLength($("#txtNickName").val()) < 4) {
                   $("#warnSpan").text("昵称的长度至少为4个字符");
                   return false;
               }

               if ($("#txtNickName").val().length > 31) {
                   $("#warnSpan").text("昵称的长度不能超过31个字符");
                   return false;
               }

               return true;
           }
	</script>
</asp:Content>
