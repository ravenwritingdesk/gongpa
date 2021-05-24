<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/Main.Master" AutoEventWireup="true" CodeBehind="ProxyUpDownScore.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.ProxyUpDownScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>代理上下分
                        <small><i class="fa fa-warning"></i>请认真核对代理信息</small>
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
                    <thead>
                        <tr>
                            <th style="width: 50%; text-align: center">代理ID</th>
                            <th style="text-align: center;">余额</th>
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
                    <thead>
                        <tr>
                            <th style="width: 50%; text-align: center">总上分</th>
                            <th style="text-align: center;">总下分</th>
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
                                    <asp:ListItem Text="代理ID" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="代理账号" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </span>
                            <input name="txtProxyId" type="text" id="txtProxyId" runat="server" class="form-control" placeholder=" " />
                            <span class="input-group-btn">
                                <%--<button class="btn btn-default" type="button"><i class="fa fa-search"></i>&nbsp;验证</button>--%>
                                <asp:Button ID="btnValidateProxy" runat="server" Text="验证" class="btn" OnClick="btnValidateProxy_Click" />
                            </span>
                        </div>
                    </div>
                    <div class="form-group" id="liProxyValidate" runat="server" visible="False">
                        <div class="input-group">
                            <div class="input-group">
                                <table class="table table-bordered table-striped" style="width: 100%">
                                    <tbody>
                                        <tr>
                                            <th>账号名称</th>
                                            <td>
                                                <asp:Literal ID="lttProxyAccount" runat="server"></asp:Literal></td>

                                            <th>上级代理</th>
                                            <td>
                                                <asp:Literal ID="ltProxyBelongsProxy" runat="server"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <th>当前余额</th>
                                            <td>
                                                <asp:Literal ID="ltProxyScore" runat="server"></asp:Literal></td>
                                            <th>账号状态</th>
                                            <td>
                                                <asp:Literal ID="ltProxyStatus" runat="server"></asp:Literal></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">金币金额</span>
                            <input name="txtProxyOperateNumber" type="text" id="txtProxyOperateNumber" onblur="converttocn(this.value)" autocomplete="off" runat="server" onfocus="txtProxyOperateNumberFocus()" class="form-control" placeholder="" value="" />
                        </div>
                        <div id="cnnumber" style="color: green; font-size: 14px; padding-left: 20px;"></div>
                        <input type="hidden" id="hdChangeScale" runat="server" />
                        <input type="hidden" id="Hidden1" runat="server" />
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">交易密码</span>
                            <input name="BankPassword" id="BankPassword" type="password" autocomplete="off" class="form-control" placeholder="" />
                        </div>
                        <div class="input-group pull-right">
                            <br />
                            &nbsp;<asp:Button ID="btnProxyUpScore" runat="server" Text="上分（+）" class="btn" OnClick="btnProxyUpScore_Click" OnClientClick="return Validate(0);" Visible="False" />
                            &nbsp;<asp:Button ID="btnProxyDownScore" runat="server" Text="下分（-）" class="btn" OnClick="btnProxyDownScore_Click" OnClientClick="return Validate(1);" Visible="False" />
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </aside>
    <script type="text/javascript" src="/js/Common.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            $("#<%=txtProxyOperateNumber.ClientID%>").val(" ");
        }
        function txtProxyOperateNumberFocus() {
            $("#<%=txtProxyOperateNumber.ClientID%>").val($("#<%=txtProxyOperateNumber.ClientID%>").val().trim());

        }

        function converttocn(num) {
            if (isNaN(num)) {
                $("#<%=txtProxyOperateNumber.ClientID%>").val("");
                $("#cnnumber").text("请填写正整数！");
                return;
            }
            var sendNum = num * $("#<%=hdChangeScale.ClientID%>").val();
            $("#cnnumber").text(ArabiaToChinese(sendNum) + " 金币");
        }


        function Validate() {
            var result = true;
            var num = $("#<%=txtProxyOperateNumber.ClientID%>").val().trim();
            //var reg = /^[1-9]\d{1,10}$/;
            //if (!reg.test(num)) {
            //    result = false;
            //} else {
            //    if (num >= 1 && num <= 10000000000) {
            //        result = true;
            //    }
            //}
            if (num < 1 || num > 10000000000) {
                result = false;
            }
            if (result == false) {
                alert("每笔充值金额请在1-10,000,000,000！!");
                return result;
            }

            var cValue = $('#BankPassword').val();
            if (cValue.length == 0 || cValue == '') {
                alert("交易密码不能为空");
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
                            alert("交易密码验证错误，请重新输入！");
                            $('#BankPassword').focus();
                            result = false;
                        }
                    }
                });
            }
            if (result) {
                $("#<%=btnProxyUpScore.ClientID %>").attr({ "onclick": "return false;", "class": "btn1" });
                $("#<%=btnProxyDownScore.ClientID %>").attr({ "onclick": "return false;", "class": "btn1" });
            } else {
                $("#<%=btnProxyUpScore.ClientID %>").attr({ "onclick": "return Validate(0);", "class": "btn" });
                $("#<%=btnProxyDownScore.ClientID %>").attr({ "onclick": "return Validate(1);", "class": "btn" });
            }
            return result;
        }

    </script>
</asp:Content>

