<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Game.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="styles/layout.css" rel="stylesheet" type="text/css" />
    <link href="styles/login.css" rel="stylesheet" />
    <script src="scripts/JQuery.js" type="text/javascript"></script>
    <script type="text/javascript">
        function redirect() {
            window.top.location = "/Login.aspx";
        }
        function ChangeCodeimg() {
            Images = document.getElementById("ImageCheck");
            Images.src = "Tools/VerifyImagePage.aspx?" + Math.random();
        }

        function showMsg(msgId, method, txt) {
            var msg, msgTemplate;

            msg = {
                errorUserName: "您输入的用户帐号不正确，请重新输入。",
                emptyUserName: "请填写您的用户帐号。",
                emptyPassword: "请填写登录密码。",
                emptyVerifyCode: "请填写验证码。",
                errorPassowrdTooLong: "登录密码不能超过100个字符。",

                errorNamePassowrd: "您填写的帐号或密码不正确，请再次尝试。",
                errorVerifyCode: "您填写的验证码不正确。",
                errorUserRole: "您的用户帐号不具有管理员身份,不能登陆。",
                errorLogonTimeout: "您的用户帐号登录超时，请重新登陆。",
                frequent: "您登录次数过于频繁，为保障安全，请输入验证码。",
                errorBlockIPErr: "您的IP已被暂时屏蔽，不能登陆，请迟一些时候再尝试。",
                errorBindIP: "您的管理帐号已经绑定指定的IP地址登录。",
                errorNullity: "您的帐号已被禁止使用，请联系管理员了解详细情况。",
                errorUnknown: "服务器未知错误，请稍后再试！"
            };

            if (msgId != undefined && msgId != "") {
                if (!txt) txt = msg[msgId];
                alert(txt);
                return true;
            }
            else {
                return false;
            }
        }

        function CheckInput() {
            var accounts = $("#txtLoginName").val();
            var pass = $("#txtLoginPass").val();
            var verifyCode = $("#txtVerifyCode").val();

            if (accounts == "") {
                showMsg("emptyUserName");
                $("#txtLoginName").focus();
                return false;
            }
            if (pass == "") {
                showMsg("emptyPassword");
                $("#txtLoginPass").focus();
                return false;
            }
            if (pass.length >= 100) {
                showMsg("errorPassowrdTooLong");
                $("#txtLoginPass").focus();
                return false;
            }
            if (verifyCode == "") {
                showMsg("emptyVerifyCode");
                $("#txtVerifyCode").focus();
                return false;
            }
        }
        $(document).ready(function () {
            $("#txtLoginName").focus();
        });
    </script>

    <title>Online game management system</title>
    <style type="text/css">
        <!--
        body {
            /*background-image: url(images/loginBg.jpg);*/
            font-family: "宋体";
        }
        -->
    </style>

</head>
<body>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <form id="form1" runat="server">
        <div class="content">
            <div class="header">
            </div>
            <div class="loginhead">
            </div>
            <div class="logincon">
                <div class="loginwrapbox">
                    <div id="error_tips" class="promptinfo"></div>
                    <div class="logininpitbox">
                        <div class="loginname">
                            <label>
                                <span>UserName：</span>
                                <asp:TextBox ID="txtLoginName" runat="server" CssClass="text"></asp:TextBox>
                            </label>
                            <i id="showUserName"></i>
                        </div>
                        <div class="loginpassword">
                            <label>
                                <span>PassWord：</span>
                                <asp:TextBox ID="txtLoginPass" runat="server" CssClass="text" TextMode="Password"></asp:TextBox>
                            </label>

                            <i id="showPassWord"></i>
                        </div>
                        <div class="captcha">
                            <label>
                                <span>Code：</span>
                                <asp:TextBox ID="txtVerifyCode" runat="server" CssClass="text"></asp:TextBox>
                            </label>
                            <div class="captchaimg">
                                <img src="Tools/VerifyImagePage.aspx" id="ImageCheck" style="cursor: pointer" title="Change Img!" onclick="ChangeCodeimg();" />
                            </div>
                        </div>
                    </div>
                    <div class="forgetword">
                    </div>
                    <div class="loginbtn">
                        <asp:Button ID="btnLogin" runat="server" Text="Post" OnClick="btnLogin_Click" OnClientClick="return CheckInput()"  />
                    </div>
                </div>
            </div>
            <div class="loginfoot">
            </div>
        </div>

        <div class="footer"  onclick="versionClick()">
        <p>
           </p>
        <p>
            </p>
        <p><span style="display:none;" id="versionSpan" runat="server" ></span></p>
    </div>

    </form>
</body>
</html>
<script type="text/javascript">
    function versionClick() {
        if ($("#versionSpan").attr("style") == "display: none;") {
            $("#versionSpan").attr("style", "display:inline;");
        } else {
            $("#versionSpan").attr("style", "display: none;");
        }
    }
</script>