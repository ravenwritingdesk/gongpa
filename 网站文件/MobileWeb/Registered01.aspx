<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Registered01.aspx.cs" Inherits="OfficialWap.Web.Registered01" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title><%=title %></title>
    <meta name="keywords" content="手机游戏,安卓手游,Android,苹果手游,ios,斗地主,捕鱼,街机" />
    <meta name="description" content="千鸟游戏是一款手机游戏与PC游戏数据互通，棋牌平台第一品牌游戏。" />
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/widget/slider/slider.css" />
    <link rel="stylesheet" type="text/css" href="css/widget/slider/slider.default.css" />
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <script type="text/javascript" src="http://gmu.baidu.com/dist/zepto.js"></script>
    <script type="text/javascript" src="js/touch.js"></script>
    <script type="text/javascript" src="js/zepto.extend.js"></script>
    <script type="text/javascript" src="js/zepto.ui.js"></script>
    <script type="text/javascript" src="js/widget/slider.js"></script>
</head>



<body>
    <header class="fix-header">
        <div class="cover_content clearfix">
            <a href="javascript:void(0);" class="web_logo"><i class="logo"></i>
                <dl>
                    <dt>
                        <h1><%=webName %></h1>
                    </dt>
                    <dd>享受快乐 享受激情</dd>
                </dl>
            </a>
        </div>
    </header>
    <div class="OcTop"></div>
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
                 <input type="hidden" runat="server" id="rname" name="rname" />
                <input type="hidden" runat="server" id="uidhidden" name="uidhidden" />
                </form>
            </div>
        </div>
    </section>
    <div class=" mt50 mb30"><a id="toTop" class="to_top" href="#top">返回顶部</a></div>
    <div class="common_footer oh">
        <div class="mfoot">
            <p class="pt20 pb40 lh20">
                健康游戏忠告：抵制不良游戏，拒绝盗版游戏;<br>
                注意自我保护，谨防受骗上当，适度游戏益脑;<br>
                沉迷游戏伤身，合理安排时间，享受健康生活;
            </p>
        </div>
    </div>
    <div class="OcBottom"></div>

    <div class="none"></div>
</body>
</html>
<script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
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

