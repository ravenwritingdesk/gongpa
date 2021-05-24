<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayCardFill.aspx.cs" Inherits="UserHandlerWeb.MobileRechargeCenter.PayCardFill" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>充值中心</title>
    <meta name="keywords" content="千鸟游戏,手机游戏,安卓手游,Android,苹果手游,ios,斗地主,捕鱼,街机" />
    <meta name="description" content="千鸟游戏是一款手机游戏与PC游戏数据互通，棋牌平台第一品牌游戏。" />
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <style>
        body {
            max-width: 640px;
            min-width: 320px;
            color: #666;
        }
        .plr40
        {
            height: 21px;
        }
    </style>
</head>

<body>
    <div class="fix-header pr">
        <div class="HeaderMold tl clearfix">
            <p class="fl">
                <img src="/images/logo.png" width="140" height="44" alt="">
            </p>
            <p class="fl white lh40 w5 tc f14">点卡充值</p>
        </div>

    </div>


    <div id="wrapper">
        <form runat="server" id="form1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mt30" runat="server" id="dataTable">
                <tr>
                    <th width="30%" height="40" class="tr" scope="row">卡号余额：</th>
                    <td class="tl fb red"><span id="txtCardPrice" runat="server"></span><b class="gray">金币</b></td>
                </tr>
                <tr>
                    <th width="30%" height="40" class="tr" scope="row">充值账号：</th>
                    <td class="tl">
                        <p>
                            <input id="txtAccounts" runat="server" name="AccountName" type="text" value="">
                            <b class="red">*</b>
                        </p>
                    </td>
                </tr>
                <%--          <tr>
                <th height="40" class="tr" scope="row">充值卡号：</th>
                <td class="tl">
                    <p>
                        <input id="AccountName02" name="AccountName" type="text" value="">
                        <b class="red">*</b>
                    </p>
                </td>
            </tr>
            <tr>
                <th height="40" class="tr" scope="row">充值卡密：</th>
                <td class="tl">
                    <p>
                        <input id="AccountName03" name="AccountName" type="text" value="">
                        <b class="red">*</b>
                    </p>
                </td>
            </tr>
            <tr>
                <th height="40" class="tr" scope="row">验证码：</th>
                <td class="tl">
                    <input id="CheckCode" maxlength="4" name="CheckCode" type="text" value="" class="w100"></td>
            </tr>--%>
                <tr>
                    <th scope="row">&nbsp;</th>
                    <td class="tl">
                        <asp:Button ID="btnPay" runat="server" Text="确认提交" CssClass="button03 cp p10 plr40" OnClick="btnPay_Click" OnClientClick="return Validate()" />
                    </td>
                </tr>
            </table>
            <input type="hidden" value="" id="tokenHidden" runat="server" />
        </form>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mt30" runat="server" id="wartingTable">
            <tr>
                <th width="30%" height="40" class="tr" scope="row">操作提示：</th>

                <td class="tl fb red">
                    <asp:Literal ID="lit99Bill" runat="server"></asp:Literal></td>
            </tr>

        </table>

    </div>
</body>
</html>
<script type="text/javascript">
    function goURL(url) {
        document.location.href = url + "?token=" + $('#' + '<%=this.tokenHidden.ClientID %>').val();
    }

    function Validate() {
        var txtAccounts = $("#<%=this.txtAccounts.ClientID %>").val();
        if (txtAccounts == undefined || txtAccounts == "") {
            alert("用户名不能为空。");
            return false;
        }
        if (confirm("确定为账号" + txtAccounts + "充值吗？")) {
            return true;
        } else {
            return false;
        }
    }
</script>
