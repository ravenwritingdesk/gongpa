<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/main.Master" AutoEventWireup="true" CodeBehind="MemberUpDownScore.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.MemberUpDownScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>会员上下分
                        <small><i class="fa fa-warning"></i>请认真核对会员信息</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">Blank page</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form id="Form1" runat="server">
                <div class="alert alert-success alert-dismissable" style="text-align: left; display: none;" id="message-model">
                </div>
                <table class="table table-bordered" style="text-align: center;">
                    <thead style="text-align: center;">
                        <tr>
                            <th style="width: 50%; text-align: center">代理ID</th>
                            <th style="text-align: center;">余额(金币)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span id="spProxyId" runat="server"></span></td>
                            <td><span id="spGoldCoin" runat="server"></span></td>
                        </tr>
                    </tbody>
                </table>

                <table class="table table-bordered" style="text-align: center;">
                    <thead style="text-align: center;">
                        <tr>
                            <th style="width: 50%; text-align: center">总上分(金币)</th>
                            <th style="text-align: center;">总下分(金币)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span id="spUpScore" runat="server"></span></td>
                            <td><span id="spDownScore" runat="server"></span></td>
                        </tr>
                    </tbody>
                </table>
                <div id="tab2" class="tabson" style="display: block;">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <asp:DropDownList ID="ddlValidateType" CssClass="select3" runat="server">
                                    <asp:ListItem Text="会员ID" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="会员账号" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </span>
                            <input name="email_to" type="text" id="txtUserId" runat="server" class="form-control" placeholder=" " />
                            <span class="input-group-btn">
                                <%--<bu class="btn btn-default" type="button"><i class="fa fa-search"></i>&nbsp;验证</button>--%>
                                <i class="fa fa-search"></i>&nbsp;<asp:Button ID="btnValidateMember" runat="server" Text="验证" class="btn btn-default" OnClick="btnValidateMember_Click" />
                            </span>
                        </div>
                    </div>
                    <div class="form-group" id="liMemberValidate" runat="server" visible="False">
                        <div class="input-group">
                            <table class="table table-bordered table-striped">
                                <tbody>
                                    <tr>
                                        <th>账号名称</th>
                                        <td><span id="spMemberAccount" runat="server"></span></td>

                                        <th>所属代理</th>
                                        <td><span id="spMemberBelongsProxy" runat="server"></span></td>
                                    </tr>
                                    <tr>
                                        <th>银行余额</th>
                                        <td><span id="spMemberScore" runat="server"></span></td>
                                        <th>背包余额</th>
                                        <td><span id="spMemberBackScore" runat="server"></span></td>
                                    </tr>
                                    <tr>
                                        <th>账号状态</th>
                                        <td><span id="spMemberStatus" runat="server"></span></td>
                                        <th>推荐人</th>
                                        <td><span id="spRecommendName" runat="server"></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">金额(RMB)</span>
                            <input name="email_to" id="txtUserOperateNumber" runat="server" type="text" onblur="converttocn(this.value)" onfocus="OperateNumberFocus()" class="form-control" />
                        </div>
                        <div id="cnnumber" style="color: green; font-size: 14px; padding-left: 20px;"></div>
                        <input type="hidden" id="hdChangeScale" runat="server" />
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">交易密码</span>
                            <input name="BankPassword" id="BankPassword" type="password" class="form-control" value="" />
                        </div>
                        <div class="input-group pull-right">
                            <br />
                            &nbsp;<asp:Button ID="btnUserUpScore" runat="server" Text="上分（+）" class="btn" OnClick="btnUserUpScore_Click" OnClientClick="return Validate(0);" Visible="False" />
                            &nbsp;<asp:Button ID="btnUserDownScore" runat="server" Text="下分（-）" class="btn" OnClick="btnUserDownScore_Click" OnClientClick="return Validate(1);" Visible="False" />
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
    <script src="/js/Common.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            $("#<%=txtUserOperateNumber.ClientID%>").val(" ");
        }

        function OperateNumberFocus() {
                    <%=txtUserOperateNumber.Value=txtUserOperateNumber.Value.Trim()%>
        }

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
            //var reg = /^[1-9]\d{1,10}$/;
            //if (!reg.test(num)) {
            //    result = false;
            //    alert(1);
            //} else {
            if (parseFloat(num)< 1 || parseFloat(num) > 10000000000) {
                result = false;
            }
            //}
            if (result == false) {
                alert("每笔充值金额请在1-10,000,000,000之间！!");
                return result;
            }

            var cValue = $('#BankPassword').val();
            if (cValue.length == 0 || cValue == '') {
                $('#BankPassword').focus();
                alert("交易密码不能为空!");
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
                            return true;
                        } else {
                            alert("交易密码验证错误,请重新输入!");
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
</asp:Content>
