<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registered01.aspx.cs" Inherits="Game.FrontWeb.Registered01" %>

<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>

<!DOCTYPE HTML>
<html>
<uc1:SiteHead runat="server" ID="SiteHead" />



<body class="comRegister01">
    <div class="logo mt20">
        <img src="images/logo.png" width="140" height="44" alt="">
    </div>
    <div class="reg">
        <form id="Form1" runat="server">
            <div class="regWrap">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                        <col width="20%">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">游戏帐号：</th>
                            <td>
                                <input name="txtUserName" runat="server" type="text" id="txtUserName" maxlength="12" onblur="IsEtis()" class="com_input w200">
                                <b id="spanUserName" class="pl10 blue02">6-10位之间</b>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">登录密码：</th>
                            <td>
                                <input name="txtPassword" runat="server" type="password" id="txtPassword" maxlength="16" class="com_input w200">
                                <b id="spanPassword" class="pl10 blue02">6-20位之间</b>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">确认密码：</th>
                            <td>
                                <input name="txtPassword2" runat="server" type="password" id="txtPassword2" maxlength="16" class="com_input w200">
                                <b id="spanPassword2" class="pl10 blue02">请再次输入登录密码。</b>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">性别：</th>
                            <td class="f14">
                                <label class="sex_x">男：</label><input value="0" name="sex" type="radio" id="maleRadio" runat="server" checked=""><label class="sex_x">&nbsp;&nbsp; 女：</label><input value="1" runat="server" name="sex" type="radio"></td>
                        </tr>
                        <tr>
                            <th scope="row">验证码：</th>
                            <td>
                                <input name="txtValidate" runat="server" type="text" id="txtValidate" maxlength="4" class="com_input w100">
                                <img src="ValidateImage.aspx" id="picVerifyCode" onclick="UpdateImage()" style="cursor: pointer; border: 1px solid #333333; width: 70px; height: 26px;" title="点击更换验证码图片!">
                                <a href="javascript:void();" onclick="UpdateImage()">换一个</a></td>
                        </tr>
                        <tr>
                            <th scope="row">&nbsp;</th>
                            <td>
                                <input type="checkbox" id="cbxEnable" name="cbxEnable" checked="checked"><b> 已阅读并同意《<a title="用户服务协议" href="Treaty.aspx" target="_blank">用户服务协议</a>》</b></td>
                        </tr>
                        <tr>
                            <td colspan="2" scope="row" class="pl20">
                                <a href="javascript:void(0)" onclick="OnSubmit();" runat="server" id="aSubmit" class="pass-button-submit">
                                    <img src="images/regbut01.png" border="0">
                                </a>
                                <div style="display: none;">
                                    <asp:Button Text="确认提交" runat="server" ID="btnSubmit" CssClass="button01 cp p10 plr40" OnClick="butSubmit_Click" OnClientClick="return validateInput()" />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <input type="hidden" runat="server" id="rname" name="rname" />
                <input type="hidden" runat="server" id="uidhidden" name="uidhidden" />
            </div>
        </form>
    </div>

    <uc1:SiteFooter runat="server" ID="SiteFooter" />


</body>
</html>
<script type="text/ecmascript">
    function OnSubmit() {
        $("#<%=btnSubmit.ClientID %>").click();
    }

    function UpdateImage() {
        document.getElementById("picVerifyCode").src = "/ValidateImage.aspx?r=" + Math.random();
    }

    function validateInput() {
        if (!$("#cbxEnable").is(":checked")) {
            alert('请同意用户服务协议！');
            return false;
        }
        var regUname = /[a-zA-Z0-9]{6,10}?/g;
        var regPassword = /[a-zA-Z0-9]{5,20}?/g;
        var uname = $("#txtUserName").val();
        var password = $("#txtPassword").val();
        var cword = $("#txtPassword2").val();
        var rname = $("#rname").val();
        var txtValidate = $("#txtValidate").val();
        var sex = $("input[name='sex']:checked").val();
        var message = "";
        if (txtValidate == "" || txtValidate == undefined) {
            message += '验证码不能为空！';
        }
        if (!regUname.test(uname)) {
            message += '账号格式错误，必须大于6位小于等于10位！';
        }
        if (!regPassword.test(password)) {
            message += '密码不对，必须大于5位小于20位！';
        }
        if (cword != password) {
            message += '确认密码需要和输入密码一致！';
        }
        if (sex == null || sex == '') {
            message += '请选择性别！';
        }
        if (message != "") {
            alert(message);
            return false;
        } else {
            return true;
        }
    }
</script>
