<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpDownScore.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.UpDownScore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <link href="/css/ui-dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/js/dialog-min.js"></script>
    <script type="text/javascript" src="/js/dialog-plus-min.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select3").uedSelect({
                width: 80
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/UpDownScore.aspx">上分下分</a></li>
            </ul>
        </div>

        <div class="formbody">


            <div id="usual1" class="usual">

                <div class="itab">
                    <ul>
                        <li><a href="#tab1" onclick="location.href='/SysRoot/PayOrderManage.aspx#tab1'">订单管理</a></li>
                        <li><a href="#tab2">会员上分下分</a></li>
                        <li><a href="#tab3" onclick="location.href='/SysRoot/ProxyUpScore.aspx#tab3'">代理上分下分</a></li>
                        <li style="display: <%=this.Proxy.belongsAgent == -1 ? "" : "none"%>"><a href="#tab4" onclick="location.href='/SysRoot/PayOrders.aspx#tab4'">充值提现历史</a></li>
                    </ul>
                </div>

                <div id="tab2" class="tabson">

                    <div class="formtext">
                        代理ID：<b><asp:Literal ID="ltProxyID" runat="server"></asp:Literal></b> 金币：<b><asp:Literal ID="ltGoldCoin" runat="server"></asp:Literal></b> &nbsp;
        总上分：<b><a href="/SysRoot/ProxyOperateMemberScoreList.aspx?proxyId=<%= Proxy.ProxyID %>&op=0" class="tablelink"><asp:Literal ID="ltUpScore" runat="server"></asp:Literal></a></b> 总下分：<b><a href="/SysRoot/ProxyOperateMemberScoreList.aspx?proxyId=<%= Proxy.ProxyID %>&op=1" class="tablelink"><asp:Literal ID="ltDownScore" runat="server"></asp:Literal></a></b>
                    </div>

                    <ul class="forminfo">
                        <li>
                            <label>
                                <asp:DropDownList ID="ddlValidateType" CssClass="select3" runat="server">
                                    <asp:ListItem Text="会员ID" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="会员账号" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;</label>
                            <input id="txtUserId" type="text" class="dfinput" value="" style="width: 150px;height: 32px;" runat="server" />&nbsp;<asp:Button ID="btnValidateMember" runat="server"  Text="验证" class="btn" OnClick="btnValidateMember_Click" />
                        </li>
                    </ul>
                    <ul class="forminfo" id="liMemberValidate" runat="server" visible="False">

                        <li>
                            <table class="tablelist">
                                <tbody>
                                   <tr>
                                        <td>账号名称：<asp:Literal ID="ltMemberAccount" runat="server"></asp:Literal></td>

                                        <td>所属代理：<asp:Literal ID="ltMemberBelongsProxy" runat="server"></asp:Literal></td>
                                    </tr>
                                    <tr>
                                        <td>银行余额：<asp:Literal ID="ltMemberScore" runat="server"></asp:Literal></td>
                                        <td>背包余额：<asp:Literal ID="ltMemberBackScore" runat="server"></asp:Literal></td>
                                    </tr>
                                    <tr>
                                        <td>账号状态：<asp:Literal ID="ltMemberStatus" runat="server"></asp:Literal></td>
                                        <td>推荐人：<asp:Literal ID="ltRecommendName" runat="server"></asp:Literal></td>
                                    </tr>
                                </tbody>
                            </table>
                        </li>
                        <li>
                            <label>金额(RMB)：<b>*</b></label>
                            <input name="" type="text" class="dfinput" autocomplete="off" value="" style="width: 150px;" onblur="converttocn(this.value)" id="txtUserOperateNumber" onfocus="OperateNumberFocus()" runat="server" />
                            &nbsp;<div id="cnnumber" style="color: green; font-size: 14px; padding-left: 20px;"></div>
                        <input type="hidden" id="hdChangeScale" runat="server" />
                        </li>
                        <li>
                            <label>交易密码：<b>*</b></label><input name="" type="password" class="dfinput" autocomplete="off" value="" style="width: 150px;" id="BankPassword" runat="server" />
                            &nbsp;<div id="cnpassword" style="color: green; font-size: 14px; padding-left: 20px;"></div>
                        </li>
                        <li>
                            <label>&nbsp;</label>
                            <asp:Button ID="btnUserUpScore" runat="server" Text="上分（+）" OnClientClick="return Validate(0)" class="btn" OnClick="btnUserUpScore_Click" Visible="False" />
                            &nbsp;<asp:Button ID="btnUserDownScore" runat="server" Text="下分（-）" OnClientClick="return Validate(1)" class="btn" OnClick="btnUserDownScore_Click" Visible="False" />

                        </li>
                        
                    </ul>
                </div>
            </div>

            <script type="text/javascript">
                window.onload = function () {
                    $("#<%=txtUserOperateNumber.ClientID%>").val(" ");
                }

                function OperateNumberFocus() {
                    $("#<%=txtUserOperateNumber.ClientID%>").val($("#<%=txtUserOperateNumber.ClientID%>").val().trim());
                }


                $("#usual1 ul").idTabs("tab2");

                function converttocn(num) {
                    if (isNaN(num)) {
                        $("#<%=txtUserOperateNumber.ClientID%>").val("");
                        $("#cnnumber").text("请填写正整数！");
                        return;
                    }
                    var sendNum = num * $("#<%=hdChangeScale.ClientID%>").val();
                    $("#cnnumber").text(ArabiaToChinese(sendNum) + " 金币");
                }


                function Validate(type) {
                    var result = true;
                    var num = $("#<%=txtUserOperateNumber.ClientID%>").val().trim();
                    //var reg = /^[1-9]\d{1,6}$/;
                    //if (!reg.test(num)) {
                    //    result = false;
                    //}
                    if (num < 1 || num > 10000000000) {
                        result = false;
                    }
                    if (result == false) {
                        alert("每笔充值金额请在1-10000000000之间！!");
                        return result;
                    }

                    var cValue = $('#BankPassword').val();
                    if (cValue.length == 0 || cValue == '') {
                        alert("请输入交易密码。");
                        $('#BankPassword').focus();
                        result = false;
                    } else {
                        $.ajax({
                            url: "/ProxyHandler/Proxy.ashx?rd=" + Math.random(),
                            data:
                            {
                                action: "checkOpPass",
                                op: cValue
                            },
                            type: "GET",
                            async: false,
                            cache: false,
                            success: function (data) {
                                if (data == "1") {
                                    result = true;
                                } else {
                                    alert("密码验证错误，请重新输入！");
                                    $('#BankPassword').focus();
                                    result = false;
                                }
                            }
                        });
                    }
                    if (result) {
                        $("#<%=btnUserUpScore.ClientID %>").attr({ "onclick": "return false;", "class": "btn1" });
                        $("#<%=btnUserDownScore.ClientID %>").attr({ "onclick": "return false;", "class": "btn1" });
                    } else {
                        $("#<%=btnUserUpScore.ClientID %>").attr({ "onclick": "return Validate(0);", "class": "btn" });
                        $("#<%=btnUserDownScore.ClientID %>").attr({ "onclick": "return Validate(1);", "class": "btn" });
                    }
                    return result;
                }


            </script>
        </div>
    </form>
</body>
</html>

