<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MLogin.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MLogin" %>

<!DOCTYPE html>
<html class="bg-black">
 <head>
        <meta charset="UTF-8">
        <title>手机代理系统登陆</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="/msysroot/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="/msysroot/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="/msysroot/css/AdminLTE.css" rel="stylesheet" type="text/css" />
</head>
 <body class="bg-black">
        <div class="form-box" id="login-box">
            <div class="header">Games Agent System</div>
            <form id="Form1"  method="post"  runat="server">
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="text" name="txtUserName" id="txtUserName" class="form-control"  runat="server" placeholder="账号"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="txtUserPassword" id="txtUserPassword" class="form-control"  runat="server" placeholder="密码"/>
                    </div> 
                </div>
                <div class="footer">                                                               
                    <%--<button type="submit" class="btn bg-olive btn-block">登 录</button>--%> 
                    <asp:Button ID="btnLogin" runat="server" Text="Login"  class="btn bg-olive btn-block" OnClick="btnLogin_Click"/>
                </div>
            </form>
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="/msysroot/js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="/msysroot/js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>
<script language="javascript">
    $(function () {
        $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
        $(window).resize(function () {
            $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
        })
    });
</script> 