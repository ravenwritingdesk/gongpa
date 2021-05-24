<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="OfficialWap.Web.Registered" %>

<%@ MasterType VirtualPath="/SiteMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="center_mold mt20">
        <h2>游戏注册</h2>
        <div class="plr10">
            <div class="Registered list">
                <form id="Form1" runat="server" method="post" onsubmit="return validateInput()">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col width="20%">
                            <col>
                        </colgroup>
                        <tr>
                            <th scope="row">用户账号：</th>
                            <td>
                                <input type="text" runat="server" id="uname"></td>
                        </tr>
                        <tr>
                            <th scope="row">登录密码：</th>
                            <td>
                                <input type="password" runat="server" id="passwordText"></td>
                        </tr>
                        <tr>
                            <th scope="row">性别：</th>
                            <td>
                                <input type="radio" name="sex" value="0" class="xk_in" id="xk1" runat="server">男
                                <input type="radio" name="sex" value="1" runat="server" class="xk" id="xk2">女</td>
                        </tr>
                        <tr id="rnameRow" runat="server">
                            <th scope="row">推荐人：</th>
                            <td>
                                <input type="text" id="rname" runat="server"><span id="spRename" runat="server" style="color:red;">(必须填写)</span></td>
                        </tr>
                        <tr>
                            <th scope="row">&nbsp;</th>
                            <td>
                                <input type="checkbox" id="xk3" checked="checked"><label for="xk3">我已阅读并同意《用户服务协议》</label></td>
                        </tr>
                        <tr>
                            <th scope="row">&nbsp;</th>
                            <td>
                                <asp:Button runat="server" Text="提交" name="butSubmit" ID="butSubmit" OnClick="butSubmit_Click" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        function validateInput() {
            var message = '';
            if (!$("#xk3").is(":checked")) {
                message += '请同意用户服务协议！';
                alert(message);
                return false;
            }
            var regUname = /[a-zA-Z0-9]{6,10}?/g;
            var regPassword = /[a-zA-Z0-9]{5,20}?/g;
            var uname = $("#<%=uname.ClientID %>").val();
            var password = $("#<%=passwordText.ClientID %>").val();
            var message = "";
           
            if (!regUname.test(uname)) {
                message += '账号格式错误，必须大于6位小于等于10位！';
            }
            if (!regPassword.test(password)) {
                message += '密码不对，必须大于5位小于20位！';
            }
            if (message != "") {
                alert(message);
                return false;
            } else {
                return true;
            }
        }
    </script>
</asp:Content>
